package com.project.controller;

import com.project.dto.MemberDTO;
import com.project.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-24
 * Time: 오후 4:12
 * Comments:
 */

@Controller // 컨트롤러의 역할을 수행한다고 명시해주는 어노테이션
public class MemberController {

    private final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Autowired // 의존성주입방법
    private MemberService memberService;

    @RequestMapping("/Login") // 로그인 창
    public String Login() {

        logger.info("Login Page");

        return "member/login";
    }

    @RequestMapping(value="/doLogin", method= RequestMethod.POST) //로그인 처리
    public String doLogin(MemberDTO member, HttpSession session, Model model) throws Exception {
        logger.info("Login");
        //웹에 접근한 사용자 식별하는 방법
        MemberDTO login = memberService.loginMember(member);
        int authkey = login.getAuthkey();

        // 아이디가 틀렸을때
        if(login == null) {
            model.addAttribute("message", "아이디가 틀렸습니다.");
            return "redirect:/Login";
        }

        // 이메일 인증을 안했을때,
        if(authkey == 0) {
            return "redirect:/Login";
        }

        // 로그인정보에서 id값 추출
        boolean passMatch = new BCryptPasswordEncoder().matches(member.getPassword(), login.getPassword());

        if (login != null && passMatch) {
            session.setAttribute("login", login);
            String id = login.getId();
            int idx = login.getIdx();
            session.setAttribute("id", id);
            session.setAttribute("idx", idx);
            //세션에 로그인정보 애트리뷰트와 아이디 애트리뷰트 저장
            return "redirect:/";
        } else { // 비밀번호가 틀렸습니다 알림창 구현
            model.addAttribute("message", "비밀번호가 틀렸습니다.");
            return "redirect:/Login";
        }
    }

    @RequestMapping("/Logout") // 로그아웃
    public String Logout(HttpSession session) {

        session.invalidate();
        logger.info("Logout");
        return "home";
    }

    @RequestMapping("/beforeSignup") // 회원가입 창
    public String beforeSignup()
    {
        return "member/signup";
    }

    @RequestMapping("/Signup") // 회원가입 처리
    public String Signup(@ModelAttribute MemberDTO member, RedirectAttributes rttr) throws Exception {

        String pwdbCrypt = new BCryptPasswordEncoder().encode(member.getPassword()); //비밀번호 암호화

        member.setPassword(pwdbCrypt);
        member.setUsername(member.getId());
        member.setAccountNonExpired(true);
        member.setAccountNonLocked(true);
        member.setEnabled(true);
        member.setCredentialsNonExpired(true);
        member.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));

        memberService.insertMember(member);
        memberService.createAuthorities(member);


        rttr.addFlashAttribute("msg", "가입이 완료되었습니다.");
        rttr.addAttribute("email", member.getEmail());
        rttr.addAttribute("name", member.getName());

        return "home";
    }

    @RequestMapping(value="SignupEmail", method = RequestMethod.GET)
    public String emailConfirm(String email, Model model) throws Exception {
        memberService.updateAuthKey(email);
        model.addAttribute("email", email);

        return"/member/email_confirm";
    }

    @RequestMapping("/info") // 회원정보 조회
    public String selectInfo(MemberDTO member, HttpSession session, Model model) throws Exception {

        int idx = (int) session.getAttribute("idx");
        // 세션 아이디 애트리뷰트에서 아이디값을 가져옴
        MemberDTO user = memberService.selectMember(idx);
        model.addAttribute("user", user);

        return "member/info";
    }

    @RequestMapping("/updateInfo") // 회원정보 수정
    public String updateInfo(MemberDTO member) throws Exception {

        String pwdbCrypt = new BCryptPasswordEncoder().encode(member.getPassword()); // 수정된 비밀번호 암호화
        member.setPassword(pwdbCrypt);
        memberService.updateMember(member);
        return "redirect:/info";
    }

    @RequestMapping("/quitSignup") // 회원탈퇴
    public String quitSignup(MemberDTO member, HttpSession session) throws Exception {

        int idx = (int)session.getAttribute("idx");

        memberService.deleteMember(idx);
        return "home";
    }

    @ResponseBody // 아이디중복체크
    @RequestMapping(value="/checkMember", method=RequestMethod.POST)
    public int checkMember(MemberDTO member) throws Exception {
        int id = memberService.checkId(member);
        return id;
    }

    @RequestMapping("/denied") // 페이지권한이 없을때,
    public String denied(Model model) throws Exception {
        return "member/denied";
    }

    @RequestMapping("/findId_page")
    public String findIdPage() throws Exception{

        return "member/find_id";
    }

    @RequestMapping("/findId")
    public String findId(MemberDTO member, Model model) throws Exception {
        MemberDTO user = memberService.findId(member);

        if(user == null) {
            model.addAttribute("check", 1);
        } else {
            model.addAttribute("check",0);
            model.addAttribute("username", user.getUsername());
        }

        return "member/find_id";
    }

    @RequestMapping("/findPwd_page")
    public String findPwdPage() throws Exception {

        return "/member/find_pwd";
    }

    @RequestMapping("/findPwd")
    @ResponseBody
    public int findPwd(MemberDTO member) throws Exception {

        int pwd = memberService.findPwd(member);
        return pwd;
    }

    @RequestMapping("/updatePwd")
    public String updatePwd(MemberDTO member) throws Exception {
        String pwdbCrypt = new BCryptPasswordEncoder().encode(member.getPassword()); // 수정된 비밀번호 암호화
        member.setPassword(pwdbCrypt);
        memberService.updatePwd(member);

        return "redirect:/Login";
    }
}

package com.project.controller;

import com.project.dto.MemberDTO;
import com.project.service.MemberService;
import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-24
 * Time: 오후 4:12
 * Comments:
 */

@org.springframework.stereotype.Controller
public class MemberController {

    private Logger logger = LoggerFactory.getLogger(Controller.class);

    @Autowired // 의존성주입방법
    private MemberService memberService;

    @RequestMapping("/Login") // 로그인 창
    public String Login() {

        logger.info("Login Page");
        return "member/login";
    }

    @RequestMapping(value="/doLogin", method= RequestMethod.POST) //로그인 처리
    public String doLogin(MemberDTO member, HttpSession session) throws Exception {
        logger.info("Login");

        //웹에 접근한 사용자 식별하는 방법
        MemberDTO login = memberService.loginMember(member);

        // 로그인정보에서 id값 추출
        boolean passMatch = new BCryptPasswordEncoder().matches(member.getPassword(), login.getPassword());

        if(login!=null && passMatch) {
            session.setAttribute("login", login);
            String id = login.getId();
            int idx = login.getIdx();
            session.setAttribute("id", id);
            session.setAttribute("idx", idx);
            //세션에 로그인정보 애트리뷰트와 아이디 애트리뷰트 저장
            return "redirect:/list";
        } else { // 비밀번호가 틀렸습니다 알림창 구현
            return "redirect:/Login";
        }// 아이디가 틀린경우 구현

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
    public String Signup(@ModelAttribute MemberDTO member) throws Exception {

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
        return "home";
    }


    @RequestMapping("/info") // 회원정보 조회
    public String selectInfo(MemberDTO member, HttpSession session, Model model) throws Exception {

        String id = (String)session.getAttribute("id");
        // 세션 아이디 애트리뷰트에서 아이디값을 가져옴
        MemberDTO user = memberService.selectMember(id);
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

        String id = (String)session.getAttribute("id");

        memberService.deleteMember(id);
        return "home";
    }

    @ResponseBody
    @RequestMapping(value="/checkMember", method=RequestMethod.POST)
    public int checkMember(MemberDTO member) throws Exception {
        int result = memberService.checkMember(member);
        return result;
    }

    @RequestMapping("/denied")
    public String denied(Model model) throws Exception {
        return "member/denied";
    }



}

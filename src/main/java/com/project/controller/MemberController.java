package com.project.controller;

import com.project.dto.MemberDTO;
import com.project.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.Principal;

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
    public String Login(@RequestParam(value= "error", required = false) String error, //  value uri에서 바인딩하여 별칭으로 전할 값
                        @RequestParam(value="exception", required = false) String exception, Model model) { //  required 필수적으로 값이 전달되어야 할 파라미터.
        // uri로부터 데이터를 전달받아 사용
        logger.info("Login Page");
        model.addAttribute("error", error);
        model.addAttribute("exception", exception);

        return "member/login";
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
    public String Signup(@ModelAttribute MemberDTO member) throws MessagingException, UnsupportedEncodingException {

        String pwdbCrypt = new BCryptPasswordEncoder().encode(member.getPassword()); //비밀번호 암호화

        // 회원가입시 유저 정보를 넣음
        member.setPassword(pwdbCrypt);
        member.setUsername(member.getId());
        member.setAccountNonExpired(true); // boolean 값
        member.setAccountNonLocked(true);
        member.setEnabled(true);
        member.setCredentialsNonExpired(true);
        member.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_GUEST")); // 사용자 권한 부여

        memberService.createAuthorities(member);
        memberService.insertMember(member);

        Runnable task = new Runnable() { // 스레드가 실행할 작업
            @Override
            public void run() {
                try {
                    memberService.sendMail(member);
                } catch (MessagingException e) { // 메일 예외 처리
                    e.printStackTrace();
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }
        };

        Thread thread = new Thread(task); // 실행할 작업을 담은 thread객체 생성
        thread.start(); // 스레드 시작
        // 스레드 안에 이메일서비스

        return "home";
    }

    @RequestMapping(value="SignupEmail", method = RequestMethod.GET) // 이메일인증
    public String emailConfirm(String email, Model model)  {
        memberService.updateAuthKey(email); // member 테이블 authkey 1로바꿈
        model.addAttribute("email", email);

        return"/member/email_confirm";
    }

    @Secured({"ROLE_GUEST","ROLE_USER","ROLE_ADMIN"})
    @RequestMapping("/Info") // 회원정보 조회
    public String selectInfo(MemberDTO member, Model model)  {

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //
        String username = ((UserDetails)principal).getUsername(); // 스프링시큐리티 principal 인터페이스에서 사용자 정보를 가져옴

        member = memberService.selectMember(username);
        MemberDTO user = memberService.selectMember(username);

        model.addAttribute("user", user);

        return "member/info";
    }

    @Secured({"ROLE_GUEST","ROLE_USER","ROLE_ADMIN"})
    @RequestMapping("/updateInfo") // 회원정보 수정
    public String updateInfo(MemberDTO member)  {

        String pwdbCrypt = new BCryptPasswordEncoder().encode(member.getPassword()); // 수정된 비밀번호 암호화
        member.setPassword(pwdbCrypt);
        memberService.updateMember(member);
        return "redirect:/Info";
    }

    @Secured({"ROLE_GUEST","ROLE_USER","ROLE_ADMIN"})
    @RequestMapping("/quitSignup") // 회원탈퇴
    public String quitSignup(MemberDTO member, HttpSession session) {

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //
        String username = ((UserDetails)principal).getUsername();

        member = memberService.selectMember(username);
        String email = member.getEmail();

        memberService.deleteEmail(email);
        memberService.deleteMember(username);
        memberService.deleteAuthorities(username);

        session.invalidate(); //
        return "redirect:/";
    }

    @ResponseBody // http요청의 바디내용을 통째로 자바객체로 변환해서 매핑된 메소드 파라미터로 전달, ajax활용시 편함
    @RequestMapping(value="/checkId", method=RequestMethod.POST)
    public int checkId(MemberDTO member) throws Exception { // 아이디중복체크, 파라미터
        int id = memberService.checkId(member);
        return id;
    }

    @ResponseBody
    @RequestMapping(value="/checkEmail", method = RequestMethod.POST)
    public int checkEmail(MemberDTO member) { // 이메일중복체크
        int email = memberService.checkEmail(member);
        return email;
    }

    @ResponseBody
    @RequestMapping(value="/checkNickname", method = RequestMethod.POST)
    public int checkNickname(MemberDTO member) { // 닉네임 중복체크
        int nickname = memberService.checkNickname(member);
        return nickname;
    }

    @RequestMapping("/denied") // 페이지권한이 없을때,
    public String denied() {
        return "member/denied";
    }

    @RequestMapping("/findId_page") // 아이디찾기 페이지
    public String findIdPage() {

        return "member/find_id";
    }

    @RequestMapping("/findId") // 아이디찾기
    public String findId(MemberDTO member, Model model) {

        MemberDTO user = memberService.findId(member);

        if(user == null) {
            model.addAttribute("check", 1);
        } else {
            model.addAttribute("check",0);
            model.addAttribute("username", user.getUsername());
        }

        return "member/find_id";
    }

    @RequestMapping("/findPwd_page") // 비밀번호찾기 페이지
    public String findPwdPage()  {

        return "/member/find_pwd";
    }

    @RequestMapping("/findPwd") // 비밀번호찾기
    @ResponseBody
    public int findPwd(MemberDTO member) {

        int pwd = memberService.findPwd(member);
        return pwd;
    }

    @RequestMapping("/updatePwd") // 비밀번호 변경
    public String updatePwd(MemberDTO member) {
        String pwdbCrypt = new BCryptPasswordEncoder().encode(member.getPassword()); // 수정된 비밀번호 암호화
        member.setPassword(pwdbCrypt);
        memberService.updatePwd(member);

        return "redirect:/Login";
    }

    @Secured("ROLE_ADMIN") // 관리자 페이지
    @RequestMapping("/admin")
    public String manageAdmin()  {

        return "manage/admin";
    }
}

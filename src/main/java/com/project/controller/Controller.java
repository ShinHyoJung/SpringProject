package com.project.controller;

import com.project.dto.MemberDTO;
import com.project.service.MemberService;
import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * Created with IntellliJ IDEA.
 * MemberDTO: nandsoft
 * Date: 2022-02-14
 * Time: 오전 11:01
 * Comments:
 */
@org.springframework.stereotype.Controller
public class Controller
{
    private Logger logger = LoggerFactory.getLogger(Controller.class);
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired // 의존성주입방법
    private MemberService memberService;

    @RequestMapping("/") // 홈
    public String home(Model model) {

        return "home";
    }

    @RequestMapping("/login") // 로그인 창
    public String login() {

        logger.info("Login Page");
        return "login";
    }

    @RequestMapping(value="/logindo", method= RequestMethod.POST) //로그인 처리
    public String logindo(MemberDTO member, HttpServletRequest request) throws Exception {
        logger.info("Login");

        HttpSession session = request.getSession(); //웹에 접근한 사용자 식별하는 방법
        MemberDTO login = memberService.loginMember(member);

        boolean passMatch = bCryptPasswordEncoder.matches(member.getPassword(), login.getPassword());

        if(login!=null && passMatch) {
            session.setAttribute("login", login);
            return "redirect:/info";
        } else {
            //로그인정보가 틀렸습니다 알림창 띄우기
            return "redirect:/login";
        }
    }

    @RequestMapping("/beforesignup") // 회원가입 창
    public String beforesignup()
    {
        return "/signup";
    }

    @RequestMapping("/signup") // 회원가입 처리
    public String signup(@ModelAttribute MemberDTO member) throws Exception {

        String pwdbCrypt = bCryptPasswordEncoder.encode(member.getPassword()); //비밀번호 암호화
        member.setPassword(pwdbCrypt);
        memberService.insertMember(member);
        return "home";
    }


    @RequestMapping("/info") // 회원정보 조회
    public String info() {
        return "info";
    }
}

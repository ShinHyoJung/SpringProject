package com.project.controller;

import com.project.dto.UserDTO;
import com.project.service.UserService;
import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * Created with IntellliJ IDEA.
 * UserDTO: nandsoft
 * Date: 2022-02-14
 * Time: 오전 11:01
 * Comments:
 */
@org.springframework.stereotype.Controller
public class Controller
{
    private Logger logger = LoggerFactory.getLogger(Controller.class);


    @Autowired // 의존성주입방법
    private UserService userService;

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
    public String logindo(UserDTO user, HttpServletRequest request) throws Exception {
        logger.info("Login");

        HttpSession session = request.getSession(); //웹에 접근한 사용자 식별하는 방법
        UserDTO res = userService.loginUser(user);

        if(res!=null) {
            session.setAttribute("res", res);
            return "redirect:/info";
        } else {
            //로그인정보가 틀렸습니다 알림창 띄우기
            return "redirect:login";
        }
    }

    @RequestMapping("/beforesignup") // 회원가입 창
    public String beforesignup()
    {
        return "/signup";
    }

    @RequestMapping("/signup") // 회원가입 처리
    public String signup(UserDTO user) throws Exception {

        userService.insertUser(user);
        return "home";
    }

    @RequestMapping("/info") // 회원정보 조회
    public String info() {
        return "info";
    }
}

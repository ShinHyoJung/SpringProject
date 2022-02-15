package com.project.controller;

import com.project.dto.UserDTO;
import com.project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;



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
    @Autowired
    private UserService userService;

    @RequestMapping("/") // 홈
    public String home() {

        return "home";
    }

    @RequestMapping("/login") // 로그인 창
    public String login() {
        return "login";
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
}

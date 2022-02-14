package com.project.controller;

import com.project.dto.User;
import com.project.service.UserService;
import com.project.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;


/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-14
 * Time: 오전 11:01
 * Comments:
 */
@org.springframework.stereotype.Controller
public class Controller
{

    @Autowired
    UserService userservice;

    @RequestMapping("/")
    public String home() {

        return "home";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/beforesignup") // 회원가입 창
    public String beforesignup()
    {
        return "/signup";
    }

    @RequestMapping("/signup") // 회원가입 처리
    public String signup(User user) {

        userservice.insertUser(user);
        return "login";

    }
}

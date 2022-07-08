package com.project.controller;


import com.project.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ApiController {

    @Autowired
    MemberService memberService;

    @ResponseBody
    @RequestMapping(value = "/api/checkUser", produces = "application/json;charset=UTF-8", method= RequestMethod.POST)
    public String getCheckUser(@RequestBody String requestBody) {
        System.out.println(requestBody);
        int idx = Integer.parseInt(requestBody);
        String username = memberService.checkUser(idx);

        System.out.println(username);

        return username;
    }

}

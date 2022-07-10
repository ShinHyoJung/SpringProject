package com.project.controller;


import com.project.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;


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

    @RequestMapping(value ="/qrCode", produces="application/json;charset=utf-8")
    public String getQrCode(Model model) {
        String url = "http://localhost:8070/developer/postQrCode";
        RestTemplate restTemplate = new RestTemplate();
        String img = restTemplate.getForObject(url, String.class);
        model.addAttribute("img",img);
        return "/board/qrCode";
    }
}

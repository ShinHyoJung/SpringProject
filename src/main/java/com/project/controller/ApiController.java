package com.project.controller;


import com.project.service.MemberService;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.protocol.HTTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

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
        /*
        HttpClient httpClient = HttpClientBuilder.create().build();
        HttpPost httpPost = new HttpPost("http://localhost:8070/demo/apiget");
        httpPost.setEntity(new StringEntity(username, HTTP.UTF_8));
         */
        /*
        try {
           // HttpResponse response = httpClient.execute(httpPost);
        } catch (IOException e) {
            e.printStackTrace();
        }

         */
        return username;
    }


}

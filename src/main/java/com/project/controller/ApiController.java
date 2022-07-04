package com.project.controller;


import com.project.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;

@Controller
public class ApiController {

    @Autowired
    MemberService memberService;

    @ResponseBody
    @RequestMapping("/api/checkUser")
    public String getCheckUser(@RequestBody String requestBody) {
        System.out.println(requestBody);
        int idx = Integer.parseInt(requestBody);
        String username = memberService.checkUser(idx);

        System.out.println(username);
        /*
        String response = "";
        try
        {
            URL url = new URL("http://localhost:8070/demo/apiGet");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            conn.setConnectTimeout(10000);
            conn.setReadTimeout(10000);
            conn.setDoOutput(true);

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            bw.write(username);
            bw.flush();
            bw.close();

            Charset charset = Charset.forName("UTF-8");
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), charset));

            String inputLine;
            StringBuffer sb = new StringBuffer();
            while((inputLine = br.readLine()) != null) {
                sb.append(inputLine);
            }
            br.close();

            response = sb.toString();
        }
        catch (Exception e) {
            e.printStackTrace();
        }

         */
        return username;
    }


}

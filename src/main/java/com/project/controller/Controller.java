package com.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


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
    private Logger logger = LoggerFactory.getLogger(Controller.class); // 로그를 사용하기위해 선언

    @RequestMapping("/") // 홈, 컨트롤러에 들어오는 요청을 처리하는 기준점 url+value로 매핑
    public String Home() {
        logger.info("home"); // 로그의 info레벨 사용
        return "home";
    }
 //


}

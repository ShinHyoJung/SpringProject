package com.project.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
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
    private static final Logger logger =  LogManager.getLogger(Controller.class);

    @RequestMapping("/") // 홈
    public String Home(Model model) {

        logger.info("Home");
        return "home";
    }



}

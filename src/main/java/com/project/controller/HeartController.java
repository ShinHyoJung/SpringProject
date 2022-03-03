package com.project.controller;

import com.project.dto.BoardDTO;
import com.project.dto.HeartDTO;
import com.project.service.BoardService;
import com.project.service.HeartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-03-02
 * Time: 오전 11:22
 * Comments:
 */

@Controller
public class HeartController {

    @Autowired
    HeartService heartService;

    @RequestMapping("/insertHeart")
    @ResponseBody
    public String insertHeart(HeartDTO heart) throws Exception {
        heartService.insertHeart(heart);
        return "success";
    }

    @RequestMapping("/deleteHeart")
    @ResponseBody
    public String deleteHeart(HeartDTO heart) throws Exception {

        int hno = heart.getHno();
        heartService.deleteHeart(hno);
        return "success";
    }

    @RequestMapping("/updateHeart")
    @ResponseBody
    public String updateHeart(HeartDTO heart) throws Exception {

        heartService.updateHeart(heart);
        return "success";
    }
}

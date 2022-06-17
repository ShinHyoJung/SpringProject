package com.project.controller;

import com.project.vo.Heart;
import com.project.service.HeartService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Secured({"ROLE_USER","ROLE_ADMIN"})
    @RequestMapping("/insertHeart") // 좋아요 하트생성
    @ResponseBody
    public String insertHeart(Heart heart) {

        logger.info("insert_heart");
        heartService.insertHeart(heart);
        return "success";
    }

    @Secured({"ROLE_USER","ROLE_ADMIN"})
    @RequestMapping("/deleteHeart") // 좋아요 하트 삭제
    @ResponseBody
    public String deleteHeart(Heart heart) {

        logger.info("delete_heart");

        int hno = heart.getHno();
        heartService.deleteHeart(hno);
        return "success";
    }

    @Secured({"ROLE_USER","ROLE_ADMIN"})
    @RequestMapping("/updateHeart") // 하트 삭제후 다시 생성시,
    @ResponseBody
    public String updateHeart(Heart heart) {

        logger.info("update_heart");

        heartService.updateHeart(heart);
        return "success";
    }
}

package com.project.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-14
 * Time: 오전 11:01
 * Comments:
 */
@Controller
public class controller {

    @RequestMapping("/")
    public String home() {

        return "index";
    }
}

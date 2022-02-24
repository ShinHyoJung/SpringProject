package com.project.controller;

import com.project.dto.BoardDTO;
import com.project.dto.Criteria;
import com.project.dto.MemberDTO;
import com.project.dto.PagingDTO;
import com.project.service.BoardService;
import com.project.service.MemberService;
import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import java.util.List;


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
    private Logger logger = LoggerFactory.getLogger(Controller.class);

    @RequestMapping("/") // 홈
    public String Home(Model model) {

        logger.info("Home");
        return "home";
    }



}

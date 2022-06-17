package com.project.controller;

import com.project.vo.Comment;
import com.project.service.CommentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-24
 * Time: 오후 4:29
 * Comments:
 */

@Controller
public class CommentController {

    @Autowired
    CommentService commentService;

    private Logger logger = LoggerFactory.getLogger(this.getClass());


    @Secured({"ROLE_USER","ROLE_ADMIN"})
    @RequestMapping("/writeComment")
    public String writeComment(Comment comment) { // 댓글 쓰기

        logger.info("write_comment");
        commentService.insertComment(comment);
        int bno = comment.getBno();
        return "redirect:read/"+bno;
    }

    @Secured({"ROLE_USER","ROLE_ADMIN"})
    @RequestMapping("/deleteComment")
    public String deleteComment(Comment comment) { // 댓글 삭제

        logger.info("delete_comment");
        commentService.deleteComment(comment);
        int bno= comment.getBno();
        return "redirect:read/" + bno;
    }

    @Secured({"ROLE_USER","ROLE_ADMIN"})
    @RequestMapping("/updateComment")
    public String updateComment(Comment comment, Model model) { // 댓글 수정

        logger.info("update_comment");
        commentService.updateComment(comment);
        int bno = comment.getBno();
        List<Comment> comments = commentService.selectComment(comment);
        model.addAttribute("comments", comments);
        return "/comment";
    }

}

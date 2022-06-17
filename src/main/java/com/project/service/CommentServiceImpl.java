package com.project.service;

import com.project.dao.CommentDAO;
import com.project.vo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-24
 * Time: 오후 4:26
 * Comments:
 */

@Service
public class CommentServiceImpl implements CommentService{

    @Autowired
    CommentDAO commentDAO;

    @Override
    public void insertComment(Comment comment) {
        commentDAO.insertComment(comment);
    }

    @Override
    public List<Comment> selectComment(Comment comment) {
        return commentDAO.selectComment(comment);
    }

    @Override
    public void deleteComment(Comment comment)  {
        commentDAO.deleteComment(comment);
    }

    @Override
    public void updateComment(Comment comment) {
        commentDAO.updateComment(comment);
    }
}

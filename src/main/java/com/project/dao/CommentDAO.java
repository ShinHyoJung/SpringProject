package com.project.dao;

import com.project.vo.Comment;

import java.util.List;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-24
 * Time: 오후 4:25
 * Comments:
 */
public interface CommentDAO {

    void insertComment(Comment comment);

    List<Comment> selectComment(Comment comment);

    void deleteComment(Comment comment);

    void updateComment(Comment comment);
}

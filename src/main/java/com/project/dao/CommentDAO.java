package com.project.dao;

import com.project.dto.CommentDTO;

import java.util.List;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-24
 * Time: 오후 4:25
 * Comments:
 */
public interface CommentDAO {

    void insertComment(CommentDTO comment) throws Exception;

    List<CommentDTO> selectComment(CommentDTO comment) throws Exception;

    void deleteComment(CommentDTO comment) throws Exception;

    void updateComment(CommentDTO comment) throws Exception;
}

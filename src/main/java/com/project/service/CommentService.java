package com.project.service;

import com.project.dto.CommentDTO;

import java.util.List;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-24
 * Time: 오후 4:27
 * Comments:
 */
public interface CommentService {

    void insertComment(CommentDTO comment);

    List<CommentDTO> selectComment(CommentDTO comment);

    void deleteComment(CommentDTO comment);

    void updateComment(CommentDTO comment);
}

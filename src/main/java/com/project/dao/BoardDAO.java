package com.project.dao;

import com.project.dto.BoardDTO;

import java.util.List;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-21
 * Time: 오전 8:36
 * Comments:
 */
public interface BoardDAO {

    void writeBoard(BoardDTO board) throws Exception;

    List<BoardDTO> viewBoard() throws Exception;

    BoardDTO readBoard(int bid) throws Exception;
}

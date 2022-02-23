package com.project.service;

import com.project.dao.BoardDAO;
import com.project.dto.BoardDTO;
import com.project.dto.Criteria;
import com.project.dto.PagingDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-21
 * Time: 오전 8:37
 * Comments:
 */

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    BoardDAO boardDAO;

    @Override
    public void writeBoard(BoardDTO board) throws  Exception {
        boardDAO.writeBoard(board);
    }

    @Override
    public List<BoardDTO> viewBoard(Criteria cri) throws Exception {
        return boardDAO.viewBoard(cri);
    }

    @Override
    public BoardDTO readBoard(int bno) throws Exception {

        boardDAO.hitBoard(bno);
        return boardDAO.readBoard(bno);
    }

    @Override
    public BoardDTO modifyBoard(int bno) throws Exception {
        return boardDAO.modifyBoard(bno);
    }

    @Override
    public void updateBoard(BoardDTO board) throws Exception {
        boardDAO.updateBoard(board);
    }

    @Override
    public void deleteBoard(int bno) throws Exception {
        boardDAO.deleteBoard(bno);
    }

    @Override
    public int countBoard(Criteria cri) throws Exception {
        return boardDAO.countBoard(cri);
    }

    @Override
    public List<BoardDTO> searchBoard(String bwriter) throws Exception {
        return boardDAO.searchBoard(bwriter);
    }

}

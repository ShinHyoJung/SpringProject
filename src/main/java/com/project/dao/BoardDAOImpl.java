package com.project.dao;

import com.project.dto.BoardDTO;
import com.project.dto.Criteria;
import com.project.dto.PagingDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-21
 * Time: 오전 8:36
 * Comments:
 */

@Repository
public class BoardDAOImpl implements BoardDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public void writeBoard(BoardDTO board) throws Exception {
        sqlSession.insert("writeBoard", board);
    }

    @Override
    public List<BoardDTO> viewBoard(Criteria cri) throws Exception {
        return sqlSession.selectList("viewBoard", cri);
    }

    @Override
    public BoardDTO readBoard(int bno) throws Exception {
        return sqlSession.selectOne("readBoard", bno);
    }

    @Override
    public BoardDTO modifyBoard(int bno) throws Exception {
        return sqlSession.selectOne("modifyBoard", bno);
    }
    @Override
    public void updateBoard(BoardDTO board) throws Exception {
        sqlSession.update("updateBoard", board);
    }

    @Override
    public void deleteBoard(int bno) throws Exception {
        sqlSession.delete("deleteBoard", bno);
    }

    @Override
    public int hitBoard(int bno) throws Exception {
        return sqlSession.update("hitBoard", bno);
    }

    @Override
    public int countBoard() throws Exception {
        return (Integer) sqlSession.selectOne("countBoard");
    }
}

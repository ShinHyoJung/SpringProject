package com.project.dao;

import com.project.dto.BoardDTO;
import com.project.dto.Criteria;
import com.project.dto.PagingDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public void insertBoard(BoardDTO board)  {
        sqlSession.insert("insertBoard", board);
    }

    @Override
    public List<BoardDTO> viewBoard(Criteria cri)  {
        return sqlSession.selectList("viewBoard", cri);
    }

    @Override
    public BoardDTO selectBoard(int bno)  {
        return sqlSession.selectOne("selectBoard", bno);
    }

    @Override
    public BoardDTO modifyBoard(int bno)  {
        return sqlSession.selectOne("modifyBoard", bno);
    }
    @Override
    public void updateBoard(BoardDTO board)  {
        sqlSession.update("updateBoard", board);
    }

    @Override
    public void deleteBoard(int bno) {
        sqlSession.delete("deleteBoard", bno);
    }

    @Override
    public int hitBoard(int bno) {
        return sqlSession.update("hitBoard", bno);
    }

    @Override
    public int countBoard(Criteria cri)  {
        return (Integer) sqlSession.selectOne("countBoard", cri);
    }

    @Override
    public List<BoardDTO> writerBoard(String bwriter)  {
        return sqlSession.selectList("writerBoard", bwriter);
    }

    @Override
    public int searchBoard(String bwriter) {
        return sqlSession.selectOne("searchBoard", bwriter);
    }

    @Override
    public BoardDTO heartBoard(int bno)  {
        return sqlSession.selectOne("heartBoard", bno);
    }

    @Override
    public void upBoard(int bno) {
        sqlSession.update("upBoard", bno);
    }

    @Override
    public void downBoard(int bno) {
        sqlSession.update("downBoard", bno);
    }

    @Override
    public void insertFile(Map<String, Object> map)  {
        sqlSession.insert("insertFile", map);
    }

    @Override
    public List<Map<String, Object>> selectFile(int bno) {
        return sqlSession.selectList("selectFile", bno);
    }

    @Override
    public Map<String, Object> downFile(Map<String, Object> map)  {
        return sqlSession.selectOne("downFile", map);
    }

    @Override
    public void updateFile(Map<String, Object> map)  {
        sqlSession.update("updateFile", map);
    }

}

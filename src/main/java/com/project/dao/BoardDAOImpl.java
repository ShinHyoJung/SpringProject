package com.project.dao;

import com.project.vo.Board;
import com.project.dto.Criteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
    public void insertBoard(Board board)  {
        sqlSession.insert("insertBoard", board);
    }

    @Override
    public List<Board> viewBoard(Criteria cri)  {
        return sqlSession.selectList("viewBoard", cri);
    }

    @Override
    public Board selectBoard(int bno)  {
        return sqlSession.selectOne("selectBoard", bno);
    }

    @Override
    public Board modifyBoard(int bno)  {
        return sqlSession.selectOne("modifyBoard", bno);
    }

    @Override
    public void updateBoard(Board board)  {
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
    public List<Board> writerBoard(String bwriter)  {
        return sqlSession.selectList("writerBoard", bwriter);
    }

    @Override
    public int searchBoard(String bwriter) {
        return sqlSession.selectOne("searchBoard", bwriter);
    }

    @Override
    public Board heartBoard(int bno)  {
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

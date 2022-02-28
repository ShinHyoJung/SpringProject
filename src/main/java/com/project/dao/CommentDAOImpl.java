package com.project.dao;

import com.project.dto.CommentDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-24
 * Time: 오후 4:26
 * Comments:
 */

@Repository
public class CommentDAOImpl implements CommentDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public void insertComment(CommentDTO comment) throws Exception {
        sqlSession.insert("insertComment", comment);
    }

    @Override
    public List<CommentDTO> selectComment(CommentDTO comment) throws Exception {
        return sqlSession.selectList("selectComment", comment);
    }

    @Override
    public void deleteComment(CommentDTO comment) throws Exception {
        sqlSession.delete("deleteComment", comment);
    }

    @Override
    public void updateComment(CommentDTO comment) throws Exception {
        sqlSession.update("updateComment", comment);
    }
}

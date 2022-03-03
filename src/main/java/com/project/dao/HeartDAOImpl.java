package com.project.dao;


import com.project.dto.HeartDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class HeartDAOImpl implements HeartDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public void insertHeart(HeartDTO heart) throws Exception {
        sqlSession.insert("insertHeart", heart);
    }

    @Override
    public HeartDTO selectHeart(Map<String, Integer> num) throws Exception {
        return sqlSession.selectOne("selectHeart", num);
    }

    @Override
    public void deleteHeart(int hno) throws Exception {
        sqlSession.delete("deleteHeart", hno);
    }

    @Override
    public void updateHeart(HeartDTO heart) throws Exception {
        sqlSession.update("updateHeart", heart);
    }
}



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
    public void insertHeart(HeartDTO heart){
        sqlSession.insert("insertHeart", heart);
    }

    @Override
    public HeartDTO selectHeart(Map<String, Integer> num){
        return sqlSession.selectOne("selectHeart", num);
    }

    @Override
    public void deleteHeart(int hno) {
        sqlSession.delete("deleteHeart", hno);
    }

    @Override
    public void updateHeart(HeartDTO heart) {
        sqlSession.update("updateHeart", heart);
    }
}



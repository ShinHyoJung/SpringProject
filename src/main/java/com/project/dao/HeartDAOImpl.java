package com.project.dao;


import com.project.vo.Heart;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class HeartDAOImpl implements HeartDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public void insertHeart(Heart heart){
        sqlSession.insert("insertHeart", heart);
    }

    @Override
    public Heart selectHeart(Map<String, Integer> num){
        return sqlSession.selectOne("selectHeart", num);
    }

    @Override
    public void deleteHeart(int hno) {
        sqlSession.delete("deleteHeart", hno);
    }

    @Override
    public void updateHeart(Heart heart) {
        sqlSession.update("updateHeart", heart);
    }
}



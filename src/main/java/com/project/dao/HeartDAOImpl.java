package com.project.dao;


import com.project.dto.HeartDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class HeartDAOImpl implements HeartDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public HeartDTO selectHeart(Map<String, Integer> number) throws Exception {
        return sqlSession.selectOne("selectHeart", number);
    }

}

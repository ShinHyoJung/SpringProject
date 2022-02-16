package com.project.dao;

import com.project.dto.UserDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-15
 * Time: 오전 9:19
 * Comments:
 */

@Repository
public class UserDAOImpl implements UserDAO { //mapper에서 Impl을 사용함

    @Autowired
    SqlSession sqlSession;

    @Override
    public void insertUser(UserDTO user) throws Exception {
        sqlSession.insert("insertUser", user);
    }

    @Override
    public UserDTO loginUser(UserDTO user) throws Exception {
        UserDTO res = null;

        try {
            res = sqlSession.selectOne("loginUser",user);
        }catch(Exception e) {
            e.printStackTrace();
        }

        return res;
    }
}

package com.project.dao;

import javax.annotation.Resource;
import javax.inject.Inject;
import com.project.dto.UserDTO;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
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
public class UserDAOImpl implements UserDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public void insertUser(UserDTO user) throws Exception {
        sqlSession.insert("insertUser", user);
    }
}

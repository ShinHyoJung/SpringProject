package com.project.service;

import com.project.dao.UserDAO;
import com.project.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-14
 * Time: 오후 3:37
 * Comments:
 */
@Service("UserServiceImpl")
public class UserServiceImpl implements UserService
{

    @Autowired
    UserDAO userdao;

    @Override
    public void insertUser(User user) {
        userdao.insertUser(user);
    }
}

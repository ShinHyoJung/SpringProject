package com.project.service;

import com.project.dao.UserDAO;
import com.project.dao.UserDAOImpl;
import com.project.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.inject.Named;

/**
 * Created with IntellliJ IDEA.
 * UserDTO: nandsoft
 * Date: 2022-02-14
 * Time: 오후 3:37
 * Comments:
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDAO userdao;

    @Override
    public void insertUser(UserDTO user) throws Exception {

        userdao.insertUser(user);
    }

    @Override
    public UserDTO loginUser(UserDTO user) throws Exception {
        return userdao.loginUser(user);
    }

}

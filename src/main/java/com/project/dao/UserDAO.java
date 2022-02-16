package com.project.dao;

import com.project.dto.UserDTO;

/**
 * Created with IntellliJ IDEA.
 * UserDTO: nandsoft
 * Date: 2022-02-14
 * Time: 오후 1:29
 * Comments:
 */

public interface UserDAO
{
    public void insertUser(UserDTO user) throws Exception;

    public UserDTO loginUser(UserDTO user) throws Exception;
}

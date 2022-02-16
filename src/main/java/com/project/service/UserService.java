package com.project.service;

import com.project.dto.UserDTO;

/**
 * Created with IntellliJ IDEA.
 * UserDTO: nandsoft
 * Date: 2022-02-14
 * Time: 오후 3:38
 * Comments:
 */


public interface UserService
{

   public void insertUser(UserDTO user) throws Exception;

   public UserDTO loginUser(UserDTO user) throws Exception;
}

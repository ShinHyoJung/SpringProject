package com.project.dao;

import com.project.dto.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-14
 * Time: 오후 1:29
 * Comments:
 */
@Mapper
public interface UserDAO
{

    public void insertUser(User user);
}

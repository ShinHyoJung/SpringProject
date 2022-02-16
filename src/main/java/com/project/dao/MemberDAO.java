package com.project.dao;

import com.project.dto.MemberDTO;

/**
 * Created with IntellliJ IDEA.
 * MemberDTO: nandsoft
 * Date: 2022-02-14
 * Time: 오후 1:29
 * Comments:
 */

public interface MemberDAO
{
    public void insertMember(MemberDTO member) throws Exception;

    public MemberDTO loginMember(MemberDTO member) throws Exception;
}

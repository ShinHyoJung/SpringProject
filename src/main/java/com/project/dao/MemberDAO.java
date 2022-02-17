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
        void insertMember(MemberDTO member) throws Exception;

        MemberDTO loginMember(MemberDTO member) throws Exception;
    }

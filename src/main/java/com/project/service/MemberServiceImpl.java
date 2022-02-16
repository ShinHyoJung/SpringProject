package com.project.service;

import com.project.dao.MemberDAO;
import com.project.dto.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created with IntellliJ IDEA.
 * MemberDTO: nandsoft
 * Date: 2022-02-14
 * Time: 오후 3:37
 * Comments:
 */
@Service
public class MemberServiceImpl implements MemberService
{

    @Autowired
    MemberDAO userdao;

    @Override
    public void insertMember(MemberDTO member) throws Exception {

        userdao.insertMember(member);
    }

    @Override
    public MemberDTO loginMember(MemberDTO member) throws Exception {
        return userdao.loginMember(member);
    }

}

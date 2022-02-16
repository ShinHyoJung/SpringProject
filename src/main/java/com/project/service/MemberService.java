package com.project.service;

import com.project.dto.MemberDTO;

/**
 * Created with IntellliJ IDEA.
 * MemberDTO: nandsoft
 * Date: 2022-02-14
 * Time: 오후 3:38
 * Comments:
 */


public interface MemberService
{

   public void insertMember(MemberDTO member) throws Exception;

   public MemberDTO loginMember(MemberDTO member) throws Exception;
}

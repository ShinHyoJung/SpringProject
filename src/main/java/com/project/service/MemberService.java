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


   void insertMember(MemberDTO member) throws Exception;

   MemberDTO loginMember(MemberDTO member) throws Exception;

   MemberDTO selectMember(String id) throws Exception;

   void updateMember(MemberDTO member) throws Exception;

   void deleteMember(String id) throws Exception;
   int checkMember(MemberDTO member) throws Exception;
}

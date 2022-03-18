package com.project.service;

import com.project.dto.MemberDTO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.Collection;

/**
 * Created with IntellliJ IDEA.
 * MemberDTO: nandsoft
 * Date: 2022-02-14
 * Time: 오후 3:38
 * Comments:
 */


public interface MemberService extends UserDetailsService
{
   UserDetails loadUserByUsername(String username);

   Collection<GrantedAuthority> getAuthorities(String username);

   void createAuthorities(MemberDTO member) throws Exception;

   void insertMember(MemberDTO member) throws Exception;

   MemberDTO loginMember(String username);
   MemberDTO selectMember(String username) throws Exception;

   void updateMember(MemberDTO member) throws Exception;

   void deleteMember(int idx) throws Exception;

   int checkId(MemberDTO member) throws Exception;

   MemberDTO findId(MemberDTO username) throws Exception;

   void updateAuthKey(String email) throws Exception;

   int findPwd(MemberDTO member) throws Exception;

   void updatePwd(MemberDTO member) throws Exception;
}

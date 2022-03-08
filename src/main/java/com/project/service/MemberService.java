package com.project.service;

import com.project.dto.MemberDTO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

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
   UserDetails loadUserByUsername(String username) throws UsernameNotFoundException;

   Collection<GrantedAuthority> getAuthorities(String username)  throws Exception;

   void createAuthorities(MemberDTO member) throws Exception;

   void insertMember(MemberDTO member) throws Exception;

   MemberDTO loginMember(MemberDTO member) throws Exception;

   MemberDTO selectMember(String id) throws Exception;

   void updateMember(MemberDTO member) throws Exception;

   void deleteMember(String id) throws Exception;

   int checkMember(MemberDTO member) throws Exception;

   MemberDTO readMember(String username) throws Exception;
}

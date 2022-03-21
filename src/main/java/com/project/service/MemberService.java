package com.project.service;

import com.project.dto.MemberDTO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
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

   void createAuthorities(MemberDTO member) ;

   void insertMember(MemberDTO member) throws MessagingException, UnsupportedEncodingException;

   MemberDTO loginMember(String username);

   MemberDTO selectMember(String username) ;

   void updateMember(MemberDTO member);

   void deleteMember(int idx);

   int checkId(MemberDTO member);

   int checkEmail(MemberDTO member);

   MemberDTO findId(MemberDTO username);

   void updateAuthKey(String email);

   int findPwd(MemberDTO member);

   void updatePwd(MemberDTO member);
}

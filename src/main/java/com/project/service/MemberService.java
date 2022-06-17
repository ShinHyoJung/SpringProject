package com.project.service;

import com.project.vo.Member;
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

   void insertMember(Member member) throws MessagingException, UnsupportedEncodingException;

   Member loginMember(String username);

   Member selectMember(String username) ;

   void updateMember(Member member);

   void updateEmail(Member member);

   void deleteMember(String username);

   int checkId(Member member);

   int checkEmail(Member member);

   int checkNickname(Member member);

   Member findId(Member username);

   Collection<GrantedAuthority> getAuthorities(String username);

   void createAuthorities(Member member) ;

   void deleteAuthorities(String username);

   void updateAuthorities(String username);

   void updateAuthKey(String email);

   int findPwd(Member member);

   void updatePwd(Member member);

   void sendMail(Member member) throws MessagingException, UnsupportedEncodingException;

   void deleteEmail(String email);
}

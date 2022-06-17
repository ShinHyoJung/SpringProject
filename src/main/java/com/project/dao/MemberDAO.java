package com.project.dao;

import com.project.vo.Member;
import org.springframework.security.core.GrantedAuthority;

import java.util.List;

/**
 * Created with IntellliJ IDEA.
 * MemberDTO: nandsoft
 * Date: 2022-02-14
 * Time: 오후 1:29
 * Comments:
 */

public interface MemberDAO
    {
        void insertMember(Member member);

        Member loginMember(String username);

        Member selectMember(String username);

        void updateMember(Member member);

        void updateEmail(Member member);

        void deleteMember(String username);

        int checkId(Member member);

        int checkEmail(Member member);

        int checkNickname(Member member);

        Member findId(Member member);

        List<GrantedAuthority> readAuthorities(String username);

        void createAuthorities(Member member);

        void deleteAuthorities(String username);

        void updateAuthorities(String username);

        void insertAuthKey(String email, String authkey);

        void updateAuthKey(String email);

        int findPwd(Member member);

        void updatePwd(Member member);

        void deleteEmail(String email);
    }

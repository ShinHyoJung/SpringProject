package com.project.dao;

import com.project.dto.MemberDTO;
import org.springframework.security.core.GrantedAuthority;

import java.lang.reflect.Member;
import java.util.List;
import java.util.Map;

/**
 * Created with IntellliJ IDEA.
 * MemberDTO: nandsoft
 * Date: 2022-02-14
 * Time: 오후 1:29
 * Comments:
 */

public interface MemberDAO
    {
        void insertMember(MemberDTO member);

        MemberDTO loginMember(String username);

        MemberDTO selectMember(String username);

        void updateMember(MemberDTO member);

        void deleteMember(String username);

        int checkId(MemberDTO member);

        int checkEmail(MemberDTO member);

        int checkNickname(MemberDTO member);

        MemberDTO findId(MemberDTO member);

        List<GrantedAuthority> readAuthorities(String username);

        void createAuthorities(MemberDTO member);

        void deleteAuthorities(String username);

        void updateAuthorities(String username);

        void insertAuthKey(String email, String authkey);

        void updateAuthKey(String email);

        int findPwd(MemberDTO member);

        void updatePwd(MemberDTO member);

        void deleteEmail(String email);
    }

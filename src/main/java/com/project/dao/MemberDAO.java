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

        List<GrantedAuthority> readAuthorities(String username) throws Exception;

        void createAuthorities(MemberDTO member) throws Exception;

        void insertMember(MemberDTO member) throws Exception;

        MemberDTO loginMember(MemberDTO member) throws Exception;

        MemberDTO selectMember(int idx) throws Exception;

        void updateMember(MemberDTO member) throws Exception;

        void deleteMember(int idx) throws Exception;

        int checkId(MemberDTO member) throws Exception;

        MemberDTO readMember(String username) throws Exception;

        MemberDTO findId(MemberDTO member) throws Exception;

        void insertAuthKey(String email, String authkey) throws Exception;

        void updateAuthKey(String email) throws Exception;

        int findPwd(MemberDTO member) throws Exception;

        void updatePwd(MemberDTO member) throws Exception;
    }

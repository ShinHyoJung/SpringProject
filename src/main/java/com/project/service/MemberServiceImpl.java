package com.project.service;

import com.project.dao.MemberDAO;
import com.project.dto.MemberDTO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

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
    MemberDAO memberDAO;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        MemberDTO member = null;
        try {
            member = memberDAO.readMember(username);
            member.setAuthorities(getAuthorities(username));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return member;
    }

    @Override
    public Collection<GrantedAuthority> getAuthorities(String username)  throws Exception {
        List<GrantedAuthority> authorities = memberDAO.readAuthorities(username);
        return authorities;
    }

    @Override
    public void createAuthorities(MemberDTO member) throws Exception {
        memberDAO.createAuthorities(member);
    }

    @Override
    public void insertMember(MemberDTO member) throws Exception {
        memberDAO.insertMember(member);
    }

    @Override
    public MemberDTO loginMember(MemberDTO member) throws Exception {
       return memberDAO.loginMember(member);
    }

    @Override
    public MemberDTO selectMember(int idx) throws Exception {
       MemberDTO login = null;

       try{
           login = memberDAO.selectMember(idx);
       } catch(Exception e) {
           e.printStackTrace();
       }

       return login;
    }

    @Override
    public void updateMember(MemberDTO member) throws Exception {
        memberDAO.updateMember(member);
    }

    @Override
    public void deleteMember(int idx) throws Exception {
        memberDAO.deleteMember(idx);
    }

    @Override
    public int checkMember(MemberDTO member) throws Exception {
        int result = memberDAO.checkMember(member);
        return result;
    }

    @Override
    public MemberDTO readMember(String username) throws Exception {
        return memberDAO.readMember(username);
    }

}

package com.project.service;

import com.project.dao.MemberDAO;
import com.project.dto.MemberDTO;
import com.project.dto.TempKey;
import com.project.util.MailUtils;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
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

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
            MemberDTO member = memberDAO.readMember(username);
            member.setAuthorities(getAuthorities(username));
            return member;
    }

    @Override
    public Collection<GrantedAuthority> getAuthorities(String username)  {
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

        String key = new TempKey().getKey(50, false);
        memberDAO.insertAuthKey(member.getEmail(), key);
        MailUtils sendMail = new MailUtils(mailSender);
        sendMail.setSubject("인증메일입니다.");
        sendMail.setText("<h1> 이메일 인증</h1>" +
                "<br>" + member.getName()+"님"+
                "<br> 아래 [이메일 인증확인]을 눌러주세요." +
                "<a href='http://localhost:8080/SignupEmail?email=" +
                member.getEmail() + "&key=" + key +
                " ' target='_blenk'>이메일 인증 확인</a>");
        sendMail.setFrom("sljh1020@gmail.com", "admin");
        sendMail.setTo(member.getEmail());
        sendMail.send();

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
    public int checkId(MemberDTO member) throws Exception {
        int id = memberDAO.checkId(member);
        return id;
    }

    @Override
    public MemberDTO findId(MemberDTO member) throws Exception {
        return memberDAO.findId(member);
    }

    @Override
    public void updateAuthKey(String email) throws Exception {
        memberDAO.updateAuthKey(email);
    }

    @Override
    public int findPwd(MemberDTO member) throws Exception {
        int pwd = memberDAO.findPwd(member);
        return pwd;
    }

    @Override
    public void updatePwd(MemberDTO member) throws Exception {
        memberDAO.updatePwd(member);
    }
}

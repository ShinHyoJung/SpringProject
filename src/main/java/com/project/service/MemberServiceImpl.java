package com.project.service;

import com.project.dao.MemberDAO;
import com.project.dto.MemberDTO;
import com.project.dto.TempKey;
import com.project.util.MailUtils;
import org.springframework.mail.javamail.JavaMailSender;
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

    @Autowired // 의존성주입을 하면 결합도가 약해짐, 간접적으로 연결됨 의존성은 단방향성
    MemberDAO memberDAO;

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{ // SpringSecurity에서 제공하는 인터페이스로, DB에 접근해서 사용자정보를 가져옴
            MemberDTO member = memberDAO.loginMember(username);

            int authkey = member.getAuthkey();
            if(authkey==1) { //인증키가 1이면
                member.setAuthorities(getAuthorities(username)); // 권한테이블로부터 권한을 갖게됨
                return member; // member값 반환함으로써, 로그인실행
            }

            return null; // 인증키가 1이아니면 로그인 안함
    }

    @Override // 이미 선언된 함수를 바꿔치기
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
                "<br> 아래 [이메일 인증확인]을 눌러주세요.<br>" +
                "<a href='http://localhost:8080/SignupEmail?email=" +
                member.getEmail() + "&key=" + key +
                " ' target='_blenk'>이메일 인증 확인</a>");
        sendMail.setFrom("sljh1020@gmail.com", "admin");
        sendMail.setTo(member.getEmail());
        sendMail.send();

    }

    @Override
    public MemberDTO loginMember(String username) {
       return memberDAO.loginMember(username);
    }

    @Override
    public MemberDTO selectMember(String username) throws Exception {
           return memberDAO.selectMember(username);
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
    public MemberDTO findId(MemberDTO username) throws Exception {
        return memberDAO.findId(username);
    }

    @Override
    public void updateAuthKey(String email) throws Exception { //
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

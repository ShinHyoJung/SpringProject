package com.project.dao;

import com.project.dto.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-15
 * Time: 오전 9:19
 * Comments:
 */

@Repository
public class MemberDAOImpl implements MemberDAO
{ //mapper에서 Impl을 사용함

    @Autowired
    SqlSession sqlSession;


    @Override
    public void createAuthorities(MemberDTO member) throws Exception {
        sqlSession.insert("createAuthority", member);
    }

    @Override
    public List<GrantedAuthority>readAuthorities(String username) {
        return sqlSession.selectList("readAuthorities", username);
    }


    @Override
    public void insertMember(MemberDTO member) throws Exception {
        sqlSession.insert("insertMember", member);
    }


    @Override
    public MemberDTO loginMember(String username)
    {
       return sqlSession.selectOne("loginMember", username);

    }

    @Override
    public MemberDTO selectMember(String username) throws Exception {
        return sqlSession.selectOne("selectMember", username);

    }

    @Override
    public void updateMember(MemberDTO member) throws Exception {
        sqlSession.update("updateMember", member);
    }

    @Override
    public void deleteMember(int idx) throws Exception {
        sqlSession.delete("deleteMember", idx);
    }

    @Override
    public int checkId(MemberDTO member) throws Exception {
        int id = sqlSession.selectOne("checkId", member);
        return id;
    }

    @Override
    public int checkEmail(MemberDTO member) throws Exception {
        int email = sqlSession.selectOne("checkEmail", member);
        return email;
    }

    @Override
    public MemberDTO findId(MemberDTO member) throws Exception {
        return sqlSession.selectOne("findId", member);
    }

    @Override
    public void insertAuthKey(String email, String authkey) throws Exception {

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("email", email);
        map.put("authkey", authkey);
        sqlSession.selectOne("insertAuthKey", map);
    }

    @Override
    public void updateAuthKey(String email) throws Exception {

        sqlSession.update("updateAuthKey", email);
    }

    @Override
    public int findPwd(MemberDTO member) throws Exception {
        int pwd = sqlSession.selectOne("findPwd", member);
        return pwd;
    }

    @Override
    public void updatePwd(MemberDTO member) throws Exception {
        sqlSession.update("updatePwd", member);
    }
}

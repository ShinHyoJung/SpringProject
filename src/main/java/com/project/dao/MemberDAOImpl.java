package com.project.dao;

import com.project.dto.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Member;
import java.util.List;


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
    public List<GrantedAuthority>readAuthorities(String username) throws Exception {
        return sqlSession.selectOne("readAuthorities", username);
    }


    @Override
    public void insertMember(MemberDTO member) throws Exception {
        sqlSession.insert("insertMember", member);
    }


    @Override
    public MemberDTO loginMember(MemberDTO member) throws Exception
    {
       return sqlSession.selectOne("loginMember", member);

    }

    @Override
    public MemberDTO selectMember(int idx) throws Exception {
        return sqlSession.selectOne("selectMember", idx);

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
    public int checkMember(MemberDTO member) throws Exception {
        int result = sqlSession.selectOne("checkMember", member);
        return result;
    }

    @Override
    public MemberDTO readMember(String username) throws Exception {
        return sqlSession.selectOne("readMember", username);
    }

}

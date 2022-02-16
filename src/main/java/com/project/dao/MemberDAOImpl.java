package com.project.dao;

import com.project.dto.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


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
    public void insertMember(MemberDTO member) throws Exception {
        sqlSession.insert("insertUser", member);
    }

    @Override
    public MemberDTO loginMember(MemberDTO member) throws Exception {
        MemberDTO res = null;

        try {
            res = sqlSession.selectOne("loginMemberr",member);
        }catch(Exception e) {
            e.printStackTrace();
        }

        return res;
    }
}

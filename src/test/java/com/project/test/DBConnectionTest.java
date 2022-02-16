package com.project.test;

import javax.inject.Inject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;

/**
 * Created with IntellliJ IDEA.
 * MemberDTO: nandsoft
 * Date: 2022-02-14
 * Time: 오전 11:02
 * Comments:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/com/project/conf/Configuration.java"})
public class DBConnectionTest {

    private DataSource dataSource;

    @Test
    public void testConnection() {
        try(Connection con = dataSource.getConnection()) {
            System.out.println("MariaDB 연결 성공: " + con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


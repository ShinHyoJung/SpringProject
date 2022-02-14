package com.project.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-14
 * Time: 오전 11:02
 * Comments:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:datasourceContext.xml"})
public class DBConnectionTest {

    @Autowired
    private DataSource ds;

    @Test
    public void testConnection() {
        try(Connection con = ds.getConnection()) {
            System.out.println("MariaDB 연결 성공: " + con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


package com.project.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import javax.sql.DataSource;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-15
 * Time: 오후 2:54
 * Comments:
 */


public class Configuration
{

    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.mariadb.jdbc.Driver");
        dataSource.setUrl("jdbc:mariadb://127.0.0.1:3306/db");
        dataSource.setUsername("root");
        dataSource.setPassword("1111");
        return dataSource;
    }
}

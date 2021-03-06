package com.project.conf;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@ComponentScan("com.project") //
public class RootConfig {

    @Autowired
    private ApplicationContext applicationContext;

    @Bean
    public DriverManagerDataSource dataSource() { //jdbc 드라이버 연결
        DriverManagerDataSource source = new DriverManagerDataSource();
        source.setDriverClassName("org.mariadb.jdbc.Driver");
        source.setUrl("jdbc:mariadb://127.0.0.1:3306/db");
        source.setUsername("root");
        source.setPassword("1111");

        return source;
    }

    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception { // mapper 연결, 경로설정
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource());
        //sqlSessionFactoryBean.setConfigLocation(applicationContext.getResource("classpath:mybatis/config/mybatis-config.xml"));
        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath*:/mappers/*Mapper.xml")); // ibatis

        return sqlSessionFactoryBean.getObject();
    }


    @Bean
    public SqlSession sqlSession() throws Exception { // sqlSession 템플릿 사용
        SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactory());
        return sqlSessionTemplate;
    }

}


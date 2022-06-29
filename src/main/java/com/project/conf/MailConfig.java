package com.project.conf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.io.IOException;
import java.util.Properties;

@Configuration
public class MailConfig {

    static Logger logger = LoggerFactory.getLogger(MailConfig.class);

    public MailConfig() throws IOException {
        MailConfig.logger.info("MailConfig.java constructor called");
    }

    @Bean(name="mailSender")
    public JavaMailSender getJavaMailSender() { // MailSender을 상속받은 JavaMailSender 인터페이스 메일 보내기위한 설정
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", true); // smtp서버 설정
        properties.put("mail.transport.protocol", "smtp");
        properties.put("mail.smtp.starttls.enable", true);
        properties.put("mail.smtp.starttls.required", true);
        properties.put("mail.debug", true);

        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com"); // 구글 smtp
        mailSender.setPort(587); // 포트번호
        mailSender.setUsername("sljh1020@gmail.com"); // 보내는 사람 이메일 계정
        mailSender.setPassword("pizaagtsvukoenfy"); // 보내는사람 이메일 비밀번호
        mailSender.setDefaultEncoding("utf-8"); // 한글 인코딩 설정
        mailSender.setJavaMailProperties(properties);

        return mailSender;
    }

}

package com.project.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import java.io.IOException;

@Configuration
public class commonConfig {

    @Bean(name="multipartResolver")
    public CommonsMultipartResolver getResolver() throws IOException { // Multipart형식으로 데이터가 전송된 경우, 해당 데이터를 스프링MVC에서 사용할 수 있도록 변환해준다.
         CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
         multipartResolver.setMaxUploadSize(100000); // 최대 업로드 가능한 바이트크기
         multipartResolver.setMaxInMemorySize(100000); // 디스크에 임시파일을 생성하기 전에 메모리에 보관할 수 있는 바이트크기
         return multipartResolver;
    }
}

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
    public CommonsMultipartResolver getResolver() throws IOException {
         CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
         multipartResolver.setMaxUploadSize(100000);
         multipartResolver.setMaxInMemorySize(100000);
         return multipartResolver;
    }
}

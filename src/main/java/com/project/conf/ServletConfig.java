package com.project.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc // 스프링MVC 설정 활성화
@ComponentScan("com.project")// 패키지아래의 빈으로 등록될 준비를 마친 클래스들을 스캔하여 빈으로 등록
public class ServletConfig extends WebMvcConfigurerAdapter {

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    // 고정적인 리소스에 대한 요청을 직접 처리하지않고, 서블릿 컨테이너의 디폴트 서블릿 전달 요청

    @Bean
    public InternalResourceViewResolver internalResourceViewResolver() { // jsp를 뷰로 사용하기위해서
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/"); // view 페이지 root경로
        resolver.setSuffix(".jsp"); // 호출페이지 확장자명
        return resolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) { // 정적 리소스(css, js, img) 설정으로 매핑url과 리소스 위치 설정
        registry.addResourceHandler("/resources/**")
        .addResourceLocations("/resources/*"); // 이 경로 아래에 오는 파일들을 인식

        registry.addResourceHandler("/css/**").addResourceLocations("/css/");

        //registry.addResourceHandler("/smarteditor/**").addResourceLocations("/smarteditor/");
    }
}

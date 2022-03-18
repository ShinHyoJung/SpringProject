package com.project.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.Filter;

@Configuration //설정용 클래스라는것을 스프링에게 알려줌
public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() { //추상메서드 , 공통으로 사용할 의존성 설정파일 지정

        // TODO Auto-generated method stub
        return new Class[] {
           RootConfig.class,SecurityConfig.class
        };
    }

    @Override
    protected Class<?>[] getServletConfigClasses() { // 서블릿이 참조할 빈 설정파일 지정

        // TODO Auto-generated method stub
        return new Class[] {ServletConfig.class, commonConfig.class };
    }

    @Override
    protected String[] getServletMappings() { // DispatcherServlet을 '/'에 매핑 애플리케이션으로오는 모든 요청 처리
        // 요청을 처리할 컨트롤러를 찾음

        // TODO Auto-generated method stub
        return new String[] {"/"};
    }

    @Override
    protected Filter[] getServletFilters() { // 필터등록, 웹어플리케이션 전반에 걸쳐 특정 url이나 파일요청시 먼저 로딩되어 사전에 처리할 작업 수행
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter(); //한글 인코딩 필터
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);

        return new Filter[] { characterEncodingFilter
        ,new DelegatingFilterProxy("springSecurityFilterChain") // 시큐리티 필터체인 등록
                };
    }

    @Bean
    public HttpSessionEventPublisher httpSessionEventPublisher() {
        return new HttpSessionEventPublisher();
    } // 세션
}
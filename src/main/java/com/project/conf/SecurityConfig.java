package com.project.conf;


import com.project.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import javax.sql.DataSource;

@Configuration
@EnableWebSecurity(debug = true)// SpringSecurity FilterChain이 자동으로 포함됨
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true) //
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    static Logger logger = LoggerFactory.getLogger(SecurityConfig.class);



    public SecurityConfig()
    {
        SecurityConfig.logger.debug("SecurityConfig");
    }

    @Autowired
    private MemberService memberService;

    @Autowired
   private DataSource dataSource;

    @Autowired
    private AuthenticationFailureHandler customFailureHandler;

    @Bean
    public PasswordEncoder passwordEncoder() // 비밀번호 암호화
    {
        return new BCryptPasswordEncoder();

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception // 인증매커니즘 구현
    {
                //     인증과 권한
        http
                .authorizeRequests() // 요청에대한 권한을 지정
                .antMatchers("/user/**").access("hasRole('ROLE_USER')")// ROLE_USER 권한을 가진 사용자만 들어갈수있는 페이지설정
                .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')") // ROLE_ADMIN 권한 , 결과에 따른 접근
                .anyRequest().permitAll() // 그외에 어떤 요청이든 접근을 전부 허용
               .and()

                //     폼 로그인 설정

                .formLogin()// 폼로그인 설정
                .loginPage("/Login") // 로그인창을 띄우는 URL
                .loginProcessingUrl("/doLogin") // 로그인을 실행하는 URL
                .failureHandler(customFailureHandler)
                .permitAll()
                .and()

                //     로그아웃 설정
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/Logout")) // 로그아웃을 실행하는 URL
                .logoutSuccessUrl("/") // 로그아웃이 완료되면 뜨는 URL
                .invalidateHttpSession(true) // 세션 종료
                .deleteCookies("JSESSIONID", "remember-me")
                .and()

                //     remember me 설정
                .rememberMe() //로그인한 사용자만 접근, 로그인정보 유지
                .key("myWeb")
                .rememberMeParameter("remember-me")
                .tokenValiditySeconds(86400) //1day
                .and()

                //     exceptionHandling
                 .exceptionHandling()
                 .accessDeniedPage("/denied") //접근 거부되었을때 뜨는 페이지
                 .and()
                //     session 관리
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.NEVER) //
                .invalidSessionUrl("/Login")
                .and()

                //	    csrf
                .csrf().disable();


    }

    @Bean
    public PersistentTokenRepository persistentTokenRepository() //
    {
        JdbcTokenRepositoryImpl db = new JdbcTokenRepositoryImpl();
        db.setDataSource(dataSource);
        return db;
    }

    @Bean
    @Override // AuthenticationManager가  Provider에게 위임하여 인증처리를 함
    public AuthenticationManager authenticationManager() throws Exception {
        return super.authenticationManager();
    }



    //security 기본설정
    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception // 사용자의 username과 패스워드가 맞는지 검증
    {
       auth.userDetailsService(memberService).passwordEncoder(passwordEncoder());
    }

}

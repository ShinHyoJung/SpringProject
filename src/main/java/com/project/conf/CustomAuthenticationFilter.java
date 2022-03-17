package com.project.conf;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

        public static final String SPRING_SECURITY_FORM_USERNAME_KEY = "username";
        public static final String SPRING_SECURITY_FORM_PASSWORD_KEY = "password";
        private String usernameParameter = "username";
        private String passwordParameter = "password";
        private boolean postOnly = true;

        public CustomAuthenticationFilter(AntPathRequestMatcher antPathRequestMatcher) {

        }

        public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {

            if (this.postOnly && !request.getMethod().equals("POST")) {
                throw new AuthenticationServiceException("Authentication method not supported: " + request.getMethod());
            } else {
                String username = obtainUsername(request);
                String password = obtainPassword(request);
                if (username == null) {
                    username = "";
                }

                if (password == null) {
                    password = "";
                }

                username = username.trim();
                UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password);
                setDetails(request, authRequest);
                return this.getAuthenticationManager().authenticate(authRequest);
            }
        }


}
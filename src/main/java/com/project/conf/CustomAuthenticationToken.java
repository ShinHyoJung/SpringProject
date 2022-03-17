package com.project.conf;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.security.Principal;
import java.util.Collection;


public class CustomAuthenticationToken extends AbstractAuthenticationToken {
    private String username;
    private String credentials;

    public CustomAuthenticationToken(String username, String credentials, Collection<? extends GrantedAuthority> authorities) {
        super(authorities);
        this.username = username;
        this.credentials = credentials;
    }

    @Override
    public Object getCredentials() {
        return this.credentials;
    }

    @Override
    public Object getPrincipal() {
        return this.username;
    }

    @Override
    public String getName() {
        if (this.getPrincipal() instanceof UserDetails) {
            return ((UserDetails)this.getPrincipal()).getUsername();
        } else if (this.getPrincipal() instanceof Principal) {
            return ((Principal)this.getPrincipal()).getName();
        } else {
            return this.getPrincipal() == null ? "" : this.getPrincipal().toString();
        }
    }
}

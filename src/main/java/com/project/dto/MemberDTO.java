package com.project.dto;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

/**
 * Created with IntellliJ IDEA.
 * MemberDTO: nandsoft
 * Date: 2022-02-14
 * Time: 오후 1:29
 * Comments:
 */
public class MemberDTO implements UserDetails {


    private static final long serialVersionUID = 1L;

    private int idx;
    private String id;
    private String name;
    private String nickname;
    private String username;
    private String password;
    private String pnum;
    private String email;
    private int authkey;
    private String datetime;
    private String updatetime;
    private Collection<? extends GrantedAuthority> authorities; // 계정이 갖고있는 권한목록 리턴


    private boolean isAccountNonExpired; // 계정이 만료되지 않았는지를 리턴
    private boolean isAccountNonLocked; // 계정이 잠겨있지 않은지를 리턴
    private boolean isCredentialsNonExpired; // 계정의 패스워드가 만료되지 않았는지 리턴
    private boolean isEnabled; // 계정이 사용가능한 계정인지 리턴

    public int getIdx()
    {
        return idx;
    }

    public void setIdx(int idx)
    {
        this.idx = idx;
    }

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    @Override
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getPnum()
    {
        return pnum;
    }

    public void setPnum(String pnum)
    {
        this.pnum = pnum;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public int getAuthkey() {
        return authkey;
    }

    public void setAuthkey(int authkey) {
        this.authkey = authkey;
    }

    public String getDatetime()
    {
        return datetime;
    }

    public void setDatetime(String mdatetime)
    {
        this.datetime = mdatetime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
        this.authorities = authorities;
    }

    @Override
    public boolean isAccountNonExpired() {
        return isAccountNonExpired;
    }

    public void setAccountNonExpired(boolean accountNonExpired) {
        isAccountNonExpired = accountNonExpired;
    }

    @Override
    public boolean isAccountNonLocked() {
        return isAccountNonLocked;
    }

    public void setAccountNonLocked(boolean accountNonLocked) {
        isAccountNonLocked = accountNonLocked;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return isCredentialsNonExpired;
    }

    public void setCredentialsNonExpired(boolean credentialsNonExpired) {
        isCredentialsNonExpired = credentialsNonExpired;
    }

    @Override
    public boolean isEnabled() {
        return isEnabled;
    }

    public void setEnabled(boolean enabled) {
        isEnabled = enabled;
    }

    @Override
    public String toString() {
        return "MemberDTO [idx=" + idx +", id=" + id + ", password=" + password + ", name=" + name + ", pnum=" + pnum + ", email=" + email +
                ", datetime=" + datetime + ", updatetime=" + updatetime + ", authorities=" + authorities + ", isAccountNonExpired=" +
                isAccountNonExpired() + ", isAccountNonLocked=" + isAccountNonLocked() + ", isCredentialNonExpired=" +
                isCredentialsNonExpired() + ", isEnabled=" + isEnabled() + "]";
    }
}

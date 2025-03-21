package com.erp.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.erp.domain.ErpUser;

public class CustomUserDetails implements UserDetails {
	
    private ErpUser user;  // 실제 User 객체를 저장

    public CustomUserDetails(ErpUser user) {
        this.user = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // 사용자 역할을 GrantedAuthority로 변환하여 리턴
        Collection<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_" + user.getRole()));
        return authorities;
    }

    @Override
    public String getPassword() {
        return user.getPassword();  // 암호화된 비밀번호 반환
    }

    @Override
    public String getUsername() {
        return user.getUsername();  // 사용자 이름 반환
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;  // 계정 만료 여부
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;  // 계정 잠금 여부
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;  // 자격 증명 만료 여부
    }

    @Override
    public boolean isEnabled() {
        return true;  // 계정 활성화 여부
    }

    public ErpUser getUser() {
        return this.user;  // ErpUser 객체 반환
    }
	
}

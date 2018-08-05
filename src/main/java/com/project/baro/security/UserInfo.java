package com.project.baro.security;

import java.util.Collection;
import java.util.Map;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserInfo implements UserDetails {
	
	private String id;
	private String userId;
	private String name;
	private String password;
	private Set<GrantedAuthority> authorities;
	
	public UserInfo(Map<String, Object> resultMember,
	Set<GrantedAuthority> authorities) {
	this.id=(String) resultMember.get("id");
	this.userId = (String) resultMember.get("user_id");
	this.name= (String) resultMember.get("name");
	this.password = (String) resultMember.get("password");
	this.authorities = authorities;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Override
	public String getPassword() {
		return password;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public String getId() {
		return id;
	}

	@Override
	public String getUsername() {
		return name;
	}
	
	public String getName() {
		return name;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}

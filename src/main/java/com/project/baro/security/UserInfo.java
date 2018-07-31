package com.project.baro.security;

import java.util.Collection;
import java.util.Map;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserInfo implements UserDetails {
	
	private String id;
	private String userId;
	private String name="sd";
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
		// TODO Auto-generated method stub
		return authorities;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return password;
	}
	
	public String getUserId() {
		// TODO Auto-generated method stub
		return userId;
	}
	
	public String getId() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return name;
	}
	
	public String getName() {
		// TODO Auto-generated method stub
		return name;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}

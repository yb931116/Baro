package com.project.baro.security;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.project.baro.dao.ShareDao;

public class CustomizedUserDetailService implements UserDetailsService {
	
	@Autowired
	private ShareDao dao;
	
	private String userId;
	private String id;
	private String name;
	private Set<GrantedAuthority> authorities;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("ID", username);
		String sqlMapId= "login.user_info";
		
		Map<String, Object> resultMember =
				(Map<String, Object>) dao.getObject(sqlMapId, dataMap);
		
		if (resultMember == null) {
			throw new UsernameNotFoundException("Not found username: "+username);
			}
		sqlMapId = "authority_setting.getAuthorities";
		dataMap.put("USER_ID", resultMember.get("user_id"));
		List<Object> resultAuthorities = (List)dao.getList(sqlMapId, resultMember);
		return new UserInfo(resultMember, buildUserAuthority(resultAuthorities));
	}

	private Set<GrantedAuthority> buildUserAuthority(List<Object> resultAuthorities) {
		Set<GrantedAuthority> resultObject = new HashSet<GrantedAuthority>();
		Iterator iterator = resultAuthorities.iterator();
		while(iterator.hasNext()) {
		Map<String,String> element = (Map<String, String>) iterator.next();
		resultObject.add(new SimpleGrantedAuthority(element.get("authority_name")));
		}
		return resultObject;

	}
}

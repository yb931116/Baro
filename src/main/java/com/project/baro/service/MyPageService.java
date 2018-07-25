package com.project.baro.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;

@Service
public class MyPageService {

	
	@Autowired
	private ShareDao dao;
	
	public Object get_user_info(String string, Map<String, Object> paramMap) {
		String sqlMapId = "mypage.user_info";
		Object resultData = dao.getObject(sqlMapId, paramMap);
		
		return resultData;
	}

	public Object myproblem_list(String string, Map<String, Object> paramMap) {
		String sqlMapId = "mypage.myproblem_list";
		Object resultData = dao.getList(sqlMapId, paramMap);
		
		return resultData;
		
	}

	public Object myanswer_list(String string, Map<String, Object> paramMap) {
		String sqlMapId = "mypage.myanswer_list";
		Object resultData = dao.getList(sqlMapId, paramMap);
		
		return resultData;
	}

}

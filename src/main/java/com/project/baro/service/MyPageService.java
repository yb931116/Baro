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
	
//	유저의 정보 출력
	public Object get_user_info(String string, Map<String, Object> paramMap) {
		String sqlMapId = "mypage.user_info";
		Object resultData = dao.getObject(sqlMapId, paramMap);
		
		return resultData;
	}
	
//	유저가 제시한 Logic들 중 문제점 출력
	public Object myproblem_list(String string, Map<String, Object> paramMap) {
		String sqlMapId = "mypage.myproblem_list";
		Object resultData = dao.getList(sqlMapId, paramMap);
		
		return resultData;
		
	}

//	유저가 제시한 Logic들 중 해결책 출력
	public Object myanswer_list(String string, Map<String, Object> paramMap) {
		String sqlMapId = "mypage.myanswer_list";
		Object resultData = dao.getList(sqlMapId, paramMap);
		
		return resultData;
	}
	
//	유저 정보 변경
	public Object update_user_info(String string, Map<String, Object> paramMap) {
		String sqlMapId = "mypage.user_info_update";
		Object resultData = dao.saveObject(sqlMapId, paramMap);
		
		return resultData;
	}

}

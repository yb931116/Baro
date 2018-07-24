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
	
	public Object getID(String string, Map<String, Object> paramMap) {
		String sqlMapId = "mypage.id";
		Object resultData = dao.getObject(sqlMapId, paramMap);
		
		return resultData;
	}

}

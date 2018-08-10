package com.project.baro.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;

@Service
public class MainService {
	@Autowired ShareDao dao;
	
	// main 화면에 출력될 최신 프로젝트와 조회수가 높은 프로젝트(미완) 출력
	public Object getLists(Object dataMap) {
		Map<String, Object> resultMap = new HashMap<>();
		String sqlMapId = "home.recentList";
		resultMap.put("recentList", dao.getList(sqlMapId, dataMap));
		
		sqlMapId="home.hotList";
		resultMap.put("hotList", dao.getList(sqlMapId, dataMap));
		return resultMap;
	}
	

}

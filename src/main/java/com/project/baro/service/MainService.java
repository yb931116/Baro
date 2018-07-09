package com.project.baro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;

@Service
public class MainService {
	@Autowired ShareDao dao;
	
	public Object getRecentList(Object dataMap) {
		String sqlMapId = "home.recentList";
		Object resultObject = dao.getList(sqlMapId, dataMap);
		return resultObject;
	}
	
	public Object getHotList(Object dataMap) {
		String sqlMapId = "home.hotList";
		Object resultObject = dao.getList(sqlMapId, dataMap);
		return resultObject;
	}
}

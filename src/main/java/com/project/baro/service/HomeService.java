package com.project.baro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;

@Service
public class HomeService {
	@Autowired ShareDao dao;
	
	public Object getList(Object dataMap) {
		String sqlMapId = "home.list";
		Object resultObject = dao.getList(sqlMapId, dataMap);
		return resultObject;
	}
	
}

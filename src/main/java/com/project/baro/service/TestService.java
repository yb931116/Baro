package com.project.baro.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;

@Service
public class TestService {

	@Autowired
	private ShareDao dao;

	public Object getObject(Object dataMap) {
		String sqlMapId = "test.read";

		Object resultObject = dao.getObject(sqlMapId, dataMap);
		
		return resultObject;
	}

	public Object saveObject(Map<Object, Object> dataMap) {

		dataMap.put("first_name", "hi");
	
		
		String sqlMapId= "test.insert";
		dao.saveObject(sqlMapId, dataMap);

		Object resultObject = dao.getObject(sqlMapId, dataMap);

		return resultObject;
	}


}

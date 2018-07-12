package com.project.baro.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;

@Service
public class LogicFocusService {
	
	@Autowired
	ShareDao dao;
	
	public Object getList(Object dataMap) {
		String sqlMapId;
		Object resultObject = null;
		
		if(((Map)dataMap).get("search")==null){
			sqlMapId = "list.list";
			resultObject = dao.getList(sqlMapId, dataMap);
		}else if(((Map)dataMap).get("search").equals("true")) {
			sqlMapId = "list.search";
			resultObject = dao.getList(sqlMapId, dataMap);
		}
		
		return resultObject;
	}
	


	public Object saveObject(Map<String, Object> dataMap) {
		
		String sqlMapId= "list.insert";
		Object resultObject= dao.saveObject(sqlMapId, dataMap);

		return resultObject;
	}
}

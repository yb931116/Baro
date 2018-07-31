package com.project.baro.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;

@Service
public class StatisticsService {
	
	@Autowired
	ShareDao dao;

	public Object getListbyID(String SqlMapId, Object dataMap) {

		Object resultList = dao.getList(SqlMapId, dataMap);
		return resultList;
	}

	public Object SearchProject(String SqlMapId, Object dataMap) {

		Object resultList = dao.getList(SqlMapId, dataMap);
		return resultList;
	}
	
	
}

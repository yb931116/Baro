package com.project.baro.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;

@Service
public class EvaluationService {

	@Autowired
	ShareDao dao;

	public Object SearchByID(String sqlMapId, Object paramMap) {
		
		return dao.getObject("evaluation.SearchID", paramMap);
	}

	public Map SearchByName(String sqlMapId, Object paramMap) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}

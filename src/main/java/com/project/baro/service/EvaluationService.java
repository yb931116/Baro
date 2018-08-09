package com.project.baro.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;

@Service
public class EvaluationService {
	
	@Autowired
	ShareDao dao ;
	
	public Object setEvaluationLogic(String sqlMapId, Object dataMap) {
		
		Object resultNum = dao.saveObject("evaluation.setEvaluationLogic", dataMap);
		return resultNum;
	}

	public Object getEvaluationLogic(String sqlMapId, Object dataMap) {
		Map resultMap = (Map) dao.getObject("evaluation.getEvaluationLogic", dataMap);
		resultMap.putAll((Map)dataMap);
		return resultMap;		
	}
	
	public Object setEvaluationProject(String sqlMapId, Object dataMap) {
		
		Object resultNum = dao.saveObject("evaluation.setEvaluationProject", dataMap);
		return resultNum;
	}

	public Object getEvaluationProject(String sqlMapId, Object dataMap) {
		Map resultMap = (Map) dao.getObject("evaluation.getEvaluationProject", dataMap);
		resultMap.putAll((Map)dataMap);
		return resultMap;		
	}
}

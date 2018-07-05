package com.project.baro.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;
import com.project.baro.util.CommonUtil;

@Service
public class SignupService {

	@Autowired
	private ShareDao dao;
	@Autowired
	private CommonUtil commonUtil;
	
	public Object signup_insert(String sqlMapId, Map<String, Object> paramMap) {
		String uniqueSequence = (String) paramMap.get("USER_ID");
		
//		if("".equals(uniqueSequence)){
//			uniqueSequence = commonUtil.getUniqueSequence();
//		}
		if(uniqueSequence == null) {
			uniqueSequence = commonUtil.getUniqueSequence();
		}
		paramMap.put("USER_ID", uniqueSequence);
		String sqlId ="signup.insert"; 
		Object resultData = dao.saveObject(sqlId,paramMap);
		
		return resultData;
	}
	public Object signup_idcheck(String sqlMapId, Map<String, Object> paramMap) {
		sqlMapId = "signup.readID";
		Object resultData = dao.getObject(sqlMapId, paramMap);
		
		
		return resultData;
	}
}

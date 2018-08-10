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

//	회원가입한 회원의 정보를 db에 저장
	public Object signup_insert(String sqlMapId, Map<String, Object> paramMap) {
		String uniqueSequence = (String) paramMap.get("USER_ID");
		String password = (String) paramMap.get("PW");
		
		if(uniqueSequence == null || "".equals(uniqueSequence) ) {
			uniqueSequence = commonUtil.getUniqueSequence();
		}
		
		
		paramMap.put("USER_ID", uniqueSequence);
		paramMap.put("PW", commonUtil.encodePassword(password));
		String sqlId ="signup.insert"; 
		Object resultData = dao.saveObject(sqlId,paramMap);
		String sqlId2 ="signup.insert_authority_rel"; 
		dao.saveObject(sqlId2,paramMap);
		return resultData;
	}
	
//	회원가입시 ID 중복여부 체크
	public Object signup_idcheck(String sqlMapId, Map<String, Object> paramMap) {
		sqlMapId = "signup.readID";
		Object resultData = dao.getObject(sqlMapId, paramMap);
		
		
		return resultData;
	}
}

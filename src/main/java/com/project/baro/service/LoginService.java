package com.project.baro.service;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;
import com.project.baro.util.CommonUtil;
@Service
public class LoginService {

		@Autowired
		private ShareDao dao;
		@Autowired
		private CommonUtil commonUtil;
		
//		회원 ID 찾기
		public Object login_idfind(String sqlMapId, Map<String, Object> paramMap) {
			sqlMapId = "login.findID";
			Object resultData = dao.getObject(sqlMapId, paramMap);
			
			return resultData;
		}
		
//		회원 비밀번호 찾기
		public Object login_pwfind(String sqlMapId, Map<String, Object> paramMap) {
			sqlMapId = "login.findPW";
			Object resultData = dao.getObject(sqlMapId, paramMap);
			
			return resultData;
		}
	

}

package com.project.baro.service;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;
import com.project.baro.util.CommonUtil;
@Service
public class AuthoritySettingService {

		@Autowired
		private ShareDao dao;
		@Autowired
		private CommonUtil commonUtil;
		

		public Object getList(Object dataMap) {
			String sqlMapId = "authority_setting.list";
			Object resultObject = dao.getList(sqlMapId, dataMap);

			return resultObject;
		}
	

}

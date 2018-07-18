package com.project.baro.service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
		
		public Object authority_setting(Object dataMap) {
//			Map<String,Object> resultMap = new HashMap<String, Object>();
//			resultMap.put("authority_setting", dataMap );  
			
			List<Object> authoritySettingList = new ArrayList<>();
			
			for(int i = 0; i < ((String[])((Map)dataMap).get("list")).length; i++){
				Map<String, Object> authoritySettingMap = new  HashMap<>();
				authoritySettingMap.put("ID", ((String[])((Map)dataMap).get("list"))[i]);
				authoritySettingMap.put("Authority",((String[])((Map)dataMap).get("authority"))[i]);
				authoritySettingList.add(authoritySettingMap);
			}
			
			((Map)(dataMap)).put("authoritySettingList", authoritySettingList);
			
			
			String sqlMapId = "authority_setting.update";
			dao.saveObject(sqlMapId, dataMap);
			sqlMapId = "authority_setting.list";
			Object resultObject = dao.getList(sqlMapId, dataMap);
			
			return resultObject;
		}
	

}

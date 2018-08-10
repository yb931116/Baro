package com.project.baro.service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;
import com.project.baro.util.CommonUtil;
import com.project.baro.util.Pagination;
@Service
public class AuthoritySettingService {

		@Autowired
		private ShareDao dao;
		@Autowired
		private CommonUtil commonUtil;
		
//		회원의 권한을 변경
		public Object authority_setting(Object dataMap) {
			
			List<Object> authoritySettingList = new ArrayList<>();
			
			for(int i = 0; i < ((String[])((Map)dataMap).get("list")).length; i++){
				Map<String, Object> authoritySettingMap = new  HashMap<>();
				authoritySettingMap.put("ID", ((String[])((Map)dataMap).get("list"))[i]);
				authoritySettingMap.put("Authority",((String[])((Map)dataMap).get("authority"))[i]);
				authoritySettingList.add(authoritySettingMap);
			}
			
			((Map)(dataMap)).put("authoritySettingList", authoritySettingList);
			
			
			String sqlMapId = "authority_setting.update";
			Object resultObject = dao.saveObject(sqlMapId, dataMap);
			
			return resultObject;
		}

		
//		회원의 권한정보를 불러옴 (pagination)
		public Object getListPagination(String string, Object paramMap) {
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			String sqlMapId = "";
			int totalCount = 0;
			int currentPage = 0;
			
			if (((Map) paramMap).get("search") == null) {
				sqlMapId = "authority_setting.totalcount";
				totalCount = (int) dao.getObject(sqlMapId, paramMap);
				currentPage = 1 ;
				if(((Map<String,Object>) paramMap).get("curPage") != null) {
				currentPage = Integer.valueOf(((Map<String, String>) paramMap).get("curPage"));
				}
				
				Pagination pagination = new Pagination(totalCount, currentPage);
				resultMap.put("pagination", pagination);
				sqlMapId = "authority_setting.listpagination";
				((Map<String, Object>) paramMap).put("pagination", pagination);
				Object resultList = dao.getList(sqlMapId, paramMap);
				resultMap.put("resultList", resultList);
			}else if (((Map) paramMap).get("search").equals("true")) {
				sqlMapId = "authority_setting.totalcount_search";
				totalCount = (int) dao.getObject(sqlMapId, paramMap);
				currentPage = 1 ;
				if(((Map<String,Object>) paramMap).get("curPage") != null) {
				currentPage = Integer.valueOf(((Map<String, String>) paramMap).get("curPage"));
				}
				
				Pagination pagination = new Pagination(totalCount, currentPage);
				resultMap.put("pagination", pagination);
				sqlMapId = "authority_setting.listpagination_search";
				((Map<String, Object>) paramMap).put("pagination", pagination);
				Object resultList = dao.getList(sqlMapId, paramMap);
				resultMap.put("resultList", resultList);
			}
			
			return resultMap;
		}
	

}

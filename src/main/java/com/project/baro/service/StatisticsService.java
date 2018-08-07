package com.project.baro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;
import com.project.baro.util.Pagination;

@Service
public class StatisticsService {
	
	@Autowired
	ShareDao dao;

	public Object getListbyID(String SqlMapId, Object dataMap) {

		Object resultList = dao.getList(SqlMapId, dataMap);
		return resultList;
	}

	public Object SearchProject(String SqlMapId, Object dataMap) {
		Map resultMap = new HashMap();
		resultMap.put("dataList", dao.getList(SqlMapId, dataMap));
		return resultMap;
	}
	public Object getListPagination(String string, Object paramMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String sqlMapId = "";
		int totalCount = 0;
		int currentPage = 0;
//		if (((Map) paramMap).get("search") == null) {
			sqlMapId = "statistics.totalcount";
			totalCount = (int) dao.getObject(sqlMapId, paramMap);
			currentPage = 1 ;
			if(((Map<String,Object>) paramMap).get("curPage") != null) {
			currentPage = Integer.valueOf(((Map<String, String>) paramMap).get("curPage"));
			}
			
			Pagination pagination = new Pagination(totalCount, currentPage);
			resultMap.put("pagination", pagination);
			sqlMapId = "statistics.listpagination";
			((Map<String, Object>) paramMap).put("pagination", pagination);
			Object resultList = dao.getList(sqlMapId, paramMap);
			resultMap.put("resultList", resultList);

//		}else if (((Map) paramMap).get("search").equals("true")) {
			
//			sqlMapId = "statistics.totalcount_search";
//			totalCount = (int) dao.getObject(sqlMapId, paramMap);
//			currentPage = 1 ;
//			if(((Map<String,Object>) paramMap).get("curPage") != null) {
//			currentPage = Integer.valueOf(((Map<String, String>) paramMap).get("curPage"));
//			}
//			
//			Pagination pagination = new Pagination(totalCount, currentPage);
//			resultMap.put("pagination", pagination);
//			sqlMapId = "statistics.listpagination_search";
//			((Map<String, Object>) paramMap).put("pagination", pagination);
//			Object resultList = dao.getList(sqlMapId, paramMap);
//			resultMap.put("resultList", resultList);
//		}
		return resultMap;
	}
	
	
}

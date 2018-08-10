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

//	프로젝트를 검색
	public Object SearchProject(String SqlMapId, Object dataMap) {
		Map resultMap = new HashMap();
		resultMap.put("dataList", dao.getList(SqlMapId, dataMap));
		return resultMap;
	}
	
//	전체 프로젝트를 리스트로 출력 (pagination)
	public Object getListPagination(String string, Object paramMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String sqlMapId = "";
		int totalCount = 0;
		int currentPage = 0;
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

		return resultMap;
	}
	
	
}

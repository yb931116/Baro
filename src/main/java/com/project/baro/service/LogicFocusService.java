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
public class LogicFocusService {

	@Autowired
	ShareDao dao;
	@Autowired
	CommonUtil util;

	//프로젝트 List의 전체 목록 및 검색결과 탐색 Method
	public Object getList(Object dataMap) {
		String sqlMapId;
		Object resultObject = null;

		if (((Map) dataMap).get("search") == null) {
			sqlMapId = "list.list";
			resultObject = dao.getList(sqlMapId, dataMap);
		} else if (((Map) dataMap).get("search").equals("true")) {
			sqlMapId = "list.search";
			resultObject = dao.getList(sqlMapId, dataMap);
		}

		return resultObject;
	}

	//프로젝트 insert Method
	public Object saveProject(Map<String, Object> dataMap) {

		String sqlMapId = "list.insert";
		Object resultObject = dao.saveObject(sqlMapId, dataMap);

		return resultObject;
	}

	//논심표 insert Method
	public Object saveLogic(Map<String, Object> dataMap) {

		String sqlMapId = "read.insert";
		
		if(((Map)dataMap).get("source_no")==null||
				((Map)dataMap).get("source_no").equals("")) {
			((Map)dataMap).put("source_no", null);
		}
		((Map)dataMap).put("original_no", util.getUniqueSequence());
		Object resultObject = dao.saveObject(sqlMapId, dataMap);
		
		sqlMapId = "read.insertFile";
		dao.saveObject(sqlMapId, dataMap);
		sqlMapId = "read.insertFileRel";
		dao.saveObject(sqlMapId, dataMap);
		return resultObject;
	}

	//논심표 data loading Method
	public Object getProject(Object dataMap) {
		String SqlMapId = "read.list";
		List resultObject = (List) dao.getList(SqlMapId, dataMap);
		List ProList = new ArrayList<>();
		List AnsList = new ArrayList<>();
		Boolean insert = false;

		for (int i = 0; i < resultObject.size(); i++) {
			Map temp_Pro = new HashMap<>();
			if (((String) ((temp_Pro = (Map) resultObject.get(i)).get("category"))).equalsIgnoreCase("problem")) {
				for (int j = 0; j < resultObject.size(); j++) {
					Map temp_Ans = new HashMap<>();
					if (((String) ((temp_Ans = (Map) resultObject.get(j)).get("category"))).equalsIgnoreCase("answer")) {
						if(((String)(temp_Pro.get("original_no"))).equalsIgnoreCase((String)(temp_Ans.get("source_no")))) {
							ProList.add(temp_Pro);
							AnsList.add(temp_Ans);
							insert = true;
						}
					}
				}
				if(insert == false) {
					ProList.add(temp_Pro);
					AnsList.add(new HashMap<>());
				}
			}
			insert = false;
		}

		Map resultMap = new HashMap<>();

		resultMap.put("project_no", ((Map) dataMap).get("project_no"));
		resultMap.put("project_name", ((Map) dataMap).get("project_name"));
		resultMap.put("ProList", ProList);
		resultMap.put("AnsList", AnsList);
		resultMap.putAll((Map)dao.getObject("getEvaluationLogic", dataMap));
		return resultMap;
	}

/*	public Object setEvaluation(String sqlMapId, Object dataMap) {
		
		Object resultNum=null;
		
		if(((String)(((Map)dataMap).get("category"))).equalsIgnoreCase("logic")) {
			resultNum = dao.saveObject("read.setEvaluationLogic", dataMap);
		}else if(((String)(((Map)dataMap).get("category"))).equalsIgnoreCase("project")) {
			resultNum = dao.saveObject("read.setEvaluationProject", dataMap);
		}
		return resultNum;
	}

	public Object getEvaluation(String sqlMapId, Object dataMap) {
		Map resultMap = (Map) dao.getObject("read.getEvaluationLogic", dataMap);
		resultMap.putAll((Map)dataMap);
		return resultMap;		
	}*/

	public Object getListPagination(Object paramMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String sqlMapId = "";
		int totalCount = 0;
		int currentPage = 0;
		if (((Map) paramMap).get("search") == null) {
			sqlMapId = "list.totalcount";
			totalCount = (int) dao.getObject(sqlMapId, paramMap);
			currentPage = 1 ;
			if(((Map<String,Object>) paramMap).get("curPage") != null) {
			currentPage = Integer.valueOf(((Map<String, String>) paramMap).get("curPage"));
			}
			
			Pagination pagination = new Pagination(totalCount, currentPage);
			resultMap.put("pagination", pagination);
			sqlMapId = "list.listpagination";
			((Map<String, Object>) paramMap).put("pagination", pagination);
			Object resultList = dao.getList(sqlMapId, paramMap);
			resultMap.put("resultList", resultList);

		}else if (((Map) paramMap).get("search").equals("true")) {
			
			sqlMapId = "list.totalcount_search";
			totalCount = (int) dao.getObject(sqlMapId, paramMap);
			currentPage = 1 ;
			if(((Map<String,Object>) paramMap).get("curPage") != null) {
			currentPage = Integer.valueOf(((Map<String, String>) paramMap).get("curPage"));
			}
			
			Pagination pagination = new Pagination(totalCount, currentPage);
			resultMap.put("pagination", pagination);
			sqlMapId = "list.listpagination_search";
			((Map<String, Object>) paramMap).put("pagination", pagination);
			Object resultList = dao.getList(sqlMapId, paramMap);
			resultMap.put("resultList", resultList);
		}
		return resultMap;
		
	}
}

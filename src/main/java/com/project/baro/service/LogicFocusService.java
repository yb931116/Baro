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

	//파일 정보를 불러오는 메소드
	public Object getFile(String sqlMapId, Object dataMap) {
		
		//nullpointException을 방지하기 위해 3개의 맵 사용
		Map resultMap = new HashMap();
		Map fileMap = new HashMap();
		Map tempFileMap = new HashMap();
		
		sqlMapId="read.getCurrentFile";
		tempFileMap= (Map) dao.getObject(sqlMapId, dataMap);
		
		if(tempFileMap!=null) // tempFileMap 값이 null이 아닐때만 fileMap에 저장
		fileMap.putAll(tempFileMap);
		
		sqlMapId="read.getSourceFile";
		tempFileMap=(Map) dao.getObject(sqlMapId, dataMap);
		
		if(tempFileMap!=null) // tempFileMap 값이 null이 아닐때만 fileMap에 저장
		fileMap.putAll(tempFileMap);
		
		if(fileMap!=null) { // fileMap 값이 null이 아닐때만 resultMap에 저장 --> NullPointException 방지를 위한 처리
			resultMap.putAll(fileMap);
			
			//현재 선택 항목과 이전 항목의 파일 중 한 개 파일만 존재 하는 경우 파일이 존재하지 않는 쪽은 '없음' 처리
			if(resultMap.get("attached_file_name")==null) {
				resultMap.put("attached_file_name", "없음");}
			
			if(resultMap.get("source_attached_file_name")==null) {
				resultMap.put("source_attached_file_name", "없음");}
			
			}else { //현재 선택 항목과 이전 항목의 파일 중 양 쪽 모두 파일이 존재 하지 않는 경우 모두 '없음' 처리
				resultMap.put("attached_file_name", "없음");
				resultMap.put("source_attached_file_name", "없음");
		}
		
		return resultMap;		
	}
	
	
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

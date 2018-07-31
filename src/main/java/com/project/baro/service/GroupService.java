package com.project.baro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;
import com.project.baro.util.CommonUtil;
import com.project.baro.util.Pagination;

@Service
public class GroupService {

	@Autowired
	private ShareDao dao;
	@Autowired
	private CommonUtil commonUtil;
	
	public Object group_insert(String sqlMapId, Map<Object, Object> paramMap) {
		String uniqueSequence = null;
		String ID = SecurityContextHolder.getContext().getAuthentication().getName();	// session으로 부터 id 가져오는 함수
		if(uniqueSequence == null || "".equals(uniqueSequence) ) {
			uniqueSequence = commonUtil.getUniqueSequence();
		}
		paramMap.put("GROUP_NO", uniqueSequence);
		paramMap.put("ID", ID);
		
		
		String sqlId = "group.insert";
		Object resultData = dao.saveObject(sqlId,paramMap);
		String sqlId2 = "group.member_insert";
		
		dao.saveObject(sqlId2, paramMap);
		return resultData;
	}

	public Object getMyGroupList(String string, Object paramMap) {
		String sqlMapId = "group.mygroup_list";
		Object resultData = dao.getList(sqlMapId, paramMap); 
		for(int i = 0 ; i < ((List<Object>)resultData).size(); i ++) {			
			if( ((Map<String, Object>)((List<Object>)resultData).get(i)).get("id").equals("dummy_data")) {
				((List<Object>)resultData).remove(i);
			}
		}
		
		return resultData;	
	}
	
	public Object getGroupNameList(String string, Object paramMap) {
		String sqlMapId = "group.groupname_list";
		Object resultData = dao.getList(sqlMapId, paramMap);
		return resultData;
	}

	public Object group_delete(String string, Object paramMap) {
		String sqlMapId = "group.group_member_delete";
		dao.deleteObject(sqlMapId, paramMap);

		sqlMapId = "group.group_delete";
		Object resultData = dao.deleteObject(sqlMapId, paramMap);
		return resultData;
		
	}

	public Object group_update(String string, Object paramMap) {
		
		String sqlMapId = "group.group_member_delete";
		dao.deleteObject(sqlMapId, paramMap);
		sqlMapId = "group.group_update";
		Object resultData = dao.saveObject(sqlMapId,paramMap);
		return resultData;
	}

	public Object getGroupList(String string, Object paramMap) {
		String sqlMapId;
		Object resultData = null;
		
		if (((Map) paramMap).get("search") == null) {
			sqlMapId = "group.group_list";
			resultData = dao.getList(sqlMapId, paramMap);
		} else if (((Map) paramMap).get("search").equals("true")) {
			sqlMapId = "group.group_list_search";
			resultData = dao.getList(sqlMapId, paramMap);
		}
		return resultData;
	}

	public Object getGroupEvaluationList(String string, Object paramMap) {
		String sqlMapId = "group.group_evaluation_list";
		Object resultData = dao.getList(sqlMapId, paramMap);
		for(int i = 0 ; i < ((List<Object>)resultData).size(); i ++) {			
			
			if( ((Map<String, Object>)((List<Object>)resultData).get(i)).get("id").equals("dummy_data")) {
				
				((List<Object>)resultData).remove(i);
				
			}
		}
		return resultData;
	}

	public Object getListPagination(String string, Object paramMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>() ;
		String sqlMapId = "group.totalcount";
		int totalCount = (int) dao.getObject(sqlMapId, paramMap);
		int currentPage = 1 ;
		if(((Map<String,Object>) paramMap).get("curPage") != null) {
		currentPage = Integer.valueOf(((Map<String, String>) paramMap).get("curPage"));
		}
		
		Pagination pagination = new Pagination(totalCount, currentPage);
		resultMap.put("pagination", pagination);
		sqlMapId = "group.listpagination";
		((Map<String, Object>) paramMap).put("pagination", pagination);
		Object resultList = dao.getList(sqlMapId, paramMap);
		resultMap.put("resultList", resultList);
		return resultMap;
	}


	
}

package com.project.baro.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;
import com.project.baro.util.CommonUtil;

@Service
public class AdminGroupService {

	@Autowired
	private ShareDao dao;
	@Autowired
	private CommonUtil commonUtil; // 시퀀스 생성 위한 변수
	
	public Object getGroupList(String string, Object paramMap) {	// 그룹 정보 가져오기
		String sqlMapId = "admin_group.list";
		Object resultData = dao.getList(sqlMapId, paramMap); 
		for(int i = 0 ; i < ((List<Object>)resultData).size(); i ++) {			
			if( ((Map<String, Object>)((List<Object>)resultData).get(i)).get("id").equals("dummy_data")) {
				((List<Object>)resultData).remove(i);
			}
		}
		
		return resultData;	
	}
	
	public Object getGroupNameList(String string, Object paramMap) {  // 그룹 이름 가져오기
		String sqlMapId = "admin_group.groupname_list";
		Object resultData = dao.getList(sqlMapId, paramMap);
		return resultData;
	}

	public Object group_delete(String string, Object paramMap) { // 그룹 삭제
		String sqlMapId = "group.group_member_delete";
		dao.deleteObject(sqlMapId, paramMap);

		sqlMapId = "group.group_delete";
		Object resultData = dao.deleteObject(sqlMapId, paramMap);
		return resultData;
		
	}

	public Object group_update(String string, Object paramMap) { // 그룹 수정 ( 삭제하고 추가하는 방식)
		
		String sqlMapId = "group.group_member_delete";
		dao.deleteObject(sqlMapId, paramMap);
		sqlMapId = "group.group_update";
		Object resultData = dao.saveObject(sqlMapId,paramMap);
		return resultData;
	}


	
}

package com.project.baro.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;
import com.project.baro.util.CommonUtil;

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

	public Object getGroupList(String string, Object paramMap) {
		String sqlMapId = "group.list";
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

//	public Object group_update(String string, Object paramMap) {
//		String sqlMapId = "group.group_update";
//		Object resultData = dao.saveObject(sqlMapId,paramMap);
//		return resultData;
//	}

//	public Object login_idfind(String sqlMapId, Map<String, Object> paramMap) {
//		sqlMapId = "login.findID";
//		Object resultData = dao.getObject(sqlMapId, paramMap);
//		
//		return resultData;
//	}
	
}

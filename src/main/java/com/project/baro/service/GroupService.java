package com.project.baro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;
import com.project.baro.security.UserInfo;
import com.project.baro.util.CommonUtil;
import com.project.baro.util.Pagination;

@Service
public class GroupService {

	@Autowired
	private ShareDao dao;
	@Autowired
	private CommonUtil commonUtil;	// 시퀀스 생성 위한 변수
	
	public Object group_insert(String sqlMapId, Map<String, Object> paramMap) {	// 그룹 만들기
		String uniqueSequence = null;	// 시퀀스 만들기 위한 변수
		UserInfo user = (UserInfo)(SecurityContextHolder.getContext().getAuthentication().getPrincipal()); // 로그인 된 유저의 id, user_id, name, password 등을 parameter로 사용 가능
		if(uniqueSequence == null || "".equals(uniqueSequence) ) {
			uniqueSequence = commonUtil.getUniqueSequence();
		}
		paramMap.put("group_no", uniqueSequence);
		paramMap.put("id", user.getId());
		
		
		String sqlId = "group.insert"; // 그룹 삽입
		Object resultData = dao.saveObject(sqlId,paramMap);
		String sqlId2 = "group.member_insert";	// 그룹원 삽입
		
		dao.saveObject(sqlId2, paramMap);
		return resultData;
	}

	public Object getMyGroupList(String string, Object paramMap) {	// 내가 만든 그룹 리스트 가져오기
		String sqlMapId = "group.mygroup_list";
		Object resultData = dao.getList(sqlMapId, paramMap); 
		for(int i = 0 ; i < ((List<Object>)resultData).size(); i ++) {			
			if( ((Map<String, Object>)((List<Object>)resultData).get(i)).get("id").equals("dummy_data")) { //아이디 중 dummy_data가 있으면 삭제하고 출력
				((List<Object>)resultData).remove(i);
			}
		}
		
		return resultData;	
	}
	
	public Object getGroupNameList(String string, Object paramMap) { // 그룹이름 가져오기
		String sqlMapId = "group.groupname_list";
		Object resultData = dao.getList(sqlMapId, paramMap);
		return resultData;
	}

	public Object group_delete(String string, Object paramMap) { // 그룹 삭제
		String sqlMapId = "group.group_member_delete"; // 그룹 멤버 삭제
		dao.deleteObject(sqlMapId, paramMap);

		sqlMapId = "group.group_delete";	// 그룹 삭제
		Object resultData = dao.deleteObject(sqlMapId, paramMap);
		return resultData;
		
	}

	public Object group_update(String string, Object paramMap) {	// 그룹 수정  (삭제하고 새로 삽입하는 방식)
		
		String sqlMapId = "group.group_member_delete";
		dao.deleteObject(sqlMapId, paramMap);
		sqlMapId = "group.group_update";
		Object resultData = dao.saveObject(sqlMapId,paramMap);
		return resultData;
	}

	public Object getGroupEvaluationList(String string, Object paramMap) {	// 그룹 평가 기능
		String sqlMapId = "group.group_evaluation_list";
		Object resultData = dao.getList(sqlMapId, paramMap);	// 그룹별 평가할 그룹원 가져오기
		for(int i = 0 ; i < ((List<Object>)resultData).size(); i ++) {			
			
			if( ((Map<String, Object>)((List<Object>)resultData).get(i)).get("id").equals("dummy_data")) { //아이디 중 dummy_data가 있으면 삭제하고 출력
				
				((List<Object>)resultData).remove(i);
				
			}
		}
		return resultData;
	}

	public Object getListPagination(String string, Object paramMap) {	// 페이지네이션 기능이 포함된 그룹 리스트 가져오기
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String sqlMapId = "";
		int totalCount = 0;
		int currentPage = 0;
		if (((Map) paramMap).get("search") == null) {	// 일반 페이지네이션 그룹 리스트 가져오기
			sqlMapId = "group.totalcount";
			totalCount = (int) dao.getObject(sqlMapId, paramMap);
			currentPage = 1 ;
			if(((Map<String,Object>) paramMap).get("curPage") != null) {
			currentPage = Integer.valueOf(((Map<String, String>) paramMap).get("curPage"));
			}
			
			Pagination pagination = new Pagination(totalCount, currentPage);
			resultMap.put("pagination", pagination);
			sqlMapId = "group.listpagination";
			((Map<String, Object>) paramMap).put("pagination", pagination);
			Object resultList = dao.getList(sqlMapId, paramMap);
			resultMap.put("resultList", resultList);

		}else if (((Map) paramMap).get("search").equals("true")) {	// 검색창에 검색했을 때 페이지네이션 포함된 그룹 리스트 가져오기(jsp에서 input으로 search 넘겨줌)
			
			sqlMapId = "group.totalcount_search";
			totalCount = (int) dao.getObject(sqlMapId, paramMap);
			currentPage = 1 ;
			if(((Map<String,Object>) paramMap).get("curPage") != null) {
			currentPage = Integer.valueOf(((Map<String, String>) paramMap).get("curPage"));
			}
			
			Pagination pagination = new Pagination(totalCount, currentPage);
			resultMap.put("pagination", pagination);
			sqlMapId = "group.listpagination_search";
			((Map<String, Object>) paramMap).put("pagination", pagination);
			Object resultList = dao.getList(sqlMapId, paramMap);
			resultMap.put("resultList", resultList);
		}
		return resultMap;
	}


	
}

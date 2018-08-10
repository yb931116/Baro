package com.project.baro.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.baro.component.MapParamCollector;
import com.project.baro.security.UserInfo;
import com.project.baro.service.GroupService;


@Controller
public class GroupController {
	private final static String MAPPING = "/group/"; // 공통 경로
	@Autowired
	private GroupService groupservice;
	
	@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(MapParamCollector paramMethodMap ,@PathVariable String action,
			ModelAndView modelandView, @RequestParam Map<String, Object> paramMap2) { 
		
		String viewName = MAPPING + action;	// 보여 줄 jsp 파일 이름 위한 변수
		Map<String,Object> paramMap = paramMethodMap.getMap(); // list를 map으로 mapping 해서 가져오기 위해 paramMethodMap 사용
		Map<String,Object> resultMap = new HashMap<String, Object>();  // 결과 값을 Map 으로 사용하기 위한 변수
		List<Object> groupNames = new ArrayList<Object>();	// groupName들을 가져오기 위한 List 변수
		List<Object> resultList = new ArrayList<Object>();  // 결과 값을 list로 사용하기 위한 변수
		UserInfo user = (UserInfo)(SecurityContextHolder.getContext().getAuthentication().getPrincipal()); // 로그인 된 유저의 id, user_id, name, password 등을 parameter로 사용 가능 
		if("insert".equalsIgnoreCase(action)){	// /group/insert일 경우 
			groupservice.group_insert("", paramMap); // 그룹 만들기 기능 (만든 그룹 정보 db에 삽입)
			groupNames = (List<Object>) groupservice.getGroupNameList("", paramMap2); // 만든 그룹 리스트 보여주는 함수
			viewName = "/group_make";
		}else if("make_group".equalsIgnoreCase(action)){
			paramMap2.put("ID", user.getId());
			groupNames = (List<Object>) groupservice.getGroupNameList("", paramMap2);
			
			viewName= "/group_make";
		}
		else if("mygroup_list".equalsIgnoreCase(action)){
			paramMap2.put("ID", user.getId());
			groupNames = (List<Object>) groupservice.getGroupNameList("", paramMap2);
			for(int i = 0 ; i< groupNames.size(); i++) {
				List<Object> tableList = new ArrayList<Object>();
				paramMap2.put("groupName", groupNames.get(i));
				tableList = (List<Object>) groupservice.getMyGroupList("",paramMap2);
				resultList.add(tableList);
			}
			viewName= "/mygroup_list";
		}else if("group_list".equalsIgnoreCase(action)) {
			resultMap = (Map<String, Object>)groupservice.getListPagination("", paramMap2);
			viewName = "/group_list";
		}
		else if("group_detail".equalsIgnoreCase(action)) {
			resultMap = paramMap2;
			resultList = (List<Object>)groupservice.getGroupEvaluationList("", paramMap2);
			viewName = "/group_detail";
		}

		
		
		modelandView.setViewName(viewName);
		modelandView.addObject("paramMap",paramMap2);
		modelandView.addObject("resultMap",resultMap);
		modelandView.addObject("groupNames",groupNames);
		modelandView.addObject("resultList",resultList);
		return modelandView;
	}
}

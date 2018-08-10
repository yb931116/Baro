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
			viewName = "/group_make"; // 그룹 만들기 화면으로 이동
		}else if("make_group".equalsIgnoreCase(action)){// /group/group_make일 경우(그룹만들기 탭 클릭했을 때)
			viewName= "/group_make";  // 그룹 만들기 화면으로 이동
		}
		else if("mygroup_list".equalsIgnoreCase(action)){// /group/mygroup_list일 경우(내가 만든 그룹 탭 클릭했을 때)
			paramMap2.put("ID", user.getId()); // 로그인 된 유저의 id를 parameter로 활용(sql에서 활용)
			groupNames = (List<Object>) groupservice.getGroupNameList("", paramMap2); // 로그인 한 아이디가 만든 그룹들을 가져온다.
			for(int i = 0 ; i< groupNames.size(); i++) { // 내가 만든 그룹 개수 만큼 반복
				List<Object> tableList = new ArrayList<Object>(); // 그룹안의 그룹원 정보를 저장하기 위한 변수
				paramMap2.put("groupName", groupNames.get(i)); // 그룹이름 순서대로 맵으로 맵핑(sql에서 groupname 활용하기 위해서)
				tableList = (List<Object>) groupservice.getMyGroupList("",paramMap2); // 그룹 및 그룹원 정보를 가져온다.
				resultList.add(tableList); // 결과 값 맵에 저장
			}
			viewName= "/mygroup_list"; // 내가 만든 그룹 화면으로 이동
		}else if("group_list".equalsIgnoreCase(action)) { // /group/group_list일 경우(그룹 탭 클릭했을 때)
			resultMap = (Map<String, Object>)groupservice.getListPagination("", paramMap2); //페이지네이션 포함된 그룹 리스트 정보 가져온다.
			viewName = "/group_list"; // 그룹화면으로 이동
		}
		else if("group_detail".equalsIgnoreCase(action)) { // /group_detail일 경우(그룹에서 특정 그룹을 선택했을 때)
			resultMap = paramMap2;
			resultList = (List<Object>)groupservice.getGroupEvaluationList("", paramMap2); // 그룹 별 인원에 점수를 주어 평가를 할 수 있는 기능
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

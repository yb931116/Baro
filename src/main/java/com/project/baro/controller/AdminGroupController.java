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
import com.project.baro.service.AdminGroupService;
import com.project.baro.service.GroupService;

//	관리자전용 그룹 화면
@Controller
public class AdminGroupController {
	private final static String MAPPING = "/admin_group/";
	
	@Autowired
	private AdminGroupService admingroupservice;
	
	@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(MapParamCollector paramMethodMap ,@PathVariable String action,
			ModelAndView modelandView, @RequestParam Map<String, Object> paramMap2) {
		
		String viewName = MAPPING + action;
		Map<String,Object> paramMap = paramMethodMap.getMap();
		Map<String,Object> resultMap = new HashMap<String, Object>();
		List<Object> groupNames = new ArrayList<Object>();
		List<Object> resultList = new ArrayList<Object>();
		UserInfo user = (UserInfo)(SecurityContextHolder.getContext().getAuthentication().getPrincipal());

			
//		전체 그룹 리스트 출력
		 if("list".equalsIgnoreCase(action)){
			paramMap2.put("ID",user.getId() );
			groupNames = (List<Object>) admingroupservice.getGroupNameList("", paramMap2);
			for(int i = 0 ; i< groupNames.size(); i++) {
				List<Object> tableList = new ArrayList<Object>();
				paramMap2.put("groupName", groupNames.get(i));
				tableList = (List<Object>) admingroupservice.getGroupList("",paramMap2);
				resultList.add(tableList);
			}
			viewName= "/admin_group";
		}

		modelandView.setViewName(viewName);
		modelandView.addObject("paramMap",paramMap);
		modelandView.addObject("resultMap",resultMap);
		modelandView.addObject("groupNames",groupNames);
		modelandView.addObject("resultList",resultList);
		return modelandView;
	}
}

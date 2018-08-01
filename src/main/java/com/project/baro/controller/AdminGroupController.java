package com.project.baro.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.baro.component.MapParamCollector;
import com.project.baro.service.AdminGroupService;
import com.project.baro.service.GroupService;


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
		
		if("insert".equalsIgnoreCase(action)){	// login 화면
			admingroupservice.group_insert("", paramMap);
			groupNames = (List<Object>) admingroupservice.getGroupNameList("", paramMap2);
			
			viewName = "/group";
		}else if("index".equalsIgnoreCase(action)){
			groupNames = (List<Object>) admingroupservice.getGroupNameList("", paramMap2);
			
			viewName= "/group";
		}
		else if("list".equalsIgnoreCase(action)){
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

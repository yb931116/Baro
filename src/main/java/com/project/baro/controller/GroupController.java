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
import org.springframework.web.servlet.ModelAndView;

import com.project.baro.component.MapParamCollector;
import com.project.baro.service.GroupService;


@Controller
public class GroupController {
	private final static String MAPPING = "/group/";
	@Autowired
	private GroupService groupservice;
	
	@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(MapParamCollector paramMethodMap ,@PathVariable String action,
			ModelAndView modelandView) {
		
		String viewName = MAPPING + action;
		Map<Object,Object> paramMap = paramMethodMap.getMap();
		Map<String,Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();
		
		
		if("insert".equalsIgnoreCase(action)){	// login 화면
			groupservice.group_insert("", paramMap);
			viewName = "/group";
		}else if("index".equalsIgnoreCase(action)){

			viewName= "/group";
		}
		
		
		modelandView.setViewName(viewName);
		modelandView.addObject("paramMap",paramMap);
		modelandView.addObject("resultMap",resultMap);
		modelandView.addObject("resultList",resultList);
		return modelandView;
	}
}

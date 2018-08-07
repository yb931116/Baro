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

import com.project.baro.service.StatisticsService;

@Controller
public class StatisticsController {
private final static String MAPPING = "/statistics/";

	@Autowired
	StatisticsService service;

	@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(@RequestParam Map<String, Object> paramMap ,@PathVariable String action,
			ModelAndView modelandView) {
		
		String viewName = MAPPING + action;
		Map<String,Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();
		System.out.println("왜그렇냐" + action);
		if("index".equalsIgnoreCase(action)){
//			 resultList =(List<Object>) service.getListbyID("statistics.getListById",paramMap);
			resultMap = (Map<String, Object>)service.getListPagination("", paramMap);
			viewName = "/statistics";
		}
		modelandView.setViewName(viewName);
		modelandView.addObject("paramMap",paramMap);
		modelandView.addObject("resultMap",resultMap);
		modelandView.addObject("resultList",resultList);
		return modelandView;
		
	}


}

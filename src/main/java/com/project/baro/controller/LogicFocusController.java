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

import com.project.baro.service.LogicFocusService;

@Controller
public class LogicFocusController {
	
	private final static String MAPPING = "/logicfocus/";
	
	@Autowired
	private LogicFocusService service;
	
	
	@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(@RequestParam Map<String, Object> paramMap, @PathVariable String action,
			ModelAndView modelandView) {

		
		String viewName = MAPPING + action ;
		String forwardView = (String) paramMap.get("forwardView") ;

		Map<String, Object> resultMap = new HashMap<String, Object>() ;
		List<Object> resultList = new ArrayList<Object>();

		// divided depending on action value
		if ("list".equalsIgnoreCase(action)) {
			resultList=(List)service.getList(paramMap);
		}
		/*else if ("update".equalsIgnoreCase(action)) {
			resultMap = (Map<String, Object>) service.getObject(paramMap);
			paramMap.put("action", action);
		} else if ("merge".equalsIgnoreCase(action)) {
			service.saveObject(paramMap);
		} else if ("read".equalsIgnoreCase(action)) {
			resultMap = (Map<String, Object>) service.getObject(paramMap);
		} else if ("list".equalsIgnoreCase(action)) {
			resultList = (List<Object>) service.getList(paramMap);
		} else if ("delete".equalsIgnoreCase(action)) {
			resultList = (List<Object>) service.deleteObject(paramMap);
		} *//*else if("list_pagination".equalsIgnoreCase(action)) {
			resultMap = (Map<String, Object>)service.getListPagination(paramMap);
		}*/
		
		if(forwardView != null){
			viewName = forwardView;
		}
		
		modelandView.setViewName(viewName);
		
		modelandView.addObject("paramMap", paramMap);
		modelandView.addObject("resultMap", resultMap);
		modelandView.addObject("resultList", resultList);
		return modelandView;
	}
	
	@RequestMapping(value="/logicfocus/read/{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView read(@RequestParam Map<String, Object> paramMap, @PathVariable String action,
			ModelAndView modelandView) {
		
		String viewName = "logicfocus/popup" ;
		String forwardView = (String) paramMap.get("forwardView") ;

		Map<String, Object> resultMap = new HashMap<String, Object>() ;
		List<Object> resultList = new ArrayList<Object>();
	
		
		if(forwardView != null){
			viewName = forwardView;
		}
		
		modelandView.setViewName(viewName);
		
		modelandView.addObject("paramMap", paramMap);
		modelandView.addObject("resultMap", resultMap);
		modelandView.addObject("resultList", resultList);
		return modelandView;
	}

	@RequestMapping(value="/logicfocus/insert/{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView insert(@RequestParam Map<String, Object> paramMap, @PathVariable String action,
			ModelAndView modelandView) {
	
		String viewName = "logicfocus/popup" ;
		String forwardView = (String) paramMap.get("forwardView") ;

		Map<String, Object> resultMap = new HashMap<String, Object>() ;
		List<Object> resultList = new ArrayList<Object>();
		
		
		if(forwardView != null){
			viewName = forwardView;
		}
		
		modelandView.setViewName(viewName);
		
		modelandView.addObject("paramMap", paramMap);
		modelandView.addObject("resultMap", resultMap);
		modelandView.addObject("resultList", resultList);
		return modelandView;
	}
}

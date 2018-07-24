/*Sidebar의  List 메뉴와 관련된 Controller임.
 * 
*/
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

	// Sidebar의 List 메뉴에서 접근할 수 있는 가장 깊은(3 depth) URI인 read와 insert 내의 popup Modal
	// 관련 Method
	@RequestMapping(value = "/logicfocus/read/{action}", method = { RequestMethod.GET, RequestMethod.POST }
					, produces = "application/json")
	public ModelAndView read(@RequestParam Map<String, Object> paramMap, @PathVariable String action,
			ModelAndView modelandView) {

		String forwardView = (String) paramMap.get("forwardView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String viewName = "";
		
		if ("detail".equalsIgnoreCase(action)) {
			resultMap = paramMap;
			viewName = "logicfocus/popup";
		}
		else if ("insert".equalsIgnoreCase(action)) {
			service.saveProject(paramMap);
			resultMap = (Map)service.getProject(paramMap);
			viewName = "logicfocus/read";
		}
		
		
		if (forwardView != null) {
			viewName = forwardView;
		}

		modelandView.setViewName(viewName);
		modelandView.addObject("paramMap", paramMap);
		modelandView.addObject("resultMap", resultMap);
		return modelandView;
	}

	@RequestMapping(value = "/logicfocus/insert/{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView insert(@RequestParam Map<String, Object> paramMap, @PathVariable String action,
			ModelAndView modelandView) {

		String viewName = "logicfocus/popup";
		String forwardView = (String) paramMap.get("forwardView");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();

		if (forwardView != null) {
			viewName = forwardView;
		}

		modelandView.setViewName(viewName);

		modelandView.addObject("paramMap", paramMap);
		modelandView.addObject("resultMap", resultMap);
		modelandView.addObject("resultList", resultList);
		return modelandView;
	}

	// Sidebar의 List 메뉴에서 접근 할 수 있는 2 depth URI인 list와 read 관련 method
	@RequestMapping(value = MAPPING + "{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(@RequestParam Map<String, Object> paramMap, @PathVariable String action,
			ModelAndView modelandView) {

		String viewName = MAPPING + action;
		String forwardView = (String) paramMap.get("forwardView");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();
		
		// divided depending on action value
		if ("list".equalsIgnoreCase(action)) {
			resultList = (List) service.getList(paramMap);
		} else if ("edit".equalsIgnoreCase(action)) {
		} else if ("insert".equalsIgnoreCase(action)) {
			service.saveProject(paramMap);
			viewName = MAPPING + "list";
			resultList = (List) service.getList(paramMap);
			
		}else if ("logicInsert".equalsIgnoreCase(action)) {
			service.saveLogic(paramMap);
			resultMap = (Map)service.getProject(paramMap);
			viewName = MAPPING + "read";
			modelandView.addObject("redirect:"+"/logicfocus/read");
			
		} else if ("read".equalsIgnoreCase(action)) {
			resultMap = (Map)service.getProject(paramMap);
		}
		
		if (forwardView != null) {
			viewName = forwardView;
		}

		modelandView.setViewName(viewName);

		modelandView.addObject("paramMap", paramMap);
		modelandView.addObject("resultMap", resultMap);
		modelandView.addObject("resultList", resultList);
		return modelandView;
	}

}
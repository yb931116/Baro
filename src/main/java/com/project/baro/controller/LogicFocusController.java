/*Sidebar의  List 메뉴와 관련된 Controller임.
 * 
*/
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
import com.project.baro.service.EvaluationService;
import com.project.baro.service.LogicFocusService;

@Controller
public class LogicFocusController {

	private final static String MAPPING = "/logicfocus/";

	@Autowired
	private LogicFocusService logicFocusService;
	@Autowired
	private EvaluationService evaluationService;

	// Sidebar 프로젝트 메뉴 중 3depth URI에 접근하는 메소드 
	@RequestMapping(value = "/logicfocus/read/{action}", method = { RequestMethod.GET, RequestMethod.POST }
					, produces = "application/json")
	public ModelAndView read(@RequestParam Map<String, Object> paramMap, @PathVariable String action,
			ModelAndView modelandView ) {

		String forwardView = (String) paramMap.get("forwardView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String viewName = "";
		
		// 각 logic의 detail정보 출력
		if ("detail".equalsIgnoreCase(action)) {
			

			resultMap = (Map<String, Object>)evaluationService.getEvaluationLogic("getEvaluation", paramMap);
			resultMap.putAll((Map) logicFocusService.getFileAndUserName("", paramMap));
			viewName = "logicfocus/popup";
			
		// 각 logic의 detail 정보 출력시 첨부 file의 내용 출력
		}else if("file".equalsIgnoreCase(action)) {
			resultMap=paramMap;
			viewName="logicfocus/fileViewPopup";
		}
		
		
		
		if (forwardView != null) {
			viewName = forwardView;
		}

		modelandView.setViewName(viewName);
		modelandView.addObject("paramMap", paramMap);
		modelandView.addObject("resultMap", resultMap);
		return modelandView;
	}


	// Sidebar의 프로젝트 메뉴 중  2depth URI에 접근하는 method
	@RequestMapping(value = MAPPING + "{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(MapParamCollector paramMethodMap, @PathVariable String action,
			ModelAndView modelandView) {

		String viewName = MAPPING + action;
		Map<String,Object> paramMap = paramMethodMap.getMap();
		String forwardView = (String) paramMap.get("forwardView");
		
//		로그인된 user의 정보를 가져옴
		UserInfo user = (UserInfo)(SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();
		
//		logicfocus/list -> 각 프로젝트 list를 출력
		if ("list".equalsIgnoreCase(action)) {
			resultMap = (Map<String, Object>)logicFocusService.getListPagination("",paramMap);
			viewName = "/logicfocus/list"; 

// 		logicfocus/edit -> 프로젝트 추가 화면 
		} else if ("edit".equalsIgnoreCase(action)) {
			
//		logicfocus/insert -> 프로젝트 추가 (redirect 추가필요)
		} else if ("insert".equalsIgnoreCase(action)) {
			logicFocusService.saveProject(paramMap);
			viewName = MAPPING + "list";
			resultMap = (Map<String, Object>)logicFocusService.getListPagination("",paramMap);

//		logicfocus/logicInsert -> logic을 추가
		}else if ("logicInsert".equalsIgnoreCase(action)) {
			logicFocusService.saveLogic(paramMap);
			resultMap=paramMap;
			viewName = "/redirect";
			
//		logicfocus/read -> 논심표 출력
		} else if ("read".equalsIgnoreCase(action)) {
			resultMap = (Map)logicFocusService.getProject(paramMap);
			resultMap.putAll( (Map) evaluationService.getEvaluationProject("evaluation.getEvalutationProject", paramMap));

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
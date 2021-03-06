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

import com.project.baro.service.SignupService;



@Controller
public class SignUpController {
	private final static String MAPPING = "/signup/";	// 공통 경로
	
	@Autowired
	private SignupService service;

	@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })	// /signup 다음에 지정되는 {action} 경로에 따라 실행 결과 달라짐
	public ModelAndView actionMethod(@RequestParam Map<String, Object> paramMap, @PathVariable String action,
			ModelAndView modelandView) {
		
		String viewName = MAPPING + action ;
		String forwardView = (String) paramMap.get("forwardView");

		Map<String, Object> resultMap = new HashMap<String, Object>() ;
		List<Object> resultList = new ArrayList<Object>();
		
		if("index".equalsIgnoreCase(action)){	// /signup/index 일 경우 signup.jsp(회원가입 창) 실행

			viewName= "/signup";
		}else if("insert".equalsIgnoreCase(action)) { // /signup/insert일 경우 가입 회원정보 db에 삽입 후 index.jsp(메인화면) 실행

			service.signup_insert("",paramMap);
			viewName= "/index";
		}
		
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

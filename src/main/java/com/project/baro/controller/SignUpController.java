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
	private final static String MAPPING = "/signup/";
	
	@Autowired
	private SignupService service;

	@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(@RequestParam Map<String, Object> paramMap, @PathVariable String action,
			ModelAndView modelandView) {
		
		String viewName = MAPPING + action ;
		String forwardView = (String) paramMap.get("forwardView") ;

		Map<String, Object> resultMap = new HashMap<String, Object>() ;
		List<Object> resultList = new ArrayList<Object>();
		
		if("signup".equalsIgnoreCase(action)){
			viewName= "/"+action;
			
		}else if("insert".equalsIgnoreCase(action)) {
			service.signup_insert("",paramMap);
			viewName= "/index";

		}else if("IdCheckForm".equalsIgnoreCase(action)) {
			viewName= "/"+action;
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

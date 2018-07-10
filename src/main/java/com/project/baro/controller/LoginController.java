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

import com.project.baro.service.LoginService;

@Controller
public class LoginController {
	private final static String MAPPING = "/login/";
	@Autowired
	private LoginService loginservice;
	
	@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(@RequestParam Map<String, Object> paramMap ,@PathVariable String action,
			ModelAndView modelandView) {
		
		String viewName = MAPPING + action;
		Map<String,Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();
		
		
		if("index".equalsIgnoreCase(action)){	// login 화면
			viewName= "/login";
		}else if("open_findID".equalsIgnoreCase(action)) {	// 아이디찾기 팝업열기
			viewName = "id_find_popup";
		}else if("open_findPW".equalsIgnoreCase(action)) {	// 패스워드 찾기 팝업열기
			viewName = "pw_find_popup";
		}else if("findID".equalsIgnoreCase(action)) {	// 아이디 찾고 화면에 표시
			resultMap = (Map)loginservice.login_idfind("", paramMap);
			viewName = "/login";
		}
		modelandView.setViewName(viewName);
		modelandView.addObject("paramMap",paramMap);
		modelandView.addObject("resultMap",resultMap);
		modelandView.addObject("resultList",resultList);
		return modelandView;
	}
}

package com.project.baro.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


// 화면 redirect controller -> 화면 url 전환시 사용
@Controller
public class RedirectController {
	
@RequestMapping(value = "/redirect" , method = { RequestMethod.GET, RequestMethod.POST })
public ModelAndView redirect(@RequestParam Map<String, Object> paramMap,
ModelAndView modelandView) {
		
		String viewName= "redirect";
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap= paramMap;
	
		modelandView.setViewName(viewName);
		modelandView.addObject("paramMap", paramMap);
		modelandView.addObject("resultMap", resultMap);
		return modelandView;
	}
		
}


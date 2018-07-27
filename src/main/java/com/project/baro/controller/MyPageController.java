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

import com.project.baro.service.MyPageService;

@Controller
public class MyPageController {
	private final static String MAPPING = "/mypage/";
	
	@Autowired
	MyPageService mypageservice;
	
	@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(@RequestParam Map<String, Object> paramMap ,@PathVariable String action,
			ModelAndView modelandView) {String viewName = MAPPING + action;
			Map<String,Object> resultMap = new HashMap<String, Object>();
			List<Object> resultList = new ArrayList<Object>();
			
			if("update".equalsIgnoreCase(action)){

				 mypageservice.update_user_info("",paramMap);
				 viewName = "/mypage";
			}
			modelandView.setViewName(viewName);
			modelandView.addObject("paramMap",paramMap);
			modelandView.addObject("resultMap",resultMap);
			modelandView.addObject("resultList",resultList);
			return modelandView;
			
		}

}

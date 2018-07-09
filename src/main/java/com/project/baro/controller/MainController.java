package com.project.baro.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.baro.service.MainService;

@Controller
public class MainController {
private final static String MAPPING = "/";
private static final Logger logger = LoggerFactory.getLogger(MainController.class);

@Autowired
MainService service;

@RequestMapping(value = "/", method = RequestMethod.GET)
public ModelAndView home(@RequestParam Map<String, Object> paramMap ,Locale locale, ModelAndView modelandView) {
	logger.info("Welcome home! The client locale is {}.", locale);
	
	Date date = new Date();
	DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	
	String formattedDate = dateFormat.format(date);
	
	
	modelandView.addObject("serverTime", formattedDate);
	
	Map<String,Object> resultMap = new HashMap<String, Object>();
	List<Object> resultList = new ArrayList<Object>();
	resultList = (List)service.getList(paramMap);
	
	modelandView.setViewName("/index");
	modelandView.addObject("paramMap",paramMap);
	modelandView.addObject("resultMap",resultMap);
	modelandView.addObject("resultList",resultList);
	return modelandView;
}

@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })
public ModelAndView actionMethod(@RequestParam Map<String, Object> paramMap ,@PathVariable String action,
		ModelAndView modelandView) {
		
		String viewName="/"+action;
		Map<String,Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();
		resultList = (List)service.getList(paramMap);
		
		
		modelandView.setViewName(viewName);
		modelandView.addObject("paramMap",paramMap);
		modelandView.addObject("resultMap",resultMap);
		modelandView.addObject("resultList",resultList);
		return modelandView;
		
	}


}

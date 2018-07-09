package com.project.baro.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.baro.service.LoginService;
import com.project.baro.service.SignupService;




@RestController
public class RestWSController {

	private final static String MAPPING = "/ws/";
	
	@Autowired
	private SignupService signupservice;
	@Autowired
	private LoginService loginservice;
	
	@RequestMapping(value = MAPPING+"{action}",
	method = { RequestMethod.GET, RequestMethod.POST },
	produces = "application/json") // 미디어 타입 관련 응답 생성
	public Object actionMethod(@RequestParam Map<String, Object> paramMap, @PathVariable String action) {
		Map resultMap = new HashMap<>();
		if("idcheck".equalsIgnoreCase(action)) {
			resultMap = (Map)signupservice.signup_idcheck("", paramMap);
		}else if("idfind".equalsIgnoreCase(action)) {
			resultMap = (Map)loginservice.login_idfind("", paramMap);
		}
			
	return resultMap;
		
	}
}

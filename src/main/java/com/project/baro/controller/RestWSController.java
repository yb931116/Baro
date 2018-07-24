package com.project.baro.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.baro.component.MapParamCollector;
import com.project.baro.service.EvaluationService;
import com.project.baro.service.GroupService;
import com.project.baro.service.LoginService;
import com.project.baro.service.SignupService;

@RestController
public class RestWSController {

	private final static String MAPPING = "/ws/";

	@Autowired
	private SignupService signupservice;
	@Autowired
	private LoginService loginservice;
	@Autowired
	private EvaluationService evaluationService;
	@Autowired
	private GroupService groupservice;

	@RequestMapping(value = MAPPING + "{action}", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json") // 미디어 타입 관련 응답 생성
	public Object actionMethod(MapParamCollector paramMethodMap,@RequestParam Map<String, Object> paramMap, @PathVariable String action) {
		Map resultMap = new HashMap<>();
		Map<Object,Object> paramMap2 = paramMethodMap.getMap();
		if ("idcheck".equalsIgnoreCase(action)) { // 아이디 중복체크
			resultMap = (Map) signupservice.signup_idcheck("", paramMap);
		} else if ("idfind".equalsIgnoreCase(action)) { // 아이디 찾기
			resultMap = (Map) loginservice.login_idfind("", paramMap);

		} else if ("pwfind".equalsIgnoreCase(action)) { // 비밀번호 찾기
			resultMap = (Map) loginservice.login_pwfind("", paramMap);
		} else if ("evaluation".equalsIgnoreCase(action)) {

			if (((String) (paramMap.get("type"))).equalsIgnoreCase("ID"))
				resultMap = (Map) evaluationService.SearchByID("", paramMap);
			else if (((String) (paramMap.get("type"))).equalsIgnoreCase("NAME"))
				resultMap = (Map) evaluationService.SearchByName("", paramMap);
		}
		else if ("group_update".equalsIgnoreCase(action)) {
			groupservice.group_update("", paramMap2);
		}else if ("group_delete".equalsIgnoreCase(action)) {
			groupservice.group_delete("", paramMap);
		}
		

		return resultMap;

	}
}

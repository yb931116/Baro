package com.project.baro.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.baro.component.MapParamCollector;
import com.project.baro.security.UserInfo;
import com.project.baro.service.EvaluationService;
import com.project.baro.service.GroupService;
import com.project.baro.service.LogicFocusService;
import com.project.baro.service.LoginService;
import com.project.baro.service.MyPageService;
import com.project.baro.service.SignupService;
import com.project.baro.service.StatisticsService;


// ajax를 처리하는 controller
@RestController
public class RestWSController {

	private final static String MAPPING = "/ws/";

	@Autowired
	private SignupService signupservice;
	@Autowired
	private LoginService loginservice;
	@Autowired
	private GroupService groupservice;
	@Autowired
	MyPageService mypageservice;
	@Autowired
	LogicFocusService logicfocusservice;
	@Autowired
	StatisticsService statisticsservice;
	@Autowired
	EvaluationService evaluationservice;

	@RequestMapping(value = MAPPING + "{action}", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json") // 미디어 타입 관련 응답 생성
	public Object actionMethod(MapParamCollector paramMethodMap,@RequestParam Map<String, Object> paramMap, @PathVariable String action,Principal principal) {

		Map resultMap = new HashMap<>();
		Map<String,Object> paramMap2 = paramMethodMap.getMap();
	
		UserInfo user = (UserInfo)(SecurityContextHolder.getContext().getAuthentication().getPrincipal());

//		아이디 중복체크
		if ("idcheck".equalsIgnoreCase(action)) { 
			resultMap = (Map) signupservice.signup_idcheck("", paramMap);

//		아이디 찾기
		} else if ("idfind".equalsIgnoreCase(action)) { 
			resultMap = (Map) loginservice.login_idfind("", paramMap);

//		비밀번호 찾기
		} else if ("pwfind".equalsIgnoreCase(action)) {
			resultMap = (Map) loginservice.login_pwfind("", paramMap);

//		그룹 업데이트
		} else if ("group_update".equalsIgnoreCase(action)) {
			groupservice.group_update("", paramMap2);

//		그룹 삭제
		}else if ("group_delete".equalsIgnoreCase(action)) {
			groupservice.group_delete("", paramMap);
			
//		mypage 메뉴 중 내가 제시한 문제 List 출력
		}else if("myproblem_list".equalsIgnoreCase(action)) {
			resultMap.put("myproblemList", mypageservice.myproblem_list("", paramMap));
			resultMap.put("myanswerList", mypageservice.myanswer_list("", paramMap));
			resultMap.put("user_info", mypageservice.get_user_info("", paramMap));
			
//		Logic 평가를 등록
		}else if("setEvaluationLogic".equalsIgnoreCase(action)) {
			paramMap.put("user_id", user.getUserId());			
			resultMap.put("result", evaluationservice.setEvaluationLogic("evaluation.setEvaluationLogic",paramMap));
			resultMap.putAll((Map) evaluationservice.getEvaluationLogic("evaluation.getEvalutationLogic", paramMap));
		
//		Project 평가를 등록
		}else if("setEvaluationProject".equalsIgnoreCase(action)) {
			paramMap.put("user_id", user.getUserId());			
			resultMap.put("result",evaluationservice.setEvaluationProject("evaluation.setEvaluationProject",paramMap));
			resultMap.putAll((Map) evaluationservice.getEvaluationProject("evaluation.getEvalutationProject", paramMap));
		
//		나의 정보를 출력
		}else if("myinfo".equalsIgnoreCase(action)) {
			resultMap = (Map) mypageservice.get_user_info("", paramMap);
			
//		통계 메뉴의 pjt 찾기
		}else if("searchProject".equalsIgnoreCase(action)) {
			resultMap = (Map)statisticsservice.SearchProject("statistics.SearchProject",paramMap);
			
//		pagination 다음 화면으로 전환
		}else if("move_page".equalsIgnoreCase(action)) {
			resultMap = (Map)statisticsservice.getListPagination("", paramMap2);
		}
		

		return resultMap;

	}
}

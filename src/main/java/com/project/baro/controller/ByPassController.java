package com.project.baro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ByPassController {
	
	
	/**
	 * method default�� GET
	 */


	
	@RequestMapping(value = "/mypage")
	public String byPass3() {	
		return "/mypage";
	}
	
//	@RequestMapping(value = "/group")
//	public String byPass4() {	
//		return "/group";
//	}



}

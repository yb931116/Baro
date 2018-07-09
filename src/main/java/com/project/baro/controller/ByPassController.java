package com.project.baro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ByPassController {
	
	
	/**
	 * method default�� GET
	 */
	
	@RequestMapping(value = "/index")
	public String byPass() {	
		return "/index";
	}
	
	@RequestMapping(value = "/statistics")
	public String byPass2() {	
		return "/statistics";
	}
	
	@RequestMapping(value = "/mypage")
	public String byPass3() {	
		return "/mypage";
	}


	

}

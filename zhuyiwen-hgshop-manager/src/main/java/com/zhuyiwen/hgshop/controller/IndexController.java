package com.zhuyiwen.hgshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class IndexController {
	
	/**
	 * 
	 * @return
	 */
	@GetMapping("login")
	public String toLogin() {
		return "login";
	}
	
	@RequestMapping({"/","/index"})
	public String index() {
		return "index";
	}
	
}

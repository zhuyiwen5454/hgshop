package com.zhuyiwen.hgshop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RequestMapping("brand")
@Controller
public class BrandController {

	/**
	 * 
	 * @param request
	 * @param page
	 * @return
	 */
	@RequestMapping("list")
	public String list( HttpServletRequest request,@RequestParam(defaultValue = "1") int page) {
		return "brand/list";
	}
}

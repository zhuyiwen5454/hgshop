package com.zhuyiwen.hgshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhuyiwen.hgshop.pojo.Category;
import com.zhuyiwen.hgshop.service.CategoryService;



@Controller
@RequestMapping("cat")
public class CategoryController {
	
	@Reference
	CategoryService catService;
	
	/**
	 * 进入分类管理的首页
	 * @return
	 */
	@RequestMapping("index")
	public String index() {
		return "cat/index";
	}
	
	@RequestMapping("getTree")
	@ResponseBody
	public List<Category> treeData(){
		
		return catService.list(0);
		
	}
	
	@RequestMapping("update")
	@ResponseBody
	public boolean update(HttpServletRequest request,Category cat) {
		return catService.update(cat)>0;
	}
	
	
	
	@RequestMapping("add")
	@ResponseBody
	public boolean add(HttpServletRequest request,Category cat) {
		return catService.add(cat)>0;
	}
	
	@RequestMapping("del")
	@ResponseBody
	public boolean del(HttpServletRequest request,int id) {
		return catService.delete(id)>0;
	}
	

}

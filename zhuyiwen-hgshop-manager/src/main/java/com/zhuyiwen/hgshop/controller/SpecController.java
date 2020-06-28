
package com.zhuyiwen.hgshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhuyiwen.hgshop.pojo.Spec;
import com.zhuyiwen.hgshop.pojo.SpecOption;
import com.zhuyiwen.hgshop.service.SpecService;
import com.github.pagehelper.PageInfo;




@Controller
@RequestMapping("spec")
public class SpecController {
	
	@Reference
	SpecService specService;
	
	/**
	 * 
	 * @param request
	 * @param page
	 * @return
	 */
	@RequestMapping("list")
	public String list( HttpServletRequest request, @RequestParam(defaultValue ="") String name, @RequestParam(defaultValue = "1") int page) {
	
		PageInfo<Spec> pageInfo = specService.list(name, page, 5);
		//pageInfo.getPages()
		//pageInfo.getp
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("name", name);
		return "spec/list";
	}
	
	@RequestMapping("todd")
	public String todd() {
		return "spec/add";
	}

	@RequestMapping("add")
	@ResponseBody
	public boolean add( HttpServletRequest request, Spec spec) {
		
		// 过滤不合法的数据
		List<SpecOption> optionList = spec.getOptionList();
		for (int i = optionList.size(); i > 0; i--) {
			SpecOption option = optionList.get(i-1);
			//判断该数据是否合法  不合法的移除
			if(null == option.getOptionName() 
					|| "".equals(option.getOptionName()) 
					|| option.getOrders()<=0 ) {
				optionList.remove(i-1);
			}
		}
		int add = specService.add(spec);
		return add>0;
	}
	
	@RequestMapping("toupdate")
	public String toupdate(HttpServletRequest request,int id) {
		
		Spec spec = specService.getById(id);
		System.out.println(" spec is "+ spec);
		request.setAttribute("spec",spec );
		return "spec/update";
	}
	
	@RequestMapping("update")
	@ResponseBody
	public boolean update( HttpServletRequest request, Spec spec) {
		
		// 过滤不合法的数据
		List<SpecOption> optionList = spec.getOptionList();
		for (int i = optionList.size(); i > 0; i--) {
			SpecOption option = optionList.get(i-1);
			//判断该数据是否合法  不合法的移除
			if(null == option.getOptionName() 
					|| "".equals(option.getOptionName()) 
					|| option.getOrders()<=0 ) {
				optionList.remove(i-1);
			}
		}
		int add = specService.update(spec);
		return add>0;
	}
	
	/**
	 * 批量删除
	 * @param request
	 * @param ids
	 * @return
	 */
	@RequestMapping("delBatch")
	@ResponseBody
	public boolean delBatch(HttpServletRequest request, @RequestParam(value="ids[]") int[] ids) {
		System.err.println(" ids is " + ids);
		
		int result  = specService.delete(ids);
		return result>0;
	}
	
	
}

package com.zhuyiwen.hgshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zhuyiwen.hgshop.pojo.Sku;
import com.zhuyiwen.hgshop.pojo.SkuVo;
import com.zhuyiwen.hgshop.pojo.Spec;
import com.zhuyiwen.hgshop.pojo.SpecOption;
import com.zhuyiwen.hgshop.pojo.Spu;
import com.zhuyiwen.hgshop.service.SkuService;
import com.zhuyiwen.hgshop.service.SpecService;
import com.zhuyiwen.hgshop.service.SpuService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("sku")
public class SkuController {
	
	@Autowired
	FileUpload fileUpload;
	
	@Reference
	SkuService skuService;
	
	@Reference
	SpuService spuService;
	
	@Reference
	SpecService specService;
	
	
	@RequestMapping("list")
	public  String list(HttpServletRequest request,SkuVo skuVo) {
		PageInfo<Sku> pageInfo = skuService.list(skuVo);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("skuVo", skuVo);
		
		List<Sku> list = pageInfo.getList();
		System.out.println(" list  " + list);
		
		System.out.println("pageInfo is " + pageInfo);
		
		return "sku/list";
	}
	
	/**
	 * 从spu的列表页面进入添加sku的页面
	 * @param request
	 * @param spuId
	 * @return
	 */
	@RequestMapping("toadd")
	public String toAdd(HttpServletRequest request,int spuId) {
		
		Spu spu = spuService.getById(spuId);
		List<Spec> specs = specService.listNames();
		
		request.setAttribute("spu", spu);
		request.setAttribute("specs", specs);
		
		return "sku/add";
	}
	
	@RequestMapping("add")
	@ResponseBody
	public String add(HttpServletRequest request,HttpServletResponse response,Sku sku,
			MultipartFile imageFile,
			MultipartFile cartThumbnailFile) {
		//处理文件
		String imagePath = fileUpload.uploadd(imageFile);
		sku.setImage(imagePath);
		
		//处理文件
		String cartThumbnailPath = fileUpload.uploadd(cartThumbnailFile);
		sku.setCartThumbnail(cartThumbnailPath);
		
		// 过滤无效的数据
		List<SpecOption> optionList = sku.getOptionList();
		for (int i = optionList.size()-1; i >=0; i--) {
			SpecOption option = optionList.get(i);
			//数据无效的判定
			if(option.getSpecId()==0 || option.getOptionId()==0) {
				optionList.remove(i);
			}
		}
		
		int result = skuService.add(sku);
		
		response.setContentType("text/plain;charset=UTF-8");
		
		return result>0? "成功" : "失败";
	}
	
	 /* 根据规格id 获取属性值的列表
	 * @param request
	 * @param specId
	 * @return
	 */
	@RequestMapping("getOptions")
	@ResponseBody
	public  List<SpecOption> getOptions(HttpServletRequest request,int specId) {
		Spec spec = specService.getById(specId);
		System.out.println(" spec is "+ spec);
		return spec.getOptionList();
	}
	
	@RequestMapping("del")
	@ResponseBody
	public  boolean del(HttpServletRequest request,@RequestParam("ids[]") int[] ids) {
		 int delResult = skuService.delBatch(ids);
		return delResult>0;
	}
	
	

	/*
	 * @RequestMapping("test")
	 * 
	 * @ResponseBody public String test(HttpServletRequest
	 * request,HttpServletResponse response) {
	 * //response.setCharacterEncoding("UTF-8");
	 * response.setContentType("text/plain;charset=UTF-8"); return "这是一个测试"; }
	 */
	
}

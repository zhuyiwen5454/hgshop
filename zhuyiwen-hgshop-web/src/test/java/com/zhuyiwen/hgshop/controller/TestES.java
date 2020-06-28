package com.zhuyiwen.hgshop.controller;


import org.apache.dubbo.config.annotation.Reference;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.github.pagehelper.PageInfo;
import com.zhuyiwen.hgshop.pojo.Spu;
import com.zhuyiwen.hgshop.pojo.SpuEs;
import com.zhuyiwen.hgshop.pojo.SpuVo;
import com.zhuyiwen.hgshop.service.SpuService;

@ContextConfiguration("classpath:test-consumer.xml")
@RunWith(SpringRunner.class)
public class TestES {
	
	@Reference
	SpuService spuService;

	@Autowired
	ElSearchUtil<SpuEs> esUtil;
	
	
	@Test
	public void testEs() {
		SpuVo spuVo = new SpuVo();
		
		spuVo.setPage(1);
		spuVo.setPageSize(1000);
		
		PageInfo<Spu> pageInfo = spuService.list(spuVo);
		pageInfo.getList().forEach(x->{
			SpuEs es = new SpuEs(x);
			esUtil.saveObject(es.getId()+"", es);
		});
		
	}

}

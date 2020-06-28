package com.zhuyiwen.hgshop.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zhuyiwen.hgshop.pojo.Sku;
import com.zhuyiwen.hgshop.pojo.SkuVo;


public interface SkuService {
	
	int add(Sku sku);
	
	int delBatch(int[] ids);
	
	int update(Sku sku);
	
	PageInfo<Sku> list(SkuVo skuVo);
	
	Sku getById(int id);

	List<Sku> listBySpuId(int spuId);

}

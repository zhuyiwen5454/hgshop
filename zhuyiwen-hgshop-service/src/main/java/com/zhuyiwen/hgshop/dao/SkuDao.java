package com.zhuyiwen.hgshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhuyiwen.hgshop.pojo.Sku;
import com.zhuyiwen.hgshop.pojo.SkuVo;
import com.zhuyiwen.hgshop.pojo.SpecOption;




public interface SkuDao {

	int add(Sku sku);

	int addOption(@Param("skuId") Integer id, @Param("option") SpecOption specOption);

	int delBatch(int[] ids);

	int delBatchOptions(int ...ids);

	int update(Sku sku);

	List<Sku> list(SkuVo skuVo);

	Sku getById(int id);

	List<Sku> listBySpuId(int spuId);
	

}

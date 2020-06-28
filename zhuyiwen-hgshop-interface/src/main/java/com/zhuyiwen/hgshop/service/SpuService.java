package com.zhuyiwen.hgshop.service;

import com.github.pagehelper.PageInfo;
import com.zhuyiwen.hgshop.pojo.Spu;
import com.zhuyiwen.hgshop.pojo.SpuVo;


public interface SpuService {
	
	/**
	 * 查询
	 * @param spuVo
	 * @return
	 */
	PageInfo<Spu> list(SpuVo spuVo);
	
	int add(Spu spu);
	
	int deleteBatch(int[] ids);
	
	int update(Spu spu);
	
	Spu getById(int id);

	void del(int id);
	
	
	
	

}

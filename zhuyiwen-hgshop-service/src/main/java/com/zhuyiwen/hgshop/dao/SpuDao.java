package com.zhuyiwen.hgshop.dao;

import java.util.List;

import com.zhuyiwen.hgshop.pojo.Spu;
import com.zhuyiwen.hgshop.pojo.SpuVo;




public interface SpuDao {

	int add(Spu spu);

	int delBatch(int[] ids);

	int update(Spu spu);

	Spu getById(int id);

	List<Spu> list(SpuVo spuVo);

	void del(int id);

}

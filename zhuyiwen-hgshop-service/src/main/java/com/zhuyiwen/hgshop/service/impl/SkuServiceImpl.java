package com.zhuyiwen.hgshop.service.impl;

import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhuyiwen.hgshop.dao.SkuDao;
import com.zhuyiwen.hgshop.pojo.Sku;
import com.zhuyiwen.hgshop.pojo.SkuVo;
import com.zhuyiwen.hgshop.pojo.SpecOption;
import com.zhuyiwen.hgshop.service.SkuService;


@Service(interfaceClass = SkuService.class)
public class SkuServiceImpl  implements SkuService{
	
	@Autowired
	SkuDao skuDao;

	@Override
	public int add(Sku sku) {
		// TODO Auto-generated method stub
		
		// 添加主表
		int result = skuDao.add(sku);
		//添加子表
		List<SpecOption> optionList = sku.getOptionList();
		for (SpecOption specOption : optionList) {
			//添加子表
			result+=skuDao.addOption(sku.getId(),specOption);
		}
		
		return result;
		
	}

	@Override
	public int delBatch(int[] ids) {
		// TODO Auto-generated method stub
		//先删除子表
		int result = skuDao.delBatchOptions(ids);
		//删除主表
		result += skuDao.delBatch(ids);
		return result;
	}

	@Override
	public int update(Sku sku) {
		// TODO Auto-generated method stub
		int result = skuDao.update(sku);
		//删除子表
		result += skuDao.delBatchOptions(sku.getId());
		
		//重新插入子表
		List<SpecOption> optionList = sku.getOptionList();
		for (SpecOption specOption : optionList) {
			//添加子表
			result+=skuDao.addOption(sku.getId(),specOption);
		}
		
		return result;
	}

	@Override
	public PageInfo<Sku> list(SkuVo skuVo) {
		// TODO Auto-generated method stub
		PageHelper.startPage(skuVo.getPage(), skuVo.getPageSize());
		return new PageInfo<Sku>(skuDao.list(skuVo));
		
	}

	@Override
	public Sku getById(int id) {
		// TODO Auto-generated method stub
		return skuDao.getById(id);
	}

	@Override
	public List<Sku> listBySpuId(int spuId) {
		// TODO Auto-generated method stub
		return skuDao.listBySpuId(spuId);
	}

}

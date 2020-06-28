package com.zhuyiwen.hgshop.service.impl;

import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhuyiwen.hgshop.dao.SpecDao;
import com.zhuyiwen.hgshop.pojo.Spec;
import com.zhuyiwen.hgshop.pojo.SpecOption;
import com.zhuyiwen.hgshop.service.SpecService;




@Service(interfaceClass = SpecService.class)
public class SpecServiceImpl  implements SpecService{
	
	@Autowired
	SpecDao specDao;

	@Override
	public PageInfo<Spec> list(String name, int page, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, pageSize);
		return new PageInfo<Spec>(specDao.list(name));
	}

	@Override
	public int add(Spec spec) {
		// TODO Auto-generated method stub
		//插入主表
		int result = specDao.addSpec(spec);
		
		List<SpecOption> optionList = spec.getOptionList();
		for (SpecOption specOption : optionList) {
			// 赋值逻辑外键
			specOption.setSpecId(spec.getId());
			result += specDao.addSpecOption(specOption);
		}
		
		return result;
	}

	@Override
	public int delete(int[] ids) {
		// TODO Auto-generated method stub
		//先删除子表
		int result = specDao.deleteSpecOptions(ids);
		//删除主表
		 result += specDao.deleteSpec(ids);
		return result;
	}

	@Override
	public int update(Spec spec) {
		// TODO Auto-generated method stub
		//先修改主表
		int result = specDao.update(spec);
		//删除主表
		// 删除子表数据
		result += specDao.deleteSpecOptions(spec.getId());
		
		//重新插入子表数据
		List<SpecOption> optionList = spec.getOptionList();
		for (SpecOption specOption : optionList) {
			// 赋值逻辑外键
			specOption.setSpecId(spec.getId());
			result += specDao.addSpecOption(specOption);
		}
		
		return result;
	}

	@Override
	public Spec getById(int id) {
		// TODO Auto-generated method stub
		return specDao.getById(id);
	}

	@Override
	public List<Spec> listNames() {
		// TODO Auto-generated method stub
		return specDao.listNames();
	}

}

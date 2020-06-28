package com.zhuyiwen.hgshop.service.impl;

import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.zhuyiwen.hgshop.dao.BrandDao;
import com.zhuyiwen.hgshop.pojo.Brand;
import com.zhuyiwen.hgshop.service.BrandService;








@Service(interfaceClass = BrandService.class)
public class BrandServiceImpl implements BrandService {
	
	@Autowired
	BrandDao brandDao;

	@Override
	public List<Brand> list() {
		// TODO Auto-generated method stub
		return brandDao.list();
	}

}

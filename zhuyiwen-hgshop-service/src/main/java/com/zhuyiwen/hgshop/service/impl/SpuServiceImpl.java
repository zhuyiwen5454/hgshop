package com.zhuyiwen.hgshop.service.impl;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhuyiwen.hgshop.dao.SpuDao;
import com.zhuyiwen.hgshop.pojo.Spu;
import com.zhuyiwen.hgshop.pojo.SpuVo;
import com.zhuyiwen.hgshop.service.SpuService;


@Service(interfaceClass = SpuService.class)
public class SpuServiceImpl  implements SpuService{
	
	@Autowired
	SpuDao spuDao;
	
	@Autowired
	KafkaTemplate<String, String> kafkaTemplate;

	@Override
	public PageInfo<Spu> list(SpuVo spuVo) {
		// TODO Auto-generated method stub
		PageHelper.startPage(spuVo.getPage(),spuVo.getPageSize());
		return new PageInfo<Spu>(spuDao.list(spuVo));
		
	}

	@Override
	public int add(Spu spu) {
		// TODO Auto-generated method stub
		 int add = spuDao.add(spu);
		 // 商品发部成功以后要发送消息，让其他子系统进行相应的处理
		 if(add>0) {
			 kafkaTemplate.send("hgshop", "add", spu.getId()+"");
		 }
		 return add;
	}

	@Override
	public int deleteBatch(int[] ids) {
		// TODO Auto-generated method stub
		return spuDao.delBatch(ids);
	}

	@Override
	public int update(Spu spu) {
		// TODO Auto-generated method stub
		return spuDao.update(spu);
	}

	@Override
	public Spu getById(int id) {
		// TODO Auto-generated method stub
		return spuDao.getById(id);
	}

	@Override
	public void del(int id) {
		// TODO Auto-generated method stub
		spuDao.del(id);
	}

}

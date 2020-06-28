package com.zhuyiwen.hgshop.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zhuyiwen.hgshop.pojo.Spec;



public interface SpecService {
	
	/**
	 * 分页查询
	 * @param name  名称模糊查询条件
	 * @param page  页面
	 * @param pageSize 页面的大小
	 * @return
	 */
	PageInfo<Spec> list(String name,int page,int pageSize);
	
	/**
	 * 添加
	 * @param spec
	 * @return
	 */
	int add(Spec spec);
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	int delete(int[] ids);
	
	/**
	 * 修改
	 * @param spec
	 * @return
	 */
	int update(Spec spec);
	
	/**
	 * 根据id获取规格的数据
	 * @param id
	 * @return
	 */
	Spec getById(int id);
	
	/**
	 * 列出所有的规格名称
	 * @param name
	 * @return
	 */
	List<Spec> listNames();
	
}

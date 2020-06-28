package com.zhuyiwen.hgshop.dao;

import java.util.List;

import com.zhuyiwen.hgshop.pojo.Category;




public interface CategoryDao {

	List<Category> listByParentId(int parentId);

	int add(Category cat);

	int update(Category cat);

	int delete(int id);

}

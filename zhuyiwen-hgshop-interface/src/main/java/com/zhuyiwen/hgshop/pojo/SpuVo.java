package com.zhuyiwen.hgshop.pojo;

public class SpuVo  extends Spu {
	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7663980881786362932L;
	
	

	private String searchKey;//查询的关键字
	
	private String sortField="id";//排序的字段
	
	private String sortType = "ASC";//
	
	private int page=1;
	private int pageSize=12;
	

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSortField() {
		return sortField;
	}

	public void setSortField(String sortField) {
		this.sortField = sortField;
	}

	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

	@Override
	public String toString() {
		return "SpuVo [searchKey=" + searchKey + ", sortField=" + sortField + ", sortType=" + sortType + ", page="
				+ page + ", pageSize=" + pageSize + "]";
	}

	
	
	
	
	

}

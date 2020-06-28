package com.zhuyiwen.hgshop.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class SkuVo extends Sku  implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 2755695576119711954L;
	
	/*
	 * private Integer id;// 主键id private String title ;//标题 private String
	 * sellPoint ;//卖点 private BigDecimal price ;//价格 private int stockCount;// 库存
	 * private String barcode ;//条形码
	 * 
	 * private int status ;//状态
	 * 
	 * @DateTimeFormat(pattern = "yyyy-MM-dd") private Date createTime ;// 创建的时间
	 * 
	 * @DateTimeFormat(pattern = "yyyy-MM-dd") private Date updateTime ;//最后更新时间
	 * private BigDecimal costPrice ;//成本价格 private BigDecimal marketPrice ;//时长价格
	 * private String image ;//图片 private String cartThumbnail ;//购物车小图
	 * 
	 * 
	 * 
	 * private int spuId ;//spu的主键 private Spu spu;
	 */

	/**
	 * 用于时间的区间查询
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updateTimeMax=null;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updateTimeMin=null;
	private BigDecimal costPriceMax;
	private BigDecimal costPriceMin;
	private BigDecimal priceMax;
	private BigDecimal priceMin;
	private String searchKey;//查询的关键字
	//库存数量
	private  int stockCountMax=0;
	private  int stockCountMin=0;
	
	private String sortField="id";//排序的字段
	
	private int haveImage=0; //0 不限定 1 有图  2 无图  
	
	private String sortType = "ASC";//
	
	
	
	public int getStockCountMax() {
		return stockCountMax;
	}
	public void setStockCountMax(int stockCountMax) {
		this.stockCountMax = stockCountMax;
	}
	public int getStockCountMin() {
		return stockCountMin;
	}
	public void setStockCountMin(int stockCountMin) {
		this.stockCountMin = stockCountMin;
	}
	/**
	 * 价格的区间查询
	 */

	
	public Date getUpdateTimeMax() {
		return updateTimeMax;
	}
	public void setUpdateTimeMax(Date updateTimeMax) {
		this.updateTimeMax = updateTimeMax;
	}
	public Date getUpdateTimeMin() {
		return updateTimeMin;
	}
	public void setUpdateTimeMin(Date updateTimeMin) {
		this.updateTimeMin = updateTimeMin;
	}
	public BigDecimal getCostPriceMax() {
		return costPriceMax;
	}
	public void setCostPriceMax(BigDecimal costPriceMax) {
		this.costPriceMax = costPriceMax;
	}
	public BigDecimal getCostPriceMin() {
		return costPriceMin;
	}
	public void setCostPriceMin(BigDecimal costPriceMin) {
		this.costPriceMin = costPriceMin;
	}
	public BigDecimal getPriceMax() {
		return priceMax;
	}
	public void setPriceMax(BigDecimal priceMax) {
		this.priceMax = priceMax;
	}
	public BigDecimal getPriceMin() {
		return priceMin;
	}
	public void setPriceMin(BigDecimal priceMin) {
		this.priceMin = priceMin;
	}
	public int getHaveImage() {
		return haveImage;
	}
	public void setHaveImage(int haveImage) {
		this.haveImage = haveImage;
	}

	
	
	
	
	private int page=1;
	private int pageSize=10;
	
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
	
	@Override
	public String toString() {
		return "SkuVo [updateTimeMax=" + updateTimeMax + ", updateTimeMin=" + updateTimeMin + ", costPriceMax="
				+ costPriceMax + ", costPriceMin=" + costPriceMin + ", priceMax=" + priceMax + ", priceMin=" + priceMin
				+ ", searchKey=" + searchKey + ", sortField=" + sortField + ", haveImage=" + haveImage + ", sortType="
				+ sortType + ", page=" + page + ", pageSize=" + pageSize + "]";
	}
	
	
	
}

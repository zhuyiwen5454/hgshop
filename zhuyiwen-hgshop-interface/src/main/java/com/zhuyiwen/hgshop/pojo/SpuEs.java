package com.zhuyiwen.hgshop.pojo;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;


@Document(indexName = "hgshop",type = "spu"  )
public class SpuEs  implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -9148474251621657993L;
	
	@Id
	private Integer id;//	主键id
	private String goodsName	;//商品名称
	private int isMarketable	;//是否上架
	private String caption	;//标题
	private String categoryId;//	分类的id
	private int brandId	;//品牌的主键id
	private String smallPic	;//小图
	private String categoryName;//分类
	private String brandName;//品牌
	
	
	
	public SpuEs() {
		super();
	}

	
	/**
	 * 
	 * @param spu
	 */
	public SpuEs(Spu  spu) {
		super();
		this.id=spu.getId();
		this.goodsName=spu.getGoodsName();
		this.isMarketable=spu.getIsMarketable();
		this.caption=spu.getCaption();
		this.categoryId=spu.getCategoryId();
		this.brandId=spu.getBrandId();
		this.smallPic=spu.getSmallPic();
		this.categoryName=spu.getCategory()==null?"":spu.getCategory().getName();
		this.brandName=spu.getBrand()==null?"":spu.getBrand().getName();
				
		
	}

	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getIsMarketable() {
		return isMarketable;
	}
	public void setIsMarketable(int isMarketable) {
		this.isMarketable = isMarketable;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	public String getSmallPic() {
		return smallPic;
	}
	public void setSmallPic(String smallPic) {
		this.smallPic = smallPic;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "SpuEs [id=" + id + ", goodsName=" + goodsName + ", isMarketable=" + isMarketable + ", caption="
				+ caption + ", categoryId=" + categoryId + ", brandId=" + brandId + ", smallPic=" + smallPic
				+ ", categoryName=" + categoryName + ", brandName=" + brandName + "]";
	}
	
	

}

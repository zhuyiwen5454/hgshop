<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<div class="container-fluid">
	<div class="row">
		<form id="queryForm">
		<input type="hidden" name="page" value="${skuVo.page}" id="page">	
		<div class="form-group row">
		    <label for="inputkey" class="col-sm-2 col-form-label">关键字</label>
		    <div class="col-sm-4">
		      <input type="text" name="searchKey" value="${skuVo.searchKey}" class="form-control" id="inputkey">
		    </div>
		    
		    <label  class="col-sm-2 col-form-label">更新时间</label>
		    <div class="col-sm-4">
		      	<input type="date" name="updateTimeMin" value='<fmt:formatDate value="${skuVo.updateTimeMin}" pattern="yyyy-MM-dd"/>' >
		      	<input type="date" name="updateTimeMax" value='<fmt:formatDate value="${skuVo.updateTimeMax}" pattern="yyyy-MM-dd"/>' > 
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="inputkey" class="col-sm-2 col-form-label">价格</label>
		      <div class="col-sm-4">
		      	 从：<input type="number" name="priceMin" value="${skuVo.priceMin}"  > 到：
		      	 <input type="number" name="priceMax" value="${skuVo.priceMax}" > 
		    </div>
		    
		    <label for="inputkey" class="col-sm-2 col-form-label">成本</label>
		      <div class="col-sm-4">
		      	 从：<input type="number" name="costPriceMin" value="${skuVo.costPriceMin}"> 到：<input type="number" value="${skuVo.costPriceMax}" name="costPriceMax" > 
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="inputkey" class="col-sm-2 col-form-label">库存</label>
		    <div class="col-sm-4">
		     	 从：<input type="number" name="stockCountMin"   value="${skuVo.stockCountMin}" > 到：<input type="number" name="stockCountMax"   value="${skuVo.stockCountMax}" > 
		    </div>
		    
		    <label for="sortField" class="col-sm-2 col-form-label">是否有图</label>
		    <div class="col-sm-4">
		       <select id="haveImage" name="haveImage">
		       		<option value="0" ${skuVo.haveImage==0?'selected':''} >---不限---</option>
		       		<option value="1" ${skuVo.haveImage==1?'selected':''}>---有图---</option>
		       		<option value="2" ${skuVo.haveImage==2?'selected':''}>---无图---</option>
		       </select>
		    </div>
		  </div>
		  
		  
		  
		  
		  <div class="form-group row">
		  	
		  	<label for="sortField" class="col-sm-2 col-form-label">排序字段</label>
		    <div class="col-sm-4">
		       <select id="sortField" name="sortField">
		       		<option value="id">---请选择---</option>
		       		<option value="title" ${spuVo.sortField=='title'?'selected':''}>标题</option>
		       		<option value="price" ${spuVo.sortField=='price'?'selected':''}>是否上架</option>
		       		<option value="stock_count" ${spuVo.sortField=='stock_count'?'selected':''}>库存</option>
		       </select>
		    </div>
		    
		    <label for="sortType" class="col-sm-2 col-form-label">排序方式</label>
		    <div class="col-sm-4">
		       <select id="sortType" name="sortType">
		       		<option value="ASC" ${spuVo.sortType=='ASC'?'selected':''}>升序</option>
		       		<option value="DESC" ${spuVo.sortType=='DESC'?'selected':''}>降序</option>
		       </select>
		    </div>
		  </div>
		  
		   <div class="form-group row">
		   		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-success" onclick="query(1)">查询</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-danger">批量删除</button>
		   </div>
	  </form>
</div>  

	
	<div class="row">
		<table class="table">
			<tr>
			
	
				<th>id <input type="checkbox" id="ids"> </th>
				<th>标题</th>
				<th>卖点</th>
				<th>图片</th>
				<th>品牌</th>
				<th>分类</th>
				<th>价格</th>
				<th>库存数量</th>
				<th>商品名称</th>
				<th>修改时间</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${pageInfo.list}" var="sku">
				<tr>
					<td>${sku.id}  <input type="checkbox" id="id" value="${spu.id}"></td>
					<td>${sku.title}</td>
					<td>${sku.sellPoint}</td>
					<td><img alt="" src="/pic/${sku.image}" width="40" height="40"></td>
					<td>${sku.spu.brand.name}</td>
					<td>${sku.spu.category.name}</td>
					<td>${sku.price}</td>
					<td>${sku.stockCount}</td>
					<td>${sku.spu.goodsName}</td>
					<td><fmt:formatDate value="${sku.updateTime}" pattern="yyyy-MM-dd"/> </td>
					<td>
						<button type="button" onclick="toupdate(${sku.id})">修改</button>
						<button type="button" onclick="toDel(${sku.id})">删除</button>
						
					</td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
</div>

<script>
	//查询 
	function query(page){
		
		if(page>0){
			$("#page").val(page)
		}
		var formData = $("#queryForm").serialize();
		formData = serializeNotNull(formData)
		var url="sku/list"
		$("#workContent").load(url,formData);
		
	}
	
	function serializeNotNull(serStr){
	    return serStr.split("&").filter(str => !str.endsWith("=")).join("&");
	}
	
	//删除
	function toDel(skuId){
		
		var ids = new Array();
		ids.push(skuId)
		
		$.post('sku/del',{ids:ids},function(data){
			if(data==true){
				alert('删除成功')
				//刷新页面  还保留在当前的页面  不能跳转到第一页
				query(0);
			}else{
				alert('删除失败')
			}
		})
	}
	
	function toAdd(){
		$("#workContent").load('spu/toadd');
	}
	
	function toupdate(id){
		$("#workContent").load('spu/toupdate',{id:id});
	}
	
	function addSku(spuid){
		$("#workContent").load('sku/toadd',{spuId:spuid});
	}

</script>

    
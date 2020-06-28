<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<div class="container-fluid">
	<div class="row">
		<form id="queryForm">
		<div class="form-group row">
		    <label for="inputkey" class="col-sm-2 col-form-label">关键字</label>
		    <div class="col-sm-4">
		      <input type="text" name="searchKey" value="${spuVo.searchKey}" class="form-control" id="inputkey">
		    </div>
		    
		    <label for="brandsel" class="col-sm-2 col-form-label">品牌</label>
		    <div class="col-sm-4">
		       <select id="brandSel" name="brandId">
		       		<option value="0">---请选择---</option>
		       		<c:forEach items="${brands}" var="brand">
		       			<option value="${brand.id}" ${spuVo.brandId==brand.id?'selected':''} >${brand.name}</option>
		       		</c:forEach>
		       </select>
		    </div>
		  </div>
		  <div class="form-group row">
		  	
		  	<label for="sortField" class="col-sm-2 col-form-label">排序字段</label>
		    <div class="col-sm-4">
		       <select id="sortField" name="sortField">
		       		<option value="id">---请选择---</option>
		       		<option value="goods_name" ${spuVo.sortField=='goods_name'?'selected':''}>名称</option>
		       		<option value="is_marketable" ${spuVo.sortField=='is_marketable'?'selected':''}>是否上架</option>
		       		<option value="caption" ${spuVo.sortField=='caption'?'selected':''}>标题</option>
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
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-warning" onclick="toAdd()">添加</button>
		   </div>
	  </form>
  
	</div>
	<div class="row">
		<table class="table">
			<tr>
				<th>id <input type="checkbox" id="ids"> </th>
				<th>名称</th>
				<th>图片</th>
				<th>品牌</th>
				<th>分类</th>
				<th>上架</th>
				<th>标题</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${pageInfo.list}" var="spu">
				<tr>
					<td>${spu.id}  <input type="checkbox" id="id" value="${spu.id}"></td>
					<td>${spu.goodsName}</td>
					<td><img alt="" src="/pic/${spu.smallPic}" width="40" height="40"></td>
					<td>${spu.brand.name}</td>
					<td>${spu.category.name}</td>
					<td>${spu.isMarketable==1?'上架':'未上架'}</td>
					<td>${spu.caption}</td>
					<td>
						<button type="button" onclick="toupdate(${spu.id})">修改</button>
						<button>删除</button>
						<button onclick="addSku(${spu.id})">添加sku</button>
					</td>	
				</tr>
			</c:forEach>
			
		</table>
	</div>
</div>

<script>
	//查询 
	function query(page){
		var formData = $("#queryForm").serialize();
		var url="spu/list"
		$("#workContent").load(url,formData);
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

    
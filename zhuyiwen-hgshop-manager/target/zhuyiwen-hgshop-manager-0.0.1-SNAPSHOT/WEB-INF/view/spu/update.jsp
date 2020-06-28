<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<link href="${pageContext.request.contextPath}/resource/bootstrap-treeview/css/bootstrap-treeview.css" rel="stylesheet" >
<script src="${pageContext.request.contextPath}/resource/bootstrap-treeview/js/bootstrap-treeview.js" ></script>
    
   
<div class="container-fluid">

	<form id="addSpuForm">
	
		 <div class="form-group row">
		 	<input type="hidden" name="id" value="${spu.id}">
		    <label for="goodsName" class="col-sm-2 col-form-label">名称</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" value="${spu.goodsName}" name="goodsName" id="goodsName">
		    </div>
		  </div>
		  
		 <div class="form-group row">
		    <label for="goodsCaption" class="col-sm-2 col-form-label">标题</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" value="${spu.caption}" name="caption" id="goodsCaption">
		    </div>
		  </div>
		  
		   <div class="form-group row">
		   		<div  id="treeDiv" style="display: none;position: absolute;z-index: 1000 ;width:80% ">
		   			<div id="tree"></div>
		 		</div>
		   </div>
		  <div class="form-group row">
		  		<input type="hidden" name="categoryId" value="${spu.categoryId}" id="categoryId"> 
			  	<label for="goodsCategory" class="col-sm-2 col-form-label">分类</label>
			    <div class="col-sm-5">
			      <input type="text" disabled="disabled"  value="${spu.category.name}" class="form-control" id="goodsCategory">
			    </div>
			    <input onclick="showTree()"  value="....">
		  </div>
		  
		   <div class="form-group row">
		    <label for="goodsBrand" class="col-sm-2 col-form-label">品牌</label>
		    <div class="col-sm-10">
		       <select id="goodsBrand" name="brandId">
		       <option value="0">---请选择---</option>
		       		<c:forEach items="${brands}" var="brand">
		       			<option value="${brand.id}" ${spu.brandId==brand.id?'selected':''} >${brand.name}</option>
		       		</c:forEach>
		       </select>
		    </div>
		  </div>
		  
		 <div class="form-group row">
		    <label for="goodsSmapppic" class="col-sm-2 col-form-label">
		    	<img alt="" src="/pic/${spu.smallPic}" width="40" height="40">		
		    </label>
		    <div class="col-sm-10">
		      <input type="file" class="form-control" id="goodsSmapppic" name="myFile" >
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="goodsSmapppic" class="col-sm-2 col-form-label">是否上架</label>
		    <div class="col-sm-10">
		    	<input type="radio" value="1" name="isMarketable" ${isMarketable==1?'checked':''}>上架
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<input type="radio" value="0" name="isMarketable" ${isMarketable!=1?'checked':''}>不上架
		    </div>
		  </div>
		   <div class="form-group row">
		   			<button type="button" onclick="updateData()">添加</button>
		   </div>
	</form>

</div>   

<script>
	
	function showTree(){
		$("#treeDiv").show();
	}

	function initTree(){
		$.post("cat/getTree",{},function(data){
			$('#tree').treeview({
				  data: data,         // data is not optional
				  levels: 2,
				  onNodeSelected: function(event, data) {
					  if(data.nodes==null || data.nodes.length<1){
						  $("#goodsCategory").val(data.text)
						  $("#categoryId").val(data.id)
						  
					  }
					  $("#treeDiv").hide();
				}
				});
			
			  
		})
	}	
	
	initTree();
	
	function updateData(){
		var formData = new FormData($("#addSpuForm")[0]);
		
		$.ajax({url:'spu/update',
			data:formData,
			type:"post",
			processData:false,
			contentType:false,
			success:function(data){
				if(data==true){
					alert('添加成功')
					//跳转到列表页面
					var url="spu/list";
					$("#workContent").load(url)
				}else{
					alert('添加失败')
				}
			}
				
	})
	}
</script> 
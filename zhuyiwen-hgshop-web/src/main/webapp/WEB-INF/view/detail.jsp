<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品详情</title>
   <script type="text/javascript" src='${pageContext.request.contextPath}/resource/jquery/jquery-3.4.1.js'></script>
  <link href="${pageContext.request.contextPath}/resource/bootstrap4/css/bootstrap.css" rel="stylesheet" >	
  <link href="${pageContext.request.contextPath}/resource/bootstrap-treeview/css/bootstrap-treeview.css" rel="stylesheet" >
  <script src="${pageContext.request.contextPath}/resource/bootstrap-treeview/js/bootstrap-treeview.js" ></script>
  
  <style type="text/css">
	
	.selectedDiv {
		border: solid 2px red;
	}
	
	.noselectedDiv {
		border: solid 2px blue;
	}
	
</style>	

</head>
<body>
	<div class="container">
	
		<div class="row">
			 <!-- 显示商品 信息--> 
			<div class="col-md-3">
				<div class="card" style="width: 18rem;">
				<img src="/pic/${spu.smallPic}" width="120px" height="120px" class="card-img-top" alt="${spu.caption}">
					  <div class="card-body">
					    <h5 class="card-title">${spu.goodsName}</h5>
					    <p class="card-text">${spu.caption}</p>
					</div>
				</div>
			</div>
			
			<!-- 显示sku的信息 -->
			<div class="col-md-3" style="margin-left: 20px">
				<c:forEach items="${skuList}"  var="sku"  >
					<div style="margin: 10px" class="noselectedDiv"  onclick="divClick($(this),${sku.id})" onmouseenter="showImg('/pic/${sku.image}')">
						${sku.title}<br>
						<c:forEach items="${sku.optionList}" var="opt">
							${opt.specName}:${opt.optionName} &nbsp;&nbsp;
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			
			<div class="col-md-3" style="margin-left: 20px">
				<img id="imgid" alt="" src="" width="200" height="200">
			</div>
	</div>
	<div class="row">
			<input type="number" id="buyNum" name="buyNum" >
			<button type="button" class="btn btn-lg btn-primary"  onclick="addCart()" >加入购物车</button>
	</div>
	<!-- end row -->
</div>

<script>
	function showImg(imgurl){
		$("#imgid").attr("src",imgurl)
	}
	
	// 保存 被选中skuId
	var skuId=0;
	function divClick(divObj,selId){
		//
		skuId= selId
		
		$(".selectedDiv").each(function(){
			$(this).removeClass("selectedDiv")
		})
		
		divObj.removeClass("noselectedDiv")
		divObj.addClass("selectedDiv")
	}
	
	//加入购物车
	function addCart(){
		if(skuId==0)
		{
			alert('请选择商品')	
			return ;	
		}	
		var pnum = $("#buyNum").val();
		if(pnum < 1){
			alert('购买数量不合法')	
			return ;	
		}
		
		$.post('./user/addcart',{skuId:skuId,buyNum:pnum},function(data){
			alert(data)
		})
		
	}
	
	
</script>
	
</body>
</html>
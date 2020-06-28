<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>豪哥商城</title>
  <script type="text/javascript" src='${pageContext.request.contextPath}/resource/jquery/jquery-3.4.1.js'></script>
  <link href="${pageContext.request.contextPath}/resource/bootstrap4/css/bootstrap.css" rel="stylesheet" >	
  <link href="${pageContext.request.contextPath}/resource/bootstrap-treeview/css/bootstrap-treeview.css" rel="stylesheet" >
  <script src="${pageContext.request.contextPath}/resource/bootstrap-treeview/js/bootstrap-treeview.js" ></script>
</head>
<body>
<div class="container-fluid">

  <nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-center">
  <c:if test="${sessionScope.login_user!=null}">
  	${sessionScope.login_user.username}&nbsp;&nbsp;&nbsp;
    <a class="navbar-brand" href="./user/login">登出</a> 
  </c:if>
  
  <c:if test="${sessionScope.login_user==null}">
  	  首页&nbsp;&nbsp;&nbsp;
  	  	<a class="navbar-brand" href="./user/login">登录</a> 
  </c:if>
  
  


  <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
    <form class="form-inline my-2 my-lg-0" action="./search">
      <input class="form-control mr-sm-2" type="search" name="key" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
<div class="row" style="margin-top: 30px;margin-bottom: 50px ">
	
	<div class="col-md-3">
		<!-- 放分类树 -->
		<div id="tree">
			
		</div>
	</div>
	
	<!-- 存放每个商品 -->
	<div class="col-md-9">
		<div class="row">
			<c:forEach items="${pageInfo.list}" var="spu">
				<div class="col-md-4" style="padding: 5px" >
				<div class="card" style="width: 18rem;">
					  <img src="/pic/${spu.smallPic}" width="120px" height="120px" class="card-img-top" alt="${spu.caption}">
					  <div class="card-body">
					    <h5 class="card-title">${spu.goodsName}</h5>
					    <p class="card-text">${spu.caption}</p>
					    <a target="_blank"  href="./showdetail?spuId=${spu.id}" class="btn btn-primary">去购买</a>
					  </div>
					</div>
				</div>
			</c:forEach>
		</div> 
	</div>
	
	

</div>
	

</div>

 <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-bottom justify-content-center">
		版权所有----违者必究 	
</nav>
 
 </body>
<script type="text/javascript">

function initTree(){
	$.post("./getTree",{},function(data){
		$('#tree').treeview({
			  data: data,         // data is not optional
			  levels: 2,
			  onNodeSelected: function(event, data) {
				  // 点中末级节点	
				  if(data.nodes==null || data.nodes.length<1){
					var url = "./index?categoryId="+data.id;
					location.href=url;
				  }
			}
			});
		
		  
	})
}	

initTree();


</script>

</html>
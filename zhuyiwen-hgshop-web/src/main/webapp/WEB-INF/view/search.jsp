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
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
<div class="row" style="margin-top: 30px;margin-bottom: 50px ">
	
	<div class="col-md-2">
		
	</div>
	
	<!-- 存放每个商品 -->
	<div class="col-md-8">
		<div class="row">
			<c:forEach items="${pageInfo.content}" var="spu">
				<div class="col-md-4" style="padding: 5px" >
				<div class="card" style="width: 18rem;">
					  <img src="/pic/${spu.smallPic}" width="120px" height="120px" class="card-img-top">
					  <div class="card-body">
					    <h5 class="card-title">${spu.goodsName}</h5>
					    <p class="card-text">${spu.caption}</p>
					    <a target="_blank"  href="./showdetail?spuId=${spu.id}" class="btn btn-primary">去购买</a>
					  </div>
					</div>
				</div>
			</c:forEach>
		</div> 
		
		<div class="row"> 
			<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <li class="page-item ">
				      <a class="page-link" href="#" tabindex="-1" >首页</a>
				    </li>
				   <c:forEach begin="1" end="${pageInfo.totalPages}" var="page">
				    	<li class="page-item"><a class="page-link" href="javascript:goPage(${page})">${page}</a></li>
				    </c:forEach>
				    <li class="page-item">
				      <a class="page-link" href="#">尾页</a>
				    </li>
				  </ul>
				</nav>
		</div>
	</div>

</div>
	

</div>

 <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-bottom justify-content-center">
		版权所有----违者必究 	
</nav>
 
 </body>
<script type="text/javascript">

 function goPage(page){
	 location.href="./search?key=${key}&page="+page;
}


</script>

</html>
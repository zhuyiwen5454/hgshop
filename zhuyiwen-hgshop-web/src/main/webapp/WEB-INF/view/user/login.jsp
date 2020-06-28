<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- saved from url=(0053)https://v4.bootcss.com/docs/examples/floating-labels/ -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>Floating labels example · Bootstrap</title>
    <script type="text/javascript" src='${pageContext.request.contextPath}/resource/jquery/jquery-3.4.1.js'></script>
	<script type="text/javascript" src='${pageContext.request.contextPath}/resource/js/jquery.validate.js'></script>

 

    <!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resource/bootstrap4/css/bootstrap.css" rel="stylesheet" >

    <!-- Favicons -->

<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resource/css/floating-labels.css" rel="stylesheet">
  </head>
  <body>
    <form class="form-signin" id="registerForm"  method="post" action="../user/login">
  <div class="text-center mb-4">
    <img class="mb-4" src="${pageContext.request.contextPath}/resource/img/logo.jpg" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">欢迎使用豪哥商城</h1>
  </div>

  <div class="form-label-group">
    <input type="text" id="inputEmail" class="form-control" name="username" 
    placeholder="用户名称" >
    <label for="inputEmail">用户名称</label>
  </div>

  <div class="form-label-group">
    <input type="password" id="inputPassword" class="form-control" required name="password" placeholder="密码 required="">
    <label for="inputPassword">密码</label>
  </div>

  <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    <a href="./register">尚未注册，点击这里注册新用户</a>
  <p class="mt-5 mb-3 text-muted text-center">© 2017-2020</p>
</form>

<script type="text/javascript">
	$(function(){
		
		$("#registerForm").validate(
				
				      
		);
		
	})
	
</script>

</body></html>
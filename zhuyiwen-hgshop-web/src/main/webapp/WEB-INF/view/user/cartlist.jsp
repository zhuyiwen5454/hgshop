<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<div class="container-fluid">
	<div class="row">  
		   <div class="form-group row">
				&nbsp;&nbsp;<button type="button" class="btn btn-outline-danger">批量删除</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>配送地址：</label><input type="text" name="address" id="address"> 
				&nbsp;&nbsp;<button type="button" class="btn btn-outline-danger" onclick="createOrder()">下单</button>
		   </div>  
	</div>
	<div class="row">
		<table class="table">
			<tr>
				<th>id <input type="checkbox" id="ids"> </th>
				<th>名称</th>
				<th>图片</th>
				<th>购买数量</th>
				<th>单价</th>
				<th>总价</th>
				<th>加入时间</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${pageInfo.list}" var="cart">
				<tr>
					<td>${cart.id}  <input type="checkbox" name="id" value="${cart.id}"></td>
					<td>${cart.sku.title}</td>
					<td><img alt="" src="/pic/${cart.sku.cartThumbnail}" width="40" height="40"></td>
					<td>${cart.pnum}</td>
					<td>${cart.sku.price}</td>
					<td>${cart.pnum*cart.sku.price}</td>
					<td><fmt:formatDate value="${cart.updatetime}" pattern="yyyy-MM-dd"/> </td>
					<td>
						<button>移除</button>
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
		var url="../user/listcart"
		$("#workContent").load(url,{page:page});
	}
	
	function createOrder(){
		var idsArray = new Array();
		$("[name='id']:checked").each(function(){
			alert($(this).val())
			idsArray.push($(this).val())
		})
		
		if(idsArray.length<1){
			alert('请选择购物车的数据')
			return ;
		}
		
		
		//提交数据
		$.post('../user/createorder',{address:$("#address").val(),cartIds:idsArray},
				function(data){
				if(data){
					alert('成功')
					query(1)
				}else{
					alert('失败')
				}
		})
		
		
	}

</script>

    
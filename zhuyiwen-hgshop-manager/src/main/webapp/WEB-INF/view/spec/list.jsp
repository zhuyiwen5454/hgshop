<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<div>
	<div> 
		<form id="queryForm">
			<input name="name" value="${name}" >
			<input name="page" id="page" value="${pageInfo.pageNum}" >
		</form>
		<button type="button" class="btn btn-success" onclick="query()">查询</button>
		<button type="button" class="btn btn-success" onclick="toAdd()">添加</button>
		<button type="button" class="btn btn-info" onclick="delBatch()">批量删除</button>
	</div>
	<table class="table">
		<tr>
			<th>id <input type="checkbox" id="ids" onclick="checkAll()"> </th>
			<th>名称</th>
			<th>规格属性值 </th>
			<th>操作</th>
		</tr>	
		<c:forEach items="${pageInfo.list}" var="spec">
		<tr>
			<td > <input type="checkbox" name="id" value="${spec.id}" onclick="checkOne()"> ${spec.id} </td>
			<td>${spec.specName}</td>
			<td> <c:forEach items="${spec.optionList}" var="op" varStatus="opIndex" >
				<c:if test="${opIndex.index > 0}">,</c:if>${op.optionName}
			</c:forEach> </td>
			<td>
				<button type="button" class="btn btn-danger" onclick="del(${spec.id})" >删除</button>
				<button type="button" class="btn btn-danger" onclick="modify(${spec.id})">修改</button>
			</td>
		</tr>
		</c:forEach>
		<tr >
		<td colspan="4">
			<nav aria-label="Page navigation example">
				 <ul class="pagination">
				    <li class="page-item"><a class="page-link" href="#">首页</a></li>
				    <c:forEach begin="1" end="${pageInfo.pages}" var="page">
				    	<li class="page-item"><a class="page-link" href="javascript:void()" onclick="goPage(${page})" >${page}</a></li>
				    </c:forEach>
				    <li class="page-item"><a class="page-link" href="#">尾页</a></li>
				  </ul>
				</nav>
		</td></tr>
     </table>
	<div>
		翻页
	</div>

</div> 

<script>
	function toAdd(){
		var url = "spec/todd"
		$("#workContent").load(url)
	}
	
	//删除 
	function del(id){
		
	}
	
	//修改
	function modify(id){
		var url = "spec/toupdate"
		$("#workContent").load(url+"?id="+id)
	}
	
	// 处理全选全部选
	function checkAll(){
		var checked = $("#ids").prop("checked");
		$("[name=id]").each(function(){		
			$(this).prop("checked",checked)
		})
	}
	
	//其中一个复选框被选择的时候
	function checkOne(){
		// 是否全部被选中
		var selAll = ($("[name=id]").length==$("[name=id]:checked").length)
		$("#ids").prop("checked",selAll);
	}
	
	// 删除一条数据
	function del(id){
		var delIds = new Array();
		delIds.push(id);
	    if(confirm("您确认要删除该数据么？" + delIds)){
			
			$.post("spec/delBatch",{ids:delIds},function(data){
				if(data>0){
					alert('删除成功')
					//刷新
					$("#workContent").load("spec/list")
				}else{
					alert('删除失败')
				}
			})
		}
	}
	
	
	//批量删除
	function delBatch(){
		//
		var delIds = new Array();
		$("[name=id]:checked").each(function(){
			delIds.push($(this).val() )
		})
		
		if(delIds.length<1){
			alert('请选择删除的数据');
			return;
		}
		
		if(confirm("您确认要删除这些数据么？" + delIds)){
			
			$.post("spec/delBatch",{ids:delIds},function(data){
				if(data>0){
					alert('删除成功')
					//刷新
					$("#workContent").load("spec/list")
				}else{
					alert('删除失败')
				}
			})
		}
	}
	
	function goPage(page){
		$("#page").val(page)
		//查询
		query();
		
	}
	
	// 查询
	function query(){
		var formData = $("#queryForm").serialize();
		$("#workContent").load("spec/list",formData);
	}
	
</script>   
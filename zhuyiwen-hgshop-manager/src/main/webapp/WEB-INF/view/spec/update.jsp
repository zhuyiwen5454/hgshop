<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
<form id="specForm">
  <div class="form-group row">
    <label for="specName" class="col-sm-2 col-form-label">名称</label>
    <div class="col-sm-4">
      <input type="hidden" name="id" value="${spec.id}">	
      <input type="text" class="form-control" name="specName" id="specName" value="${spec.specName}">
    </div>
    <div class="col-sm-4">
      <input type="button"  class="btn btn-primary mb-2" value="添加属性" onclick="addOpt()" >
    </div>
  </div>
  <div class="form-group row">
  	<label for="inputPassword" class="col-sm-2 col-form-label">属性列表</label>
  	 <div class="col-sm-8">
  	 	<table class="table" id="table">
  	 		<tr>
  	 			<th>属性值</th>
  	 			<th>顺序</th>
  	 			<th>操作</th>	
  	 		</tr>
  	 		
  	 		<c:forEach items="${spec.optionList}" var="opt" varStatus="optIndex">
	  	 		<tr>
	  	 			<td><input name="optionList[${optIndex.index}].optionName" value="${opt.optionName}"> </td>
	  	 			<td><input type="number" name="optionList[${optIndex.index}].orders" value="${opt.orders}"> </td>
	  	 			<td><input type="button" value="删除" onclick="delOption($(this))"></td>
	  	 		</tr>
  	 		</c:forEach>
  	 		
  	 	</table>
  	 </div>
  </div>
 
   <div class="form-group row">
   		<input type="button" class="btn btn-primary" onclick="commitData()" >
   </div>
   
</form>

<script>
	//删除一行
	function delOption(obj){
		obj.parent().parent().remove();
	}
	
	// 序号计数器
	var optOndex=parseInt("${spec.optionList.size()}");
	function addOpt(){
		
		var htmlStr='<tr> ' + 
  	 			'<td><input name="optionList['+optOndex+'].optionName"> </td>' + 
  	 			'<td><input type="number" name="optionList['+optOndex+'].orders"> </td>' + 
  	 			'<td><input type="button" value="删除" onclick="delOption($(this))"></td> ' + 
  	 		'</tr>';
  	 	$("#table").append(htmlStr);	
  	 	optOndex++;	
	}
	
	function commitData(){
		
		var formData = new FormData($("#specForm")[0]);
		
		$.ajax({url:'spec/update',
			data:formData,
			type:"post",
			processData:false,
			contentType:false,
			success:function(data){
				if(data==true){
					alert('添加成功')
					//跳转到列表页面
					var url="spec/list";
					$("#workContent").load(url)
				}else{
					alert('添加失败')
				}
			}
				
	})
  }
</script>
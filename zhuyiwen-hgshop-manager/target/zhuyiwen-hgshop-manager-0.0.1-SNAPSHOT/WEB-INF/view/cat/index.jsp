<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/resource/bootstrap-treeview/css/bootstrap-treeview.css" rel="stylesheet" >
<script src="${pageContext.request.contextPath}/resource/bootstrap-treeview/js/bootstrap-treeview.js" ></script>
    
    
<div class="row">
	<div  class="col-md-4">
		<div id="tree"></div>
	</div>
	
	<div class="col-md-6">
		<!-- 用于添加的部分 -->
		<div>
			<form id="addForm">
				<div class="form-group row">
				    <label for="parentName" class="col-sm-3 col-form-label">父节点</label>
				    <input type="hidden" name="parentId"  id="parentId">
				    <div class="col-sm-6">
				      <input type="text" disabled="disabled" class="form-control" id="parentName">
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="parentPath" class="col-sm-3 col-form-label">父path</label>
				    <div class="col-sm-6">
				      <input type="text" disabled="disabled" class="form-control" id="parentPath">
				    </div>
				  </div>
				  
				  <div class="form-group row">
				  	<input type="hidden" name="path" id="nodePath">
				    <label for="catNodeName" class="col-sm-3 col-form-label">节点名称</label>
				    <div class="col-sm-6">
				      <input type="text"  class="form-control" id="catNodeName" name="name">
				    </div>
				  </div>
				  <button type="button" onclick="addCat()">添加数据</button>
			</form>
		</div>
		<br>
		<br>
		<br>
		<div>
			<form id="updateForm">
				<div class="form-group row">
					 <input type="hidden" name="id"  id="currentId">
				    <label for="currentPath" class="col-sm-3 col-form-label">节点path</label>
				    <div class="col-sm-6">
				      <input type="text" class="form-control" name="path" id="currentPath">
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="currnentNodeName" class="col-sm-3 col-form-label">节点名称</label>
				    <div class="col-sm-6">
				      <input type="text"  class="form-control" id="currnentNodeName" name="name">
				    </div>
				  </div>
				  <button type="button" onclick="delNode()" id="btnDel">删除节点</button>
				  <button type="button" onclick="saveNode()" id="btnUpdate" >保存节点</button>
			</form>
		</div>
		
	</div>
</div>    

<script>

	function initTree(){
		$.post("cat/getTree",{},function(data){
			$('#tree').treeview({
				  data: data,         // data is not optional
				  levels: 2,
				  onNodeSelected: function(event, data) {
					  alert(JSON.stringify(data))
					 //alert(data.id + "  " +  data.path)
					  $("#parentId").val(data.id)
					  $("#parentName").val(data.text)
					  $("#parentPath").val(data.path)
					  $("#catNodeName").val("")
					  $("#nodePath").val("")
					  
					  $("#currentId").val(data.id)
					  $("#currentPath").val(data.path)
					  $("#currnentNodeName").val(data.text)
					  if(data.nodes==null || data.nodes.length<1){
						  $("#btnDel").prop("disabled",false);  
					  }else{
						  $("#btnDel").prop("disabled",true);  
					  }  
				}
				});
			
			  //清空表单中的数据
		      $("#parentId").val(0)
			  $("#parentName").val("")
			  $("#parentPath").val("")
			  $("#catNodeName").val("")
			  $("#nodePath").val("")
			  
		})
	}
	
	initTree();
	
	function delNode() {
		$.post("cat/del",{id:$("#currentId").val()},function(data){
			if(data){
				alert('删除成功')
				initTree();
			}else{
				alert('删除失败')
			}
		})
	}
	
	function saveNode(){

		// 计算当前节点的path
		var formData = $("#updateForm").serialize();
		$.post("cat/update",formData,function(data){
			if(data){
				alert('修改成功')
				//刷新数据
				//initTree();
				
			}else{
				alert('提交失败')
			}
		})
	} 
	
	
	
	//添加节点
	function addCat(){
		
		// 计算当前节点的path
		$("#nodePath").val( $("#parentPath").val() + "/" + $("#catNodeName").val()); 
		var formData = $("#addForm").serialize();
		$.post("cat/add",formData,function(data){
			if(data){
				alert('提交成功')
				//刷新数据
				initTree();
			}else{
				alert('提交失败')
			}
		})
		
	}
</script>
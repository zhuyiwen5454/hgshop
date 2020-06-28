<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<script src="${pageContext.request.contextPath}/resource/js/jqueryvalidate/jquery.validate.js" ></script>
<script src="${pageContext.request.contextPath}/resource/js/jqueryvalidate/localization/messages_zh.js" ></script>
  
<script src="${pageContext.request.contextPath}/resource/js/jquery.form.js" ></script>
        
  
<div class="container-fluid">

	<form id="addSkuForm" action="sku/add" method="post" enctype="multipart/form-data">
		 <div class="form-group row">
		 	<input type="hidden" name="spuId" value="${spu.id}">
		    <label for="goodsName" class="col-sm-2 col-form-label">名称</label>
		    <div class="col-sm-10">
		      <input type="text" disabled="disabled" class="form-control" value="${spu.goodsName}" name="goodsName" id="goodsName">
		    </div>
		  </div>
		  
		 <div class="form-group row">
		    <label for="title" class="col-sm-2 col-form-label">标题</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="title" id="title"  required>
		    </div>
		  </div>
		  
		
		  
		  <div class="form-group row">
		    <label for="sellPoint" class="col-sm-2 col-form-label">卖点</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="sellPoint" id="sellPoint">
		    </div>
		  </div>
		  
		    <div class="form-group row">
		    <label for="marketPrice" class="col-sm-2 col-form-label">市场价格</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" name="marketPrice" id="marketPrice">
		    </div>
		  </div>
		  
		   <div class="form-group row">
		    <label for="costPrice" class="col-sm-2 col-form-label">成本价格</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" name="costPrice" id="costPrice">
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="price" class="col-sm-2 col-form-label">在售价格</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" name="price" id="price">
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="stockCount" class="col-sm-2 col-form-label">库存数量</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" name="stockCount" id="stockCount">
		    </div>
		  </div>
		  
		  <!-- 属性行 -->
		    <div class="form-group row">
		    <label  class="col-sm-2 col-form-label">规格</label>
		    <div class="col-sm-8">
		      	<table id="table">
		      		<tr>
		      			<th>规格名称</th>
		      			<th>属性值</th>
		      			<th>操作  <button type="button" onclick="addLine()">添加</button>  </th>
		      		</tr>
		      		<tr>
		      			<td><select name="optionList[0].specId" onchange="specChange($(this))" >
		      					<option value="0">请选择</option>
		      					<c:forEach items="${specs}" var="spec" >
		      						<option value="${spec.id}">${spec.specName}</option>
		      					</c:forEach>
		      				</select> 
		      			</td>
		      			<td>
		      				<select name="optionList[0].optionId">
		      					
		      				</select>
		      			</td>
		      			<td>
		      				<button type="button" onclick="delLine($(this))">删除</button>
		      			</td>
		      		</tr>
		      	</table>
		    </div>
		    
		  </div>
		  
		 <div class="form-group row">
		    <label for="imageFile" class="col-sm-2 col-form-label">图片</label>
		    <div class="col-sm-10">
		      <input type="file" class="form-control" id="imageFile" name="imageFile" >
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="cartThumbnailFile" class="col-sm-2 col-form-label">图片</label>
		    <div class="col-sm-10">
		      <input type="file" class="form-control" id="cartThumbnailFile" name="cartThumbnailFile" >
		    </div>
		  </div>
		  
		  <button type="button" onclick="commitData()">确认</button>
		   <button type="submit" >确认11</button>
		   <button type="submit" onclick="test()" >test</button>
	</form>
</div>
<script>
	function specChange(obj){
		//
		var tdObj=obj.parent();//找到所在的td
		var nextTd=tdObj.next();//找到下一个td
		var optionSel = nextTd.children().first();
		
		var specId=obj.val();
		$.post('sku/getOptions',{specId:specId},function(data){
			optionSel.empty();
			for(var i=0;i<data.length;i++){
				optionSel.append('<option value="'+data[i].optionId+'">'+data[i].optionName+'</option>')
			}
		})
		
		
	}
	
	function delLine(obj){
		
	}
	
	//计数器 
	var specIndx=1;

	
	
	
	function addLine(){
		
		var optionsStr='<option value="0">请选择</option>   \
				<c:forEach items="${specs}" var="spec" >   \
			<option value="${spec.id}">${spec.specName}</option> \
		</c:forEach>';
			
		var lineStr=
		'<tr>                                                                        ' + 
		'	<td><select name="optionList['+specIndx+'].specId" onchange="specChange($(this))" > ' +  
		optionsStr + 	  
		'		</select>                                                            ' + 
		'	</td>                                                                    ' + 
		'	<td> 																     ' + 
		'		<select name="optionList['+specIndx+'].optionId">								 ' +
		'		</select>                                                            ' + 
		'	</td>                                                                    ' + 
		'	<td>                                                                     ' + 
		'		<button type="button" onclick="delLine($(this))">删除</button>        ' + 
		'	</td>                                                                    ' + 
		'</tr>' ;
		
		$("#table").append(lineStr);
		specIndx++;
		
	}
	
	$("#addSkuForm").validate({
		submitHandler:function(){
			
			$("#addSkuForm").ajaxSubmit({
				success:function(data){
					alert(data)
					if(data=='成功'){
						var url="sku/list";
						$("#workContent").load(url)
					}
				}		 
			});
	        return false;   //防止表单自动提交
			
		}
		
	})
	
	
	
	
		
</script>

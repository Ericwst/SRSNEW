<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
	<style type="text/css">
		form div{
			margin:10px
		}
	</style>
	<script type="text/javascript">
		$(function(){
			var rows=parent.$("#dg").datagrid("getSelections");
			$('#ff').form('load',{
				id:rows[0].id,
				number:rows[0].number,
				text:rows[0].text,
				unsafe_count:rows[0].unsafe_count,
				time:rows[0].time
			});

			
			$("input[name=number]").validatebox({
					required:true,
					missingMessage:'请输入管理对象编号'
				});
			$("input[name=text]").validatebox({
				required:true,
				missingMessage:'请输入管理对象名称'
			});
			$("input[name=unsafe_count]").validatebox({
				required:true,
				missingMessage:'请输入危险源个数'
			});
			//弹出窗口时禁用验证
			$("#ff").form("disableValidation");
			//注册botton的事件
			$("#ok_btn").click(function(){
					//开启验证
					$("#ff").form("enableValidation");
					//如果验证成功，则提交数据
					if($('#ff').form("validate")){
						$('#ff').form('submit', {
							success: function(){
							parent.$('#win').window("close");
							//刷新dg
							parent.$("#dg").datagrid("reload");
							}
						});						
					}
				});
			$("#cancel_btn").click(function(){
				//关闭窗口
				parent.$('#win').window("close")
			});
		});
	</script>
</head>
<body>
	<form id="ff" method="post">   
	    <div>   
	        <label for="number">管理对象编号：</label>   
	        <input type="text" name="number"  />   
	    </div>   
	    <div>   
	        <label for="text">管理对象名称：</label>   
	        <input type="text" name="text" />   
	    </div>
	    <div>   
	        <label for="unsafe_count">危险源个数：&emsp; </label>   
	        <input type="text" name="unsafe_count" />   
	    </div>
	    <div>   
	        <label for="time">更新时间：&emsp;&emsp;</label>   
	        <input  id="time"  type= "text" class= "easyui-datebox" required ="required"> </input>     
	    </div>
	    <div>
	    	<a id="ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	    	<a id="cancel_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
	    	<input type="hidden" name="id" />
	    </div>
	</form>
</body>
</html>
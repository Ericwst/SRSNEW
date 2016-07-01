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
			$("input[name=text]").validatebox({
					required:true,
					missingMessage:'请输入状态类危险源编号'
				});
			$("input[name=value]").validatebox({
				required:true,
				missingMessage:'请输入状态类危险源名称'
			});
			$("input[name=unsafe_des]").validatebox({
				required:true,
				missingMessage:'请输入危险源描述'
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
			$("#reset_btn").click(function(){
				//重置窗口
				$("#ff").form("clear");
				//禁用验证
				$("#ff").form("disableValidation");
			});
		});
	</script>
</head>
<body>
	<form id="ff" method="post">   
	    <div>   
	        <label for="text">状态类危险源编号：</label>   
	        <input type="text" name="text"  />   
	    </div>   
	    <div>   
	        <label for="value">状态类危险源名称：</label>   
	        <input type="text" name="value" />   
	    </div>
	    <div>   
	        <label for="type">文化类型：&emsp;&emsp;&emsp;&emsp; </label>   
	        <input type="text" name="type" />   
	    </div>
	    <div>   
	        <label for="post">定性定量：&emsp;&emsp;&emsp;&emsp; </label>   
	        <input type="text" name="post" />   
	    </div>
	    <div>   
	        <label for="unsafe_des">危险源描述：&emsp;&emsp;&emsp; </label>   
	        <input type="text" name="unsafe_des" />   
	    </div>
	    <div>   
	        <label for="result_des">风险类型描述：&emsp;&emsp; </label>   
	        <input type="text" name="result_des" />   
	    </div>
	    <div>   
	        <label for="time">更新时间：&emsp;&emsp;&emsp;&emsp;</label>   
	        <input  id="time"  type= "text" class= "easyui-datebox" required ="required"> </input>     
	    </div>
	    <div>
	    	<a id="ok_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认</a>
	    	<a id="reset_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>
	    	<a id="cancel_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
	    </div>
	</form>
</body>
</html>
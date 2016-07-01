<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		// 通过远程加载指标编号
		$('#com1').combobox({    
		  	url:'${pageContext.request.contextPath}/json/muban_standard_add.json',    
		    valueField:'id',    
		    textField:'name',
		    editable:false,
		    panelHeight:'auto',
		    required:true
		});
		// 通过远程加载指标名称
		$('#com2').combobox({    
		  	url:'${pageContext.request.contextPath}/json/muban_standard_add.json',    
		    valueField:'id',   
		    textField:'name',
		    editable:false,
		    panelHeight:'auto',
		    required:true
		});   

		//页面加载时禁止使用验证对照
		$("#muban_standard_add").form("disableValidation");
		//触发重置事件
		$("#reset").click(function(){
			$("#muban_standard_add").form("reset");
		});
		//触发提交事件
		$("#submit").click(function(){
			//表单数据验证
			$("#muban_standard_add").form("enableValidation");
			//验证通过返回true
			if($("#muban_standard_add").form("validate")){
				//ajax
				$('#muban_standard_add').form("submit",{
					url:'',
					success:function(){
						$("#muban_standard_add").form("reset");
						//关闭窗体
						parent.$("#child-win").window("close");
						//刷新dg
						parent.$("#dg").datagrid("reload");
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<form id="muban_standard_add" method="post">   
	    <div>   
	        <label for="id">模板编号:</label>
	        <input id="com1" name="id">  
	    </div>
	    <div>   
	        <label for="name">模板名称:</label>
	        <input id="com2" name="name">   
	    </div>
	    <div>
	    	<a id="submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
	    	<a id="reset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>  
	    </div>
	</form>  
</body>
</html>
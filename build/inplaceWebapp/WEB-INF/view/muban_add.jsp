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
		//定义验证规则，通过属性选择器吧com转化为jquery对象
		$("[name=id]").validatebox({
  			required:true,
  			missingMessage:'模板编号必填!'
  		});
		//页面加载时禁止使用验证对照
		$("#ff").form("disableValidation");
		//触发重置事件
		$("#reset").click(function(){
			$("#ff").form("reset");
		});
		//触发提交事件
		$("#submit").click(function(){
			//表单数据验证
			$("#ff").form("enableValidation");
			//验证通过返回true
			if($("#ff").form("validate")){
				//ajax
				$('#ff').form("submit",{
					url:'',
					success:function(){
						$("#ff").form("reset");
						//关闭窗体
						parent.$("#win").window("close");
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
	<form id="ff" method="post">   
	    <div>   
	        <label for="id">模板编号:</label>
	        <input type="text" name="id" />   
	    </div>
	    <div>   
	        <label for="name">模板名称:</label>
	        <input type="text" name="name" />   
	    </div>   
	    <div>   
	        <label for="attachment">模板附件:</label>
	        <input type="text" name="attachment" />   
	    </div>
	    <div>
	    	<a id="submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
	    	<a id="reset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>  
	    </div>
	</form>  
</body>
</html>
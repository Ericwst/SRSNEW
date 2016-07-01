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
<style type="text/css">
.input{
	margin-top:10px
}
#button{
	text-align:center
}
</style>
<script type="text/javascript">
	$(function(){
		//远程加载专业信息
		$("#cc").combobox({
			url:'${pageContext.request.contextPath}/json/standard_add.json',
			valueField:'id',
			textField:'name',//专业名称
			editable:false,
			panelHeight:'auto',
			required:true,
			missingMessage:'请选择专业类别'
		});
		//数字框
		$('#nn1').numberbox({    
		    min:0,
		    precision:2
		}); 
		$('#nn2').numberbox({    
		    min:0,
		    precision:2		    
		}); 
		$('#nn3').numberbox({    
		    min:0,
		    precision:0
		}); 
		//提交
		$("#reset").click(function(){
	  		$("#standard-add").form("reset");
	  			});
		//开始禁止验证
		$("#standard-add").form("disableValidation");
		$("#submit").click(function(){
			//开启验证
			$("#standard-add").form("enableValidation");
			if($("#standard-add").form("validate")){
				//ajax提交
				$("#standard-add").form("submit",{
					url:'',
					success:function(){
						$("#standard-add").form("reset");
						parent.$("#standard-win").window("close");
						parent.$("#standard").treegrid("reload");
					}
				});
			}
		});
		
	})
</script>
</head>
<body>
	<form id="standard-add" method="post">
		<div class="input">
			<lable for="name">指标名称：</lable>
			<input type="text" name="name"/>
		</div>
		<div class="input">
			<lable for="point">设计分值：</lable>
			<input type="text" id="nn1" name="point"/>
		</div>
		<div class="input">
			<lable for="zhuanye">专&nbsp;&nbsp;业：</lable>
			<input id="cc" name="zhuanye"/>
		</div>
		<div class="input">
			<lable for="way">评分方法：</lable>
			<input type="text" name="way"/>
		</div>
		<div class="input">
			<lable for="once">单次扣分：</lable>
			<input type="text" id="nn2" name="once"/>
		</div>
		<div class="input">
			<lable for="time">几次扣完：</lable>
			<input type="text" id="nn3" name="time"/>
		</div>
		<div class="input" id="button">
		<a id="submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添 加</a> 
		<a id="reset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重 置</a>			
		</div>
	</form>
</body>
</html>
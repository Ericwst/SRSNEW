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
	#fb{
	float:left
	}
	#submit{
		height:22px
	}
	

</style>
<script type="text/javascript">
	function deleteit(index){
		//alert(index);
		$('#muban-attachment-dg').datagrid('selectRow',index);//选中当前行
		var row = $('#muban-attachment-dg').datagrid('getSelected');
		$.messager.confirm('删除确认','您确定要删除选中的数据吗？',function(r){
			if(r){
				//发送请求提交删除信息
                $.post("",{name:row.name},function(result){
					if(result=="fail"){
						parents.$.messager.confirm('权限不足提示','权限不足，是否注销重新登录？',function(r){
							if(r){
								//window.open("denglu","_top")
							}
						});
						
					}else{
						//删除页面，刷新
						$("#muban-attachment-dg").datagrid("clearChecked");
						$("#muban-attachment-dg").datagrid("reload");
					}
				},"text");
			}
		});
	};
	$(function(){
		
		$("#muban-attachment-dg").datagrid({
		    url:'${pageContext.request.contextPath}/json/muban_attachment.json',
			idField:"id",// id字段为标识字段,那么此字段状态将会被dg记录下来
			queryParams:{type:""},//请求远程数据发送额外的参数
			
			striped:true,/*斑马线效果  */
			nowrap:true,/*数据同一行*/
			loadmsg:'请等待',
			rownumbers:true,/* 行号*/
			remoteSort:false,/*禁止使用远程排序*/
			singleSelect:true,
			checkOnSelect:false,
			toolbar:[{
				text:"<form id='upload' method='post'><input id='fb' type='text' name='input' style='width:270px'><a id='submit' href='#'>提交</a></form>"
				 
			}],
		    columns:[[    
		        {field:'name',title:'模板附件',formatter:function(value,row,index){
					return "<a href='#'>" + value + "</a>";} 
		        },    
		        {field:'op',title:'操作',formatter:function(value,row,index){
					return "<a href='#' id='btn' onclick='deleteit(" + index + ")'>" +"删除" + "</a>";} 
		        }
		    ]]    
		});
  		$('#fb').filebox({    
		    buttonText: '选择文件', 
		    buttonAlign: 'right' 
		});
		$('#submit').linkbutton({
		    iconCls:'icon-add'   
		});
		//表单提交
		//自定义验证函数
		$.extend($.fn.validatebox.defaults.rules,{
			type:{
				validator:function(value,param){
					//获取文件扩展名
					//alert("value:" + value + ",param:" + param.length);
					var ext=value.substring(value.lastIndexOf(".")+1);
					var params=param[0].split(",");
					for(var i=0;i<params.length;i++){
						if(ext==params[i])
							return true;
					}
					return false;

				},
				//{0}代表传入的第一个参数
				message: '文件类型必须为:{0}'
			}
		});
		$("[name='input']").validatebox({
			required:true,//file文本域 validate不能实现及时验证
			missingMessage:'请上传正确的文件',
			validType:"type['xls,xlsx']"		
		});
		//自定义change事件实现文本框及时验证
		$("[name='input']").change(function(){
			$(this).validatebox("validate");
		});
		//开始禁止验证
 		$("#upload").form("disableValidation");
		$("#submit").click(function(){
			//开启验证
			$("#upload").form("enableValidation");
			if($("#upload").form("validate")){
				//ajax提交
				$('#upload').form('submit',{
					url:'',
					success:function(){
						$("#upload").form("disableValidation");
						$("#upload").form("reset");
						$("#muban-attachment-dg").datagrid("reload");
						parent.$("#dg").datagrid("reload");
					}
				});
			}
		});
	})
</script>
</head>
<body>
	<table id="muban-attachment-dg"></table>  
</body>
</html>
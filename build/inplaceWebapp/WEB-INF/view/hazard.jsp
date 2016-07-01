<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>状态类危险源</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript">
			$(function(){
					$('#dg').datagrid({
						title:'危险源',
						url: '${pageContext.request.contextPath}/json/main_unsafe.json',
						//width:1200px,
						pagination:true,
						rownumbers: true,
						idField: 'id',
						toolbar:toolbar,
						pagination:true,
			            pageSize:10,
			            pageList:[10,15,20,25,30],
						columns:[[    
						          {field:'id',title:'序号',width:50},    
						          {field:'text',title:'状态类危险源编号',width:120},    
						          {field:'value',title:'状态类危险源名称',width:120,align:'center'},    
						          {field:'type',title:'文化类型',width:100},    
						          {field:'post',title:'定性定量',width:150},    
						          {field:'unsafe_des',title:'危险源描述',width:150},    
						          {field:'result_des',title:'风险类型描述',width:150},    
						          {field:'time',title:'更新时间',width:150}
						     ]]
						});
				});
				 var toolbar = [{
		            text:'添加',
		            iconCls:'icon-add',
		            handler:function(){
						$('#win').window({
							title:"添加信息",
							width:500,
							height:450,
							content:'<iframe src="${pageContext.request.contextPath}/hazard_add" frameborder="0" width="100%" height="100%" />'
						});
		            }
		        },{
		            text:'修改',
		            iconCls:'icon-edit',
		            handler:function(){
		            	var rows=$('#dg').datagrid("getSelections")
			 			if(rows.length!=1){
							$.messager.show({
								title:'提示信息',
								msg:'请选择一条记录',
								timeout:2000,
								showType:'slide'
							});														
							}else{
								$('#win').window({
									title:"修改信息",
									width:450,
									height:450,
									content:'<iframe src="${pageContext.request.contextPath}/hazard_update" frameborder="0" width="100%" height="100%" />'
									});
								}
		            }
		        },{
		            text:'删除',
		            iconCls:'icon-remove',
		            handler:function(){
			            //判断是否有选中行记录
						var rows=$('#dg').datagrid("getSelections")
						if(rows.length==0){
							$.messager.show({
								title:'提示信息',
								msg:'请至少选中一行记录',
								timeout:2000,
								showType:'slide'
							});														
							}else{
								$.messager.confirm('删除确认对话框', '是否要删除选中的记录', function(r){
									if (r){
									    var ids="";
									    for(var i=0;i<rows.length;i++){
												ids+=rows[i].id+",";
										    }
										ids=ids.substring(0,ids.lastIndexOf(","));
										//$('#dg').datagrid("uncheckAll");
										//parent.$("#dg").datagrid("reload");
									}
								});
							}
		            }
		        }];
	    </script>
</head>
<body>
			<lable for="checked_department">单位类型：</lable>
			<input id="checked_unit" class="easyui-combotree" 
					data-options="url:'${pageContext.request.contextPath}/json/unit_tree.json',method:'get',required:true,panelWidth: 200" style="width:200px;">
			<lable for="standard">根源类危险源：</lable>
			<select id="checked_mansger" class="easyui-combotree" 
					data-options="url:'${pageContext.request.contextPath}/json/main_unsafe.json',method:'get',panelWidth: 200" style="width:200px;"></select>
			<a id="import" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-import'" onclick="javascript:alert('导入Excel')">导入根类危险源</a>
			<a id="export" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-export'" onclick="javascript:alert('导出Excel')">导出根类危险源</a>
			<a id="import" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-import'" onclick="javascript:alert('导入Excel')">导入管理标准</a>
			<a id="export" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-export'" onclick="javascript:alert('导出Excel')">导出管理标准</a>
			<a id="import" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-import'" onclick="javascript:alert('导入Excel')">导入管理措施</a>
			<a id="export" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-export'" onclick="javascript:alert('导出Excel')">导出管理措施</a>
		<table id="dg"></table>
		<div id="win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div>
</table>
</body>
</html>
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

	function standard(index){
		$('#dg').datagrid('clearSelections');//清处多选的行
		$('#dg').datagrid('selectRow',index);//选中当前行
		var row = $('#dg').datagrid('getSelected')
		//alert(index);
	    //alert(row.id);//ok!
	    if (row){  
 			    $('#win').window({
 				width:400,
 				height:300,
 				title:'相关指标',
 				cache:false,
 				content:'<iframe src="${pageContext.request.contextPath}/muban_standard"+ frameborder="0" width="100%" height="100%"/>'
 			});}
	};
	function details(index){
		$('#dg').datagrid('clearSelections');//清处多选的行
		$('#dg').datagrid('selectRow',index);//选中当前行
		//alert(index);
	    var row = $('#dg').datagrid('getSelected');
	    //alert(row.id);//ok!
	    if (row){  
 			    $('#win').window({
 				width:400,
 				height:300,
 				title:'模板附件',
 				cache:false,
 				content:'<iframe src="${pageContext.request.contextPath}/muban_attachment" frameborder="0" width="100%" height="100%"/>'
 			});}
	};
	$(function(){
		$('#dg').datagrid({
			url:'${pageContext.request.contextPath}/json/muban.json',//要改为一个action
			idField:"id",// id字段为标识字段,那么此字段状态将会被dg记录下来
			title:"文件记录模板",
			queryParams:{type:""},//请求远程数据发送额外的参数
			fitColumns:true,/*列宽自动*/
			striped:true,/*斑马线效果  */
			nowrap:true,/*数据同一行*/
			loadmsg:'请等待',
			rownumbers:true,/* 行号*/
			remoteSort:false,/*禁止使用远程排序*/
			singleSelect:false,
			checkOnSelect:false,
			/*分页相关参数配置*/
			pagination:true,
			pageNumber:1,
			pageSize:5,
			pageList:[5,10,15,20],
			/*按钮*/
			toolbar:[{
				text:'单位类型：<input id="cc" value="01">'
				 
			},
			   {
				iconCls:'icon-add',
				text:'添加',
				handler:function(){
					//发送ajax请求判断是否有权限
				 $.post("",null,function(result){
				 		if(result=="fail"){
				 			parent.$.messager.confirm('权限不足提示','权限不足，是否注销重新登录？',function(r){
				 				if(r){
				 					//window.open("这里是重新登录的页面","_top");
				 				}
				 			});
				 		}else{
				 			    $('#win').window({
				 				width:400,
				 				height:250,
				 				title:'添加',
				 				cache:false,
				 				content:'<iframe src="${pageContext.request.contextPath}/muban_add" frameborder="0" width="100%" height="100%"/>'
				 			});
				 		}
				 	},"text");
				}
			},{
				iconCls:'icon-remove',
				text:'删除',
				handler:function(){
					//1、获取选中行
					var rows=$("#dg").datagrid("getSelections");
					//2、对事件进行判断，和删除确认
					if(rows.length==0){
						$.messager.show({
							title:'提示',
							msg:'至少选择为一条记录！',
							timeout:2000,
							showType:'slide'
						});
					}else{
						$.messager.confirm('删除确认','您确定要删除选中的数据吗？',function(r){
							if(r){
								//3、获取要删除的id值 1,2,3===> String ids  delete from category where id in (1,2,3)
								var ids="";
								for(var i=0;i<rows.length;i++){
									ids += rows[i].id+",";
								}
								ids=ids.substring(0,ids.length-1);//截取字符串，除去最后一个逗号
								//alert(ids.substring(0,ids.length-1));//只是试验一下
								//4、发送请求提交删除信息
		                        $.post("",{ids:ids},function(result){
									if(result=="fail"){
										parents.$.messager.confirm('权限不足提示','权限不足，是否注销重新登录？',function(r){
											if(r){
												//window.open("denglu","_top")
											}
										});
										
									}else{
										//删除页面，刷新
										$("#dg").datagrid("clearChecked");
										$("#dg").datagrid("reload");
									}
								},"text");
							}
						});
					}
				}
				
			},{
				iconCls:'icon-edit',
				text:'修改',
				handler:function(){
					var rows=$("#dg").datagrid("getSelections");
					if(rows.length==1){
						//发送ajax请求判断是否有权限
						$.post("",null,function(result){
							if(result=="fail"){
								parent.$.messager.confirm('权限不足提示','权限不足，是否注销重新登录？',function(r){
									if(r){
										//window.open("","_top");
									}
								});
							}else{
									$('#win').window({
									width:300,
									height:210,
									title:"修改记录",
									cache:false,
									content:'<iframe src="${pageContext.request.contextPath}/muban_update" frameborder="0" width="100%" height="100%"/>'
								
								});
							}
						},"text");
					}else{
						$.messager.show({
							title:'错误提示',
							msg:'一次只能更新一条记录！',
							timeout:2000,
							showType:'slide'
						});
					}
				}
			}
			],
			/*列*/
			columns:[[
				{field:'id',title:'模板编号',width:100},
				{field:'name',title:'模板名称',width:200,formatter:function(value,row,index){
					return "<span title=" + value + ">" + value + "</span>";
				}},
				{field:'attachment',title:'模板附件',formatter:function(value,row,index){
					return "<a href='#' onclick='details("+index+")'>" + "详情"+"["+value+"]" + "</a>";
				}},
				{field:'standard',title:'相关指标',formatter:function(value,row,index){
					return "<a href='#' onclick='standard("+index+")'>" + "相关指标"+"["+value+"]" + "</a>";
				}}
				]]
			
			
		});
		$('#cc').combotree({    
		    url: '${pageContext.request.contextPath}/json/dept_tree.json',    
		    required: true   
			});

		
	})
</script>
</head>
<body>
	<!--头 -->
	<table id="dg"></table>
	<div id="win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div>
    <div id="child-win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div>
</body>
</html>
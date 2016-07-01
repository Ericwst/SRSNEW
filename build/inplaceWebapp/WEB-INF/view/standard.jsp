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
		function muban(id){
			$('#standard').treegrid('selectRow',id);//选中当前行
			var row = $('#standard').treegrid('getSelected');
			//alert(row);ok!
			    if (row!=null){  
					    $('#standard-win').window({
						width:400,
						height:300,
						title:'相关模板',
						cache:false,
						content:'<iframe src="${pageContext.request.contextPath}/standard_muban"+ frameborder="0" width="100%" height="100%"/>'
					});}
		};
	$(function(){
		$('#standard').treegrid({    
		    url:'${pageContext.request.contextPath}/json/standard.json',    
			idField:"id",// id字段为标识字段,那么此字段状态将会被dg记录下来    
		    treeField:'name',//定义树节点字段
		    fitColumns:true,/*列宽自动*/
			striped:true,/*斑马线效果  */
			nowrap:true,/*数据同一行*/
			loadmsg:'请等待',
			rownumbers:true,/* 行号*/
			remoteSort:false,/*禁止使用远程排序*/
			toolbar:[{
				text:'单位类型：<input id="cc1">'
			},{
				text:'评分标准：<input id="cc2">'
			},{
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
					 			    $('#standard-win').window({
					 				width:400,
					 				height:300,
					 				title:'添加',
					 				cache:false,
					 				content:'<iframe src="${pageContext.request.contextPath}/standard_add" frameborder="0" width="100%" height="100%"/>'
					 			});
					 		}
					 	},"text");
					
				}
			},{
				iconCls:'icon-remove',
				text:'删除',
				handler:function(){
					var row=$("#standard").treegrid("getSelected");
					//2、对事件进行判断，和删除确认
					if(row==null){
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
								var id=row.id;
		                        $.post("",{id:id},function(result){
									if(result=="fail"){
										parents.$.messager.confirm('权限不足提示','权限不足，是否注销重新登录？',function(r){
											if(r){
												//window.open("denglu","_top")
											}
										});
										
									}else{
										//删除页面，刷新
										$("#standard").treegrid("clearChecked");
										$("#standard").treegrid("reload");
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
					var row=$("#standard").treegrid("getSelected");
					if(row!=null){
						//发送ajax请求判断是否有权限
						$.post("",null,function(result){
							if(result=="fail"){
								parent.$.messager.confirm('权限不足提示','权限不足，是否注销重新登录？',function(r){
									if(r){
										//window.open("","_top");
									}
								});
							}else{
									$('#standard-win').window({
									width:400,
									height:300,
									title:"修改记录",
									cache:false,
									content:'<iframe src="${pageContext.request.contextPath}/standard_update" frameborder="0" width="100%" height="100%"/>'
								
								});
							}
						},"text");
					}else{
						$.messager.show({
							title:'错误提示',
							msg:'请选择一条记录！',
							timeout:2000,
							showType:'slide'
						});
					}
					
				}
			},{
				iconCls:'icon-excel',
				text:'导入',
				handler:function(){
				    window.open('data:application/vnd.ms-excel,' + $('#standard').html());
				    e.preventDefault();
				}
			},{
				iconCls:'icon-excel',
				text:'导出',
				handler:function(){
				}
			}],
		    columns:[[
		        {field:'id',name:'指标编号'},
		        {title:'指标名称',field:'name'},    
		        {field:'point',title:'设计分值'},    
		        {field:'zhuanye',title:'专业'},    
		        {field:'way',title:'评分方法'},
		        {field:'once',title:'单次扣分'},
		        {field:'time',title:'几次扣完'},
		        {field:'muban',title:'模板详情',formatter:function(value,row){
		        	return "<a href='#' onclick='muban("+row.id+")'>" + "模板详情"+"["+value+"]" + "</a>";
		        }}
		    ]]    
		}); 
  		//下拉列表框
		$('#cc1').combotree({    
		    url: '${pageContext.request.contextPath}/json/dept_tree.json',
			panelHeight:'auto',
			editable:false
		});
		$('#cc2').combobox({    
		    url:'${pageContext.request.contextPath}/json/standard_ref.json',
			panelHeight:'auto',
		    valueField:'id',    
		    textField:'name',
		    editable:false
		});

		
	})
</script>
</head>
<body>
	<table id="standard" ></table>
	<div id="standard-win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div>
    <div id="child-win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div>
</body>
</html>
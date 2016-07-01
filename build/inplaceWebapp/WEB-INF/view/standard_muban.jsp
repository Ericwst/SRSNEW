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
  //var row=parent.$("#standard").treegrid("getSelected");//ok
  //alert(row.id);
	$(function(){
		var row=parent.$("#standard").treegrid("getSelected");
		$("#s-m").datagrid({
			rowStyler: function(index,row){
				return 'width:100%';
			},
		url:'${pageContext.request.contextPath}/json/standard_muban.json?row.id',//要改为一个action
		idField:"id",// id字段为标识字段,那么此字段状态将会被dg记录下来
		queryParams:{type:""},//请求远程数据发送额外的参数
		fitColumns:true,/*列宽自动*/
		striped:true,/*斑马线效果  */
		nowrap:true,/*数据同一行*/
		loadmsg:'请等待',
		rownumbers:true,/* 行号*/
		remoteSort:false,/*禁止使用远程排序*/
		singleSelect:false,
		checkOnSelect:false,
		/*按钮*/
		toolbar:[
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
			 			parent.$('#child-win').window({
			 				width:400,
			 				height:250,
			 				title:'添加',
			 				cache:false,
			 				content:'<iframe src="${pageContext.request.contextPath}/standard_muban_add" frameborder="0" width="100%" height="100%"/>'
			 			});
			 		}
			 	},"text");
			}
		},{
			iconCls:'icon-remove',
			text:'删除',
			handler:function(){
				//1、获取选中行
				var rows=$("#s-m").datagrid("getSelections");
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
									$("#s-m").datagrid("clearChecked");
									$("#s-m").datagrid("reload");
								}
							},"text");
						}
					});
				}
			}
			
		}
		],
		/*列*/
		columns:[[
			{field:'id',title:'逻辑主键',width:100,hidden:true},
			{field:'number',title:'模板编号',width:100},
			{field:'name',title:'模板名称',width:200,formatter:function(value,row,index){
				return "<span title=" + value + ">" + value + "</span>";
			}}
			]]
		
		
		});
	})

</script>
</head>
<body>
	<!--头 -->
	<table id="s-m"></table>
</body>
</html>
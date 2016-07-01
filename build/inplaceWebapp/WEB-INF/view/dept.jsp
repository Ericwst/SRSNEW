<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>神华宁煤安全风险预控管理信息系统</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<script>
<!--添加部门-->
function save(){
	$('#addForm').form('submit',{
		url: "addAction",
		success: function(){
				alert("恭喜您，保存部门数据成功！");
				$('#win').dialog('close');
				$('#dg').datagrid('reload');
		}
	});
}
<!--删除部门-->
function destroy(){
	var row = $('#dg').datagrid('getSelected');
	if (row){
		$.messager.confirm('Confirm','Are you sure you want to destroy this user?',function(){
				$.post('deleteAction',{id:row.id},function(result){
					alert("恭喜您，删除部门成功！");
					$('#dg').datagrid('reload');
				},'json');
		});
	}
	else{
		alert("请先选择您要删除的行！");
	}
}
<!--编辑部门-->
function update(){
	$('#addForm').form('submit',{
		url: "updateAction",
		success: function(){
				alert("恭喜您，修改部门数据成功！");
				$('#win').dialog('close');
				$('#dg').datagrid('reload');
		}
	});
}

<!--实现分页--> 
<!--后台返回data，包含总记录条数，所有的数据记录；前台用户选择当前页数和每页显示的记录数-->
function pagerFilter(data){
	if (typeof data.length == 'number' && typeof data.splice == 'function'){
		data = {
			total: data.length,<!--得到返回的数据的总记录数-->
			rows: data<!--得到返回的所有的数据记录-->
		}
	}
	var dg = $(this);
	var opts = dg.datagrid('options');
	var pager = dg.datagrid('getPager');
	pager.pagination({
		onSelectPage:function(pageNum, pageSize){
			opts.pageNumber = pageNum;<!--当前页数-->
			opts.pageSize = pageSize;<!--每页显示的记录数-->
			<!--改变选项并刷新分页栏信息-->
			pager.pagination('refresh',{
				pageNumber:pageNum,
				pageSize:pageSize
			});
			<!--loadData加载本地数据，旧的行将被移除-->
			dg.datagrid('loadData',data);
		}
	});
	if (!data.originalRows){
		data.originalRows = (data.rows);
	}
	<!--计算出每页开始的记录号和结尾的记录号-->
	var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
	var end = start + parseInt(opts.pageSize);
	<!--slice从已有的数组中选取指定的元素，返回每页显示的记录数-->
	data.rows = (data.originalRows.slice(start, end));
	return data;
}

$(function(){
	$('#dg').datagrid({loadFilter:pagerFilter});
});
</script>
</head>
<body>
	<table>
		<tr>
			<td>
				<span>上级部门：</span><select id="select-tree" class="easyui-combotree" url="json/dept_tree.json" name="city" style="width:156px;"></select>			
				<a href="exportAction" class="easyui-linkbutton">导出到EXCEL</a>
			</td>
		</tr>
		<tr>
			<td>
				<table id="dg" title="" class="easyui-datagrid" style="width:1000px;height:250px"
					url="showAction.action"
					toolbar="#toolbar"
					rownumbers="true" fitColumns="true" pageSize="10" singleSelect="true" pagination="true">
					<thead>
						<tr>
							<th field="id" width="50" editor="text">部门id</th>
							<th field="parentDepartment" width="50" editor="text">上级部门</th>
							<th field="departmentSn" width="50">部门编号</th>
							<th field="departmentName" width="50">部门名称</th>
							<th field="departmentType" formatter="formatDepartmentTypeName" width="50">部门类别</th>
							<th field="showSequence" width="50">显示顺序</th>						
							<th field="dutyman" width="50">安全责任人</th>
						</tr>
					</thead>
				</table>
			</td>
		</tr>
	</table>
	
	<div id="toolbar">
		<a href="#" id="edit" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()">编辑部门</a>	
		<a href="#" id="add" plain="true" class="easyui-linkbutton" iconCls="icon-add">增加部门</a>
		<a href="#" id="delete" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroy()">删除部门</a>
	</div>
	
	<div id="win" class="easyui-window" title="增加新部门" closed="true" style="width:400px;height:300px;padding:5px;">
		<div class="ftitle">部门信息：</div><hr/>
		<form id="addForm" method="post" novalidate>
			<div class="fitem">
				<label>上级部门：</label>
				<select id="select-tree" class="easyui-combotree" url="json/dept_tree.json" name="parentDepartmentSn" style="width:156px;"></select>
			</div>
			<div class="fitem">
				<label>部门id：</label>
				<input name="id" class="easyui-validatebox" required="true"/>
			</div>
			<div class="fitem">
				<label>部门编号：</label>
				<input name="departmentSn" class="easyui-validatebox" required="true"/>
			</div>
			<div class="fitem">
				<label>部门类别：</label>
				<input name="departmentTypeSn" class="easyui-validatebox" required="true"/>
			</div>
			<div class="fitem">
				<label>部门名称：</label>
				<input name="departmentName"/>
			</div>
			<div class="fitem">
				<label>安全责任人：</label>
				<input name="dutyman"/>
			</div>
			<div class="fitem">
				<label>显示顺序：</label>
				<input name="showSequence"/>
			</div>
			<br/><br/><br/>
			<div id="dlg-buttons" style="float:right">
				<a href="#" id="save1" class="easyui-linkbutton" iconCls="icon-ok" onclick="update()">确认修改</a>
				<a href="#" id="save" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">确认添加</a>
				<a href="#" id="close" class="easyui-linkbutton" iconCls="icon-cancel" onclick="close()">取消</a>
			</div>
			<span id="saveSuccess">保存成功！</span>
		</form>
	</div>
	<script>
		$('#add').click(function(){
			$('#win').window('open');
			$('#saveSuccess').hide();
		});
		
		$('#edit').click(function(){
			$('#win').window('open');
			$('#saveSuccess').hide();
		});
		
		$('#close').click(function(){
			$('#saveSuccess').hide();
			$('#win').window('close');
		});
		
		function formatDepartmentTypeName(value){
			return value.departmentTypeName;
		};
		

	</script>	
</body>
</html>
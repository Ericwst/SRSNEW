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

</head>
<body>
<form>
	<table>
		<tr>
			<td>
				<table>
				<tr>
				<td>
				<select id="select-tree" class="easyui-combotree" url="json/dept_tree.json" name="city" style="width:156px;"/></td>
				<td><span style="font-size:10px">岗位：</span><select id="duty" class="easyui-combotree" url="json/dept_tree.json" name="city" style="width:156px;"/></td>
				<td>
				<div>
					<div id="tb" style="padding:3px">
						<span style="font-size:10px">编号姓名:</span>
						<input id="itemid" style="line-height:16px;border:1px solid #ccc">
						<a href="#" class="easyui-linkbutton" onclick="doSearch()">导入员工</a>
						
						<a href="#" class="easyui-linkbutton" onclick="doSearch()">导入角色设置</a>
						
						<a href="#" class="easyui-linkbutton" onclick="doSearch()">全部删除</a>
						
						<a href="#" class="easyui-linkbutton" onclick="doSearch()">导出到EXCEL</a>
					</div>
				</div>
				</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table id="dg" title="" class="easyui-datagrid" style="width:1150px;height:500px"
					url="json/person.json"
					toolbar="#toolbar"
					rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
					<thead>
						<tr>
							<th field="id" width="50">员工表编号</th>
							<th field="person_id" width="50">员工编号</th>
							<th field="person_name" width="50">员工姓名</th>
							<th field="password" width="50">密码</th>
							<th field="id_number" width="50">身份证号码</th>
							<th field="cellphone_number" width="50">电话号码</th>
							<th field="edit" width="50">编辑</th>
							<th field="delete" width="50">删除</th>
							<th field="add" width="50"><a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#dg').edatagrid('addRow')"></a></th>
							<!--<th field="dept" width="70">所属部门</th>
							<th field="personid" width="50">员工编号</th>
							<th field="name" width="50">姓名</th>
							<th field="password" width="50">密码</th>
							<th field="cartid" width="120">身份证号</th>
							<th field="birthday" width="80">出生日期</th>
							<th field="qualif " width="50">学历</th>
							<th field="sex" width="50">性别</th>
							<th field="phone" width="80">手机号码</th>
							<th field="unit" width="50">所属单位</th>
							<th field="role" width="50">所属角色</th>
							<th field="deptdetails" width="50">部门详情</th>
							<th field="edit" width="50"></th>
							<th field="delete" width="50"></th>
							<th id="add" field="add" width="50"><a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#dg').edatagrid('addRow')"></a></th>
							  -->
						</tr>
					</thead>
				</table>
			</td>
		</tr>
	</table>
	<!-- 创建对话框 -->
		<div id="dialog" class="easyui-dialog" style="padding:5px;width:400px;height:200px;"
				title="My Dialog" iconCls="icon-ok"
				toolbar="#dlg-toolbar" buttons="#dlg-buttons">
			Dialog Content.
		</div>
		<div id="dlg-toolbar">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:alert('Add')">Add</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:alert('Save')">Save</a>
		</div>
		<div id="dlg-buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="javascript:alert('Ok')">Ok</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dd').dialog('close')">Cancel</a>
		</div>
		</form>
	<!--  <s:form id="dg">
		<s:textfield name="field1" label="filed1"/>
		<s:textfield name="field2" label="filed2"/>
		<s:textfield name="field3" label="filed3"/>
		<s:textfield name="field4" label="filed4"/>
		<s:textfield name="field5" label="filed5"/>
		<s:textfield name="field6" label="filed6"/>
	</s:form>-->
	
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/login.js"></script>	
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
    $(function(){
    	$("#dialog").hide();
    	});
		$(document).ready(function(){
			alert();
			  
		});
		$("#add").click(function(){
			  $("#dialog").show();
			});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/daily_check.css">

<script type="text/javascript">
	function content(Names) {
		var Name
		for (var i = 1; i < 7; i++) { //  更改数字7可以改变选择的内容数量，在下拉总数值的基础上+1.比如：下拉菜单有5个值，则4变成6
			var tempname = "inconformity" + i
			var NewsHot = "i" + i //  “i”是ID名称，比如：ID命名为“i1”，这里的“i”即为“i”
			if (Names == tempname) {
				Nnews = document.getElementById(NewsHot)
				Nnews.style.display = '';
			} else {
				Nnews = document.getElementById(NewsHot)
				Nnews.style.display = 'none';
			}
		}
	}
	function Display(v) {
			var date = document.getElementById("lastdate");
		if (v=="0") {

			date.style.display = "none";
		} else {
			date.style.display = '';
		}
	}
</script>
<title>定期检查</title>
</head>
<body>
	<table title="日常检查" class="easyui-datagrid" pagination="true"
		data-options="
                url: '${pageContext.request.contextPath}/json/check_info.json',method: 'get',striped:true,singleSelec:true,toolbar:toolbar">
		<thead>
			<tr>
				<th data-options="field:'checker'">检查人</th>
				<th data-options="field:'check_datetime'" align="right">检查时间</th>
				<th data-options="field:'check_location'">检查地点</th>
				<th data-options="field:'checked_department'">被检部门</th>
				<th data-options="field:'index_name'">不符合项</th>
				<th data-options="field:'problem_description'">问题描述</th>
				<th data-options="field:'deduct_points'">扣分</th>
				<th data-options="field:'risk_level'">风险等级</th>
				<th data-options="field:'rectify_type'">整改类型</th>
				<th data-options="field:'rectify_deadline'">整改期限</th>
				<th data-options="field:'rectify_propose'">整改建议</th>
			</tr>
		</thead>
	</table>


	<div id="w" title="不符合项（隐患、不安全行为）"
		data-options="iconCls:'icon-save',footer:'#ft'"
		style="width: 920px; height: 460px; padding: 10px;">
		<table>
			<tr>
				<td class="label">不符合项类别：</td>
				<td><input type="radio" name="inconformitytype" value="0"
					checked>隐患<input type="radio" name="inconformitytype"
					value="1">不安全行为</td>
				<td class="label">检查成员：</td>
				<td><select class="easyui-combobox" name="cmbChecker"
					style="width: 200px;"></select></td>
				<td class="label">检查时间：</td>
				<td><input id="dtbCheckDateTime" class="easyui-datetimebox"
					required style="width: 200px"></td>
			</tr>
			<tr>
				<td class="label">录入人：</td>
				<td><input id="recordperson" class="easyui-textbox"
					panelWidth: 350" readonly style="width: 200px;"></td>
				<td class="label">被检单位/部门：</td>
				<td><input id="checked_department" class="easyui-textbox"
					panelWidth: 350" readonly style="width: 200px;"></td>
				<td class="label">安全负责人：</td>
				<td><input id="safeprinciple" class="easyui-textbox"
					panelWidth: 350" readonly style="width: 200px;"></td>
			</tr>
			<tr>
				<td class="label">不符合项性质：</td>
				<td><select id="inconformity_aspect" class="easyui-combotree"
					data-options="url:'${pageContext.request.contextPath}/json/inconformity_aspect.json',method:'get',panelWidth: 200,onClick:function(node){content('inconformity'+node.id);}"
					style="width: 200px;"></select></td>
			</tr>

			<tr id="i1" style="display: none">
				<td class="label">环境：</td>
				<td><input class="easyui-combobox"
					data-options="method:'get',required:true,panelWidth: 300"
					style="width: 200px;"></td>
			</tr>

			<tr id="i2" style="display: none">
				<td class="label">机器设备：</td>
				<td><input class="easyui-combobox"
					data-options="method:'get',required:true,panelWidth: 350"
					style="width: 200px;"></td>
			</tr>
			<tr id="i3" style="display: none">
				<td class="label">行为：</td>
				<td><input class="easyui-combobox"
					data-options="method:'get',required:true,panelWidth: 350"
					style="width: 200px;"></td>
			</tr>
			<tr id="i4" style="display: none">
				<td class="label">过程：</td>
				<td><input class="easyui-combobox"
					data-options="method:'get',required:true,panelWidth: 350"
					style="width: 200px;"></td>
			</tr>
			<tr id="i5" style="display: none">
				<td class="label">记录和数据：</td>
				<td><input class="easyui-combobox"
					data-options="method:'get',required:true,panelWidth: 350"
					style="width: 200px;"></td>
			</tr>
			<tr id="i6" style="display: none">

				<td class="label">文件：</td>
				<td><input class="easyui-combobox"
					data-options="method:'get',required:true,panelWidth: 350"
					style="width: 200px;"></td>
			</tr>


			<tr>
				<td class="label">不符合项描述：</td>
				<td colspan="5"><input id="txtProblem" class="easyui-textbox"
					data-options="multiline:true" style="width: 775px; height: 40px;"></td>
			</tr>
			<tr>
				<td colspan="6"><a href="#" class="easyui-linkbutton"
					data-options="iconCls:'icon-add'">没有标准，上报</a></td>
			</tr>
			<tr>
				<td class="label">对应标准：</td>
				<td colspan="5"><select class="easyui-combobox" id="indexsn"
					data-options="multiline:true" style="width: 775px; height: 40px;"></select></td>
			</tr>
			<tr>
				<td class="label">对应危险源：</td>
				<td colspan="5"><select class="easyui-combobox"
					id="unsafestatus" data-options="multiline:true"
					style="width: 775px; height: 40px;"></select></td>
			</tr>
			<tr>
				<td class="label">不符合项专业：</td>
				<td><select id="cc" class="easyui-combotree"
					data-options="url:'${pageContext.request.contextPath}/json/speciality_tree.json',method:'get',panelWidth: 200"
					style="width: 200px;"></select></td>
				<td class="label">不符合项等级：</td>
				<td><select class="easyui-combotree" id="inconformity_level"
					data-options="url:'${pageContext.request.contextPath}/json/inconformity_level.json',required:true,editable:false,panelWidth: 300"
					style="width: 200px"></select></td>

			</tr>
			<tr>
				<td class="label">整改类型：</td>
				<td><input type="radio" name="recttype" value="0"
					onClick="Display(this.value)" checked>立即整改<input
					type="radio" name="recttype" value="1"
					onClick="Display(this.value)">限期整改</td>
				<td class="label">整改负责人：</td>
				<td><select class="easyui-textbox" name="cmbPrincipal"
					style="width: 200px;" readonly></select></td>
			</tr>
			<tr id="lastdate" style="display: none">
				<td class="label">整改期限：</td>
				<td><input id="dtbRectifyDeadline" class="easyui-datetimebox"
					required style="width: 200px"></td>
			</tr>

			<tr>
				<td class="label">整改建议：</td>
				<td colspan="5"><input id="txtRectifyPropose"
					class="easyui-textbox" style="width: 775px" multiline></td>
			</tr>
			<tr>
				<td class="label">附件：</td>
				<td colspan="5"><input class="easyui-filebox" name="file1"
					data-options="prompt:'选择图片或视频...',buttonText:'文件'"
					style="width: 700px"><a href="#" id="uploadbtn"
					class="easyui-linkbutton">上传</a></td>
			</tr>
		</table>
	</div>
	<div id="ft" style="padding: 5px; text-align: center;">
		<a href="#" class="easyui-linkbutton"
			data-options="iconCls:'icon-add'">添加</a>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
		var toolbar = [ {
			text : '添加',
			iconCls : 'icon-add',
			handler : function() {
				$("#w").dialog({
					closed : false
				});
			}
		}, {
			text : '修改',
			iconCls : 'icon-edit',
			handler : function() {
				alert('修改')
			}
		}, {
			text : '删除',
			iconCls : 'icon-remove',
			handler : function() {
				alert('删除')
			}
		} ];
		$(function() {
			$("#w").dialog({
				closed : true
			});
		});
	</script>
</body>
</html>
</body>
</html>
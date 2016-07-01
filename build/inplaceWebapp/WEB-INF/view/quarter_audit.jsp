<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/daily_check.css">

<title>Insert title here</title>
</head>
<body>
<table title="季度审核" class="easyui-datagrid"
            data-options="
                url: '${pageContext.request.contextPath}/json/quarter_audit.json',method: 'get',striped:true,singleSelec:true,toolbar:tb">
        <thead>
            <tr>
            	<th data-options="field:'department'" >单位</th>
                <th data-options="field:'headman'" >审核组长</th>
                <th data-options="field:'member'" >审核成员</th>
                <th data-options="field:'audit_date'"  align="right">审核日期</th>
                <th data-options="field:'bfhx'"  align="right">不符合项</th>
                <th data-options="field:'fjkhx'"  align="right">附加考核项</th>
                <th data-options="field:'computescore'">系统计算得分</th>
                <th data-options="field:'addsubscore'">加减分</th>
                <th data-options="field:'finalscore'">最终得分</th>
                <th data-options="field:'rank'">排名</th>
                <th data-options="field:'editor'">录入人</th>
            </tr>
        </thead>
    </table>
 <div id="tb" style="padding:2px 5px;">
        <select class="easyui-combobox" panelHeight="auto" style="width:80px">
            <option value="java">2016年</option>
            <option value="c">2015年</option>
        </select>
        <select class="easyui-combobox" panelHeight="auto" style="width:80px">
            <option value="1">第1季度</option>
            <option value="2">第2季度</option>
            <option value="3">第3季度</option>
            <option value="4">第4季度</option>
        </select>
        <select class="easyui-combobox" panelHeight="auto" style="width:100px">
            <option value="java">煤矿</option>
            <option value="c">洗煤厂</option>
            <option value="basic">煤化工</option>
            <option value="perl">物业公司</option>
        </select>
         <select class="easyui-combobox" panelHeight="auto" style="width:300px">
            <option value="java">煤矿安全风险预控管理体系审核指南2016版</option>
            <option value="c">煤矿安全风险预控管理体系审核指南2015版</option>
        </select>
        <a href="#" id="btnAddAudit" class="easyui-linkbutton" iconCls="icon-add">添加</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit">修改</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove">删除</a>
        <a href="#" id="btnAuditList" class="easyui-linkbutton" iconCls="icon-marking">进入审核打分</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-excel">输出审核打分表</a>
    </div>

<div id="w" title="添加审核信息" data-options="iconCls:'icon-save',footer:'#ft'" style="width:310px;height:360px;padding:10px;">
        <table>
        	<tr>
        		<td class="label">被审单位：</td><td><input id="checked_department" class="easyui-combotree" data-options="url:'${pageContext.request.contextPath}/json/dept_tree.json',method:'get',required:true,panelWidth: 350" style="width:200px;"></td>        		
        	</tr>
        	<tr>
        		<td class="label">审核日期：</td><td><input id="dtbAuditDate" class="easyui-datetimebox" required style="width:200px"></td>        		
        	</tr>
        	<tr>
        		<td class="label">审核组长：</td><td><select class="easyui-combobox" name="cmbHeadMan" style="width:200px;"></select></td>        		
        	</tr>
        	<tr>
        		<td class="label">审核成员：</td><td><select class="easyui-combobox" name="cmbMember" style="width:200px;"></select></td>        		        		
        	</tr>
        	<tr>
        		<td align="center" colspan="2"><a href="#" class="easyui-linkbutton" iconCls="icon-import">导入审核成员</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-excel">导出审核成员</a></td>        		
        	</tr>
        	
        </table>
    </div>
    <div id="ft" style="padding:5px;text-align:center;">
    	 <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
    </div>
    <div id="auditw" title="指标打分" data-options="iconCls:'icon-save',footer:'#ftsave'" style="width:920px;height:460px;padding:10px;">
    	<table  class="easyui-treegrid" style="width:900px"    data-options="url: '${pageContext.request.contextPath}/json/audit_list.json',method: 'get',rownumbers: true,idField: 'id',treeField: 'name'">
        <thead>
            <tr>
                <th data-options="field:'name'" width="600">指标</th>
                <th data-options="field:'id',formatter:formatOper" width="100" align="right">符合度（得分率）</th>               
            </tr>
        </thead>
    </table>
    </div>
     <div id="ftsave" style="padding:5px;text-align:center;">
    	 <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
    </div>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
		$(function(){
			$("#btnAddAudit").click(function(){
				$("#w").dialog({
					closed:false
                });
			});
			$("#btnAuditList").click(function(){
				$("#auditw").dialog({
					closed:false,
					maximized:true
                });
				});
		});
		function formatOper(val,row,index){ 
			if(val.indexOf("P")>-1||val.indexOf("D")>-1){
				return '<select class="easyui-combobox" panelHeight="auto" style="width:80px">            <option value="1">100%</option>            <option value="0.9">90%</option>            <option value="0.8">80%</option>            <option value="0.7">70%</option>        </select>';
				}else{
					return "";  
				}
		} 
    </script>
</body>
</html>
</body>
</html>
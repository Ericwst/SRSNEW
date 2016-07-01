<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">

</head>
<body>
<lable for="checked_department">被检单位：</lable><input id="checked_department" class="easyui-combotree" data-options="url:'${pageContext.request.contextPath}/json/dept_tree.json',method:'get',required:true,panelWidth: 350" style="width:200px;">
<lable for="standard">评分标准：</lable>
<select id="standard" class="easyui-combobox" name="state" style="width:300px;">
        <option value="2016standard">2016井工煤矿安全风险管理体系考核评分标准</option>
        <option value="2016audit">2016井工煤矿安全风险管理体系审核指南</option>
        <option value="2015standard">2015井工煤矿安全风险管理体系考核评分标准</option>
        <option value="2015audit">2015井工煤矿安全风险管理体系审核指南</option>
</select>
<label for="speciality">专业：</label>
<select id="cc" class="easyui-combotree" data-options="url:'${pageContext.request.contextPath}/json/speciality_tree.json',method:'get',panelWidth: 200" multiple style="width:160px;"></select>

 <table title="检查工单" class="easyui-treegrid" style="width:900px"
            data-options="
                url: '${pageContext.request.contextPath}/json/check_list.json',method: 'get',rownumbers: true,idField: 'id',treeField: 'name',toolbar:toolbar">
        <thead>
            <tr>
                <th data-options="field:'name'" width="600">指标</th>
                <th data-options="field:'size'" width="100" align="right">设计分值</th>
                <th data-options="field:'date'" width="150">专业</th>
            </tr>
        </thead>
    </table>

<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
        var toolbar = [{
            text:'打印',
            iconCls:'icon-print',
            handler:function(){alert('打印')}
        },{
            text:'导出Excel',
            iconCls:'icon-excel',
            handler:function(){alert('导出Excel')}
        }];
    </script>
</body>
</html>
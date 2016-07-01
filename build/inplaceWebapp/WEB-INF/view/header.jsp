<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
<title></title>
</head>
<body>
    <div class="header1">
        <div class="header2">
            <div class="logo">
                <strong>神华宁煤安全风险预控管理信息系统</strong>
            </div>
            <div class="contact">
                <div class="prompt">
                    <span id="today"></span>
                </div>
                <div class="headerMenu">
                    <ul>
                        <li><a href="#" class="easyui-linkbutton" data-options="plain:true" onclick="confirm('您是否要退出系统？');">安全退出</a></li>
                        <li><a href="#" class="easyui-menubutton" data-options="menu:'#mm2'">我的信息</a></li>
                        <li><a href="#" class="easyui-linkbutton" data-options="plain:true" onclick="addNewTab('系统使用视频教程', 'BulletinBoard.html')" >系统使用视频教程</a></li>
                        <li><a href="#" class="easyui-menubutton" data-options="menu:'#mm1'">您好，XXX</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="mm1">
        <div onclick="addNewTab('个人设置', 'BulletinBoard.html');">个人设置</div>
        <div onclick="addNewTab('个人菜单', 'BulletinBoard.html');">个人菜单</div>
    </div>
    <div id="mm2">
        <div onclick="addNewTab('header二级菜单1', 'BulletinBoard.html');">我的不符合项</div>
        <div onclick="addNewTab('header二级菜单2', 'BulletinBoard.html');">我要整改的</div>
        <div class="menu-sep"></div>
        <div onclick="addNewTab('header二级菜单3', 'BulletinBoard.html');">我要复查的</div>
        <div onclick="addNewTab('header二级菜单4', 'BulletinBoard.html');">header二级菜单4</div>
        <div onclick="addNewTab('header二级菜单5', 'BulletinBoard.html');">header二级菜单5</div>
        <div onclick="addNewTab('header二级菜单6', 'BulletinBoard.html');">header二级菜单6</div>
    </div>
    <script type="text/javascript">
$(document).ready( function(){
	$("#today").text("");
	// 指定向JSONExample发送请求，将id为form1的表单所包含的表单控件转换为请求参数
	$.post("chinaDate" , function(data , statusText)
		{
		for(var propName in data)
		{
			$("#today").append(data[propName]);
		}
		},
		// 指定服务器响应为JSON数据
		"json");
});
	</script>
</body>
</html>
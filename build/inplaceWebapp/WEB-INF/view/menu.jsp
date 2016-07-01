<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="easyui-tree"
		data-options="animate: true,onClick: function(node){addNewTab(node.text,node.id)}">
		<li id='' data-options="state:'closed'"><span>不符合项检查</span>
			<ul>
				<li id='' data-options="state:'closed'"><span>单位自查</span>
					<ul>
						<li id='check_list'><span>检查表</span></li>
						<li id='daily_check'><span>动态检查</span></li>
						<li id='periodical_check'><span>定期检查</span></li>
						<li id='special_check'><span>专项检查</span></li>
					</ul></li>
				<li id='' data-options="state:'closed'"><span>业务部门检查</span>
					<ul>
						<li id='check_list'><span>检查表</span></li>
						<li id='daily_check'><span>动态检查</span></li>
						<li id='periodical_check'><span>定期检查</span></li>
						<li id='special_check'><span>专项检查</span></li>
					</ul></li>
				<li id='' data-options="state:'closed'"><span>高层管理人员检查</span>
					<ul>
						<li id='check_list'><span>检查表</span></li>
						<li id='daily_check'><span>动态检查</span></li>
						<li id='periodical_check'><span>定期检查</span></li>
						<li id='special_check'><span>专项检查</span></li>
					</ul></li>
				<li id='' data-options="state:'closed'"><span>神华检查</span>
					<ul>
						<li id='daily_check'><span>动态检查</span></li>
						<li id='periodical_check'><span>定期检查</span></li>
						<li id='special_check'><span>专项检查</span></li>
					</ul></li>
				<li id='' data-options="state:'closed'"><span>外部检查</span>
					<ul>
						<li id='daily_check'><span>动态检查</span></li>
						<li id='periodical_check'><span>定期检查</span></li>
						<li id='special_check'><span>专项检查</span></li>
					</ul></li></li>
	</ul>
	<li id='BulletinBoard.html'><span>不符合项整改</span></li>
	<li id='BulletinBoard.html'><span>不符合项复查</span></li>
	<li id='BulletinBoard.html'><span>不符合项预警</span></li>
	<li id='' data-options="state:'closed'"><span>不符合项查询</span>
		<ul>
			<li id='BulletinBoard.html'><span>按专业查询</span></li>
			<li id='BulletinBoard.html'><span>按单位查询</span></li>
			<li id='BulletinBoard.html'><span>按指标查询</span></li>
			<li id='BulletinBoard.html'><span>高级查询</span></li>
		</ul></li>
	<li id='' data-options="state:'closed'"><span>不符合项报表</span>
		<ul>
			<li id='' data-options="state:'closed'"><span>日报</span>
				<ul>
					<li id='dailyreportbyspeciality'><span>按专业</span></li>
					<li id=''><span>按检查人</span></li>
					<li id=''><span>按被检部门</span></li>
					<li id=''><span>按检查单位</span></li>
				</ul></li>
			<li id='' data-options="state:'closed'"><span>周报</span>
				<ul>
					<li id='dailyreportbyspeciality'><span>按专业</span></li>
					<li id=''><span>按检查人</span></li>
					<li id=''><span>按被检部门</span></li>
					<li id=''><span>按检查单位</span></li>
				</ul></li>
			<li id='' data-options="state:'closed'"><span>月报</span>
				<ul>
					<li id=''><span>按专业</span></li>
					<li id=''><span>按检查人</span></li>
					<li id=''><span>按被检部门</span></li>
					<li id=''><span>按检查单位</span></li>
				</ul></li>
			<li id='' data-options="state:'closed'"><span>季报</span>
				<ul>
					<li id=''><span>按专业</span></li>
					<li id=''><span>按检查人</span></li>
					<li id=''><span>按被检部门</span></li>
					<li id=''><span>按检查单位</span></li>
				</ul></li>
			<li id='' data-options="state:'closed'"><span>半年报</span>
				<ul>
					<li id=''><span>按专业</span></li>
					<li id=''><span>按检查人</span></li>
					<li id=''><span>按被检部门</span></li>
					<li id=''><span>按检查单位</span></li>
				</ul></li>
				<li id='' data-options="state:'closed'"><span>年报</span>
				<ul>
					<li id=''><span>按专业</span></li>
					<li id=''><span>按检查人</span></li>
					<li id=''><span>按被检部门</span></li>
					<li id=''><span>按检查单位</span></li>
				</ul></li>
		</ul></li>
		<li id='' data-options="state:'closed'"><span>考核标准管理</span>
		<ul>
			<li id='standard'><span>审核指南</span></li>
			<li id='standard'><span>评分标准</span></li>
			<li id='muban'><span>模板</span></li>
		</ul></li>
		<li id='' data-options="state:'closed'"><span>体系审核</span>
		<ul>
			<li id='BulletinBoard.html'><span>单位内审</span></li>
			<li id='quarter_audit'><span>季度审核</span></li>
			<li id='BulletinBoard.html'><span>神华审核</span></li>
		</ul></li>
		<li id='' data-options="state:'closed'"><span>管理评审</span>
		<ul>
			<li id='BulletinBoard.html'><span>评审录入</span></li>
			<li id='BulletinBoard.html'><span>评审查询</span></li>
		</ul></li>
		<li id='' data-options="state:'closed'"><span>危险源</span>
		<ul>
			<li id='manager'><span>根源危险源</span></li>
			<li id='hazard'><span>状态危险源</span></li>
		</ul></li>
		<li id='' data-options="state:'closed'"><span>内业资料</span>
		<ul>
			<li id='BulletinBoard.html'><span>内业上传</span></li>
			<li id='BulletinBoard.html'><span>内业查询</span></li>
		</ul></li>
		<li id='' data-options="state:'closed'"><span>安全日报</span>
		<ul>
			<li id='BulletinBoard.html'><span>安全日报上传</span></li>
			<li id='BulletinBoard.html'><span>安全日报查询</span></li>
		</ul></li>
		<li id='' data-options="state:'closed'"><span>系统使用统计</span>
		<ul>
			<li id='BulletinBoard.html'><span>单位使用统计</span></li>
			<li id='BulletinBoard.html'><span>人员使用统计</span></li>
			<li id='BulletinBoard.html'><span>模块使用统计</span></li>
			<li id='BulletinBoard.html'><span>页面使用统计</span></li>
		</ul></li>
		<li id='' data-options="state:'closed'"><span>基础管理</span>
		<ul>
			<li id='BulletinBoard.html'><span>部门设置</span></li>
			<li id='BulletinBoard.html'><span>人员管理</span></li>
			<li id='BulletinBoard.html'><span>角色设置</span></li>
			<li id='BulletinBoard.html'><span>权限分配</span></li>
		</ul></li>
	<ul>
		<li id='BulletinBoard.html'><span>不符合项查询</span></li>
	</ul>
	</li>

	</ul>
</body>
</html>
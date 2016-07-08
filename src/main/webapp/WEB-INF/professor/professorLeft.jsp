<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
	function quit() {
		if (confirm("确认注销吗？")) {
			window.location.href = "adminLogin.jsp";
		}
	}
</script>

<div class="sidebar-nav">
	<ul>

		<li><a href="#" data-target=".dashboard-menu" class="nav-header"
			data-toggle="collapse"><i class="fa fa-fw fa-dashboard"></i> 增删查改<i
				class="fa fa-collapse"></i></a></li>
		<li>
			<ul class="dashboard-menu nav nav-list collapse in">
				<li><a href="adminLogined.jsp"><span
						class="fa fa-caret-right"></span> 学生信息查询</a></li>
				<li><a href="professor_student"><span
						class="fa fa-caret-right"></span> 教师信息更改</a></li>
				<li><a
					href=""><span
						class="fa fa-caret-right"></span> 选课情况查询</a></li>
				<li><a href="calendar.jsp"><span class="fa fa-caret-right"></span>
						学生成绩查询</a></li>
			</ul>
		</li>

		<li data-popover="true"
			data-content="Items in this group require a <strong><a href='http://portnine.com/bootstrap-themes/aircraft' target='blank'>premium license</a><strong>."
			rel="popover" data-placement="right"><a href="#"
			data-target=".premium-menu" class="nav-header collapsed"
			data-toggle="collapse"><i class="fa fa-fw fa-fighter-jet"></i>
				其他功能<i class="fa fa-collapse"></i></a></li>
		<li>
			<ul class="premium-menu nav nav-list collapse">

				<li><a href="activity.jsp"><span class="fa fa-caret-right"></span>
						其他功能</a></li>
				<li><a href="activity-item.jsp"><span
						class="fa fa-caret-right"></span> 其他功能</a></li>
				<li><a href="activity-launch.jsp"><span class="fa fa-caret-right"></span>
						其他功能</a></li>
				<li><a href="studyinghall.jsp"><span
						class="fa fa-caret-right"></span> 其他功能</a></li>
				<li><a href="booking.jsp"><span class="fa fa-caret-right"></span>
						其他功能</li>
				<li><a href="place.jsp"><span class="fa fa-caret-right"></span>
						场地租借情况</a></li>
				<li><a href="place-booking.jsp"><span
						class="fa fa-caret-right"></span> 其他功能</a></li>
				<li><a href="premium-colors.jsp"><span
						class="fa fa-caret-right"></span> 网页主题更换</a></li>

			</ul>
		</li>

		<li><a href="#" data-target=".accounts-menu"
			class="nav-header collapsed" data-toggle="collapse"><i
				class="fa fa-fw fa-briefcase"></i> 其他功能<span
				class="label label-info">+3</span></a></li>
		<li>
			<ul class="accounts-menu nav nav-list collapse">
				<li><a href="javascript:quit()"><span
						class="fa fa-caret-right"></span> 管理员注销</a></li>
				<li><a href="reset-password.jsp"><span
						class="fa fa-caret-right"></span> 重置密码</a></li>
			</ul>
		</li>

		<li><a href="#" data-target=".legal-menu"
			class="nav-header collapsed" data-toggle="collapse"><i
				class="fa fa-fw fa-legal"></i> 法律相关<i class="fa fa-collapse"></i></a></li>
		<li>
			<ul class="legal-menu nav nav-list collapse">
				<li><a href="privacy-policy.html"><span
						class="fa fa-caret-right"></span> 隐私政策</a></li>
				<li><a href="terms-and-conditions.html"><span
						class="fa fa-caret-right"></span> 详情介绍</a></li>
			</ul>
		</li>

		<li><a href="help.html" class="nav-header"><i
				class="fa fa-fw fa-question-circle"></i> 帮助</a></li>

	</ul>
</div>
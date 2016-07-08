<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--顶部导航栏 -->

<div class="navbar navbar-default" role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target=".navbar-collapse">
			<span class="sr-only">学生SRS管理</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="" href="index.html"><span class="navbar-brand"><span
				class="fa fa-paper-plane"></span> 学生SRS管理</span></a>
	</div>

	<div class="navbar-collapse collapse" style="height: 1px;">
		<ul id="main-menu" class="nav navbar-nav navbar-right">
			<li class="dropdown hidden-xs"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> <span
					class="glyphicon glyphicon-user padding-right-small"
					style="position: relative; top: 3px;"></span> ${sessionScope.person.getname()} <i
					class="fa fa-caret-down"></i>
			</a>

				<ul class="dropdown-menu">
					<li><a href="./">我的信息</a></li>
					<li class="divider"></li>
					<li><a href="./">注销登录</a></li>
				</ul></li>
		</ul>
	</div>
</div>
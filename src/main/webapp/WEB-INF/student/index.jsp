<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>学生信息</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="stylesheets/premium.css">
<script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>
<link href="script/ligerUI/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet" />
<script src="script/jquery/jquery-1.7.1.min.js"></script>
<script src="script/ligerUI/js/ligerui.min.js"></script>

<script src="script/jquery-validation/jquery.validate.min.js"></script>
<script src="script/jquery-validation/jquery.metadata.js"></script>
<script src="script/jquery-validation/messages_cn.js"></script>
<script src="script/json2.js"></script>
</head>
<body class=" theme-blue">

	<script type="text/javascript">
		$(function() {
			var match = document.cookie.match(new RegExp('color=([^;]+)'));
			if (match)
				var color = match[1];
			if (color) {
				$('body').removeClass(function(index, css) {
					return (css.match(/\btheme-\S+/g) || []).join(' ')
				})
				$('body').addClass('theme-' + color);
			}

			$('[data-popover="true"]').popover({
				html : true
			});

		});
	</script>
	<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.middle input {
	display: block;
	width: 30px;
	margin: 2px;
}

.navbar-default .navbar-brand, .navbar-default .navbar-brand:hover {
	color: #fff;
}
</style>

	<script type="text/javascript">
		$(function() {
			var uls = $('.sidebar-nav > ul > *').clone();
			uls.addClass('visible-xs');
			$('#main-menu').append(uls.clone());
		});
	</script>
	<link rel="shortcut icon" href="../assets/ico/favicon.ico">
	<link rel="apple-touch-icon-precomposed" sizes="144x144"
		href="../assets/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114"
		href="../assets/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72"
		href="../assets/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed"
		href="../assets/ico/apple-touch-icon-57-precomposed.png">
	<!--顶部导航栏 -->
	<jsp:include page="studentTop.jsp" flush="true" />

	<!--左边导航栏 -->
	<jsp:include page="studentLeft.jsp" flush="true" />

	<!--右边正文 -->
	<div class="content">
		<div class="header">

			<h1 class="page-title">学生SRS系统</h1>
			<ul class="breadcrumb">
				<li><a href="student_login">首页</a></li>
				<li class="active">学生选课</li>
			</ul>

		</div>

		<div class="main-content">



			<!-- 学生选课 -->
			<form id="form1" class="liger-form" data-validate="{}">
				<div class="fields">
					<input data-type="text" data-label="StudentName"
						data-name="StudentName" validate="{required:true,minlength:5}" />
					<input data-type="text" data-label="ID Number" data-name="ID"
						validate="{required:true}" /> <input data-type="text"
						data-label="Total Course" data-name="TotalCourse"
						validate="{required:false}" />
				</div>
				<div>
					<div style="margin: 4px; float: left;">
						<p>Schedule Of Classes</p>
						<div id="listbox1"></div>
					</div>
					<div style="margin: 4px; float: left;" class="middle">
						<p>&nbsp;&nbsp;</p>
						<input type="button" onclick="moveToRight()" value="->" /> <input
							type="button" onclick="moveToLeft()" value="<-" />
					</div>
					<div style="margin: 4px; float: left;">
						<p>RegisteredFor</p>
						<div id="listbox2"></div>
					</div>
				</div>
			</form>
			<div class="liger-button" data-click="f_validate" data-width="150">Save</div>


			<!-- 页面底部 -->
			<jsp:include page="studentFooter.jsp" flush="true" />
		</div>
	</div>


	<script src="lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#listbox1,#listbox2").ligerListBox({
				isShowCheckBox : true,
				isMultiSelect : false,
				width : 450,
				height : 140
			});

			loadSchedule();
			loadResigistion();
		});
		//从服务器加载选课列表
		function loadSchedule() {
			$.post("student_sheduleOfClasses", function(result) {
				if (result.success) {
					liger.get("listbox1").setData(result.data);
				}
			});
		}
		//从服务器加载当前登陆学生已选课程
		function loadResigistion() {

		}
		function moveToLeft() {
			var box1 = liger.get("listbox1"), box2 = liger.get("listbox2");
			var selecteds = box2.getSelectedItems();
			if (!selecteds || !selecteds.length)
				return;
			box2.removeItems(selecteds);
			box1.addItems(selecteds);
		}
		function moveToRight() {
			var box1 = liger.get("listbox1"), box2 = liger.get("listbox2");
			var selecteds = box1.getSelectedItems();
			if (!selecteds || !selecteds.length)
				return;
			//调用后台执行选课操作
			$.post("../enrollCourseServlet", function(result) {
				//var json = JSON2.parse(result);
				//如果选课成果才移动列表框项目，否则应弹出选课失败的原因
				if (result.success) {
					box1.removeItems(selecteds);
					box2.addItems(selecteds);
				} else {
					alert(result.message);
				}
			});
		}

		function f_validate() {
			alert('点击了保存按钮');
		}

		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
		});
	</script>


</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
<script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="stylesheets/premium.css">
<title>学生信息</title>
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

	<div class="content">
		<div class="header">

			<h1 class="page-title">编辑个人信息</h1>
			<ul class="breadcrumb">
				<li><a href="student_index">首页</a></li>
				<li><a href="student_update">信息更新</a></li>
				<li class="active">更改学生信息</li>
			</ul>

		</div>
		<div class="main-content">


			<div class="row">
				<div class="col-md-4">
					<br>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane active in" id="home">
							<form action="${basePath}/student_update" id="stuForm"
								method="post">
								<div class="form-group">
									<label>ssn</label> <input type="text" value=""
										disabled="disabled" class="form-control" name="ssn" id="ssn"
										value="${sessionScope.person.ssn}">
								</div>
								<div class="form-group">
									<label>姓名</label> <input type="text" name="name" id="name"
										class="form-control">
								</div>
								<div class="form-group">
									<label>类型</label> <input type="text" name="title" id="title"
										class="form-control">
								</div>
								<div class="form-group">
									<label>部门</label> <input type="text" name="department"
										id="department" style="width: 120px" class="form-control">
								</div>
								<div class="btn-toolbar list-toolbar">
									<button class="btn btn-primary" type="submit">
										<i class="fa fa-plus"></i> 更改信息
									</button>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>


		</div>
	</div>



	<!-- 页面底部 -->
	<jsp:include page="studentFooter.jsp" flush="true" />


	</div>
	</div>


	<script src="lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
		});
	</script>

</body>
</html>
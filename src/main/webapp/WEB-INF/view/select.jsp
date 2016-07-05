<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>吉他查询</title>
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
	<jsp:include page="adminTop.jsp" flush="true" />

	<!--左边导航栏 -->
	<jsp:include page="adminLeft.jsp" flush="true" />

	<!--右边正文 -->
	<div class="content">
		<div class="header">

			<h1 class="page-title">吉他查询</h1>
			<ul class="breadcrumb">
				<li><a href="send_query">首页</a></li>
				<li class="active">吉他查询</li>
			</ul>

		</div>

		<div class="main-content">

			<div class="btn-toolbar list-toolbar">
				<a href="send_save.action"><button class="btn btn-primary">
						<i class="fa fa-plus"></i> 添加吉他
					</button></a>
			</div>


			<!-- 搜索条件 -->
			<form action="${basePath}/guitar_select" id="stuForm" method="post">
				<table>
					<tr>
						<td>制造商</td>
						<td>型号</td>
						<td>类型</td>
						<td>正面</td>
						<td>反面</td>
					</tr>
					<tr>

						<td>
							<div class="input-group search pull-right hidden-sm hidden-xs">
								<div class="input-group">
									<span class="input-group-btn"><input type="text"
										name="guitarSpec.builder" id="builder" value="${builder}"
										class="form-control"> </span>

								</div>
							</div>
						</td>
						<td>
							<div class="input-group search pull-right hidden-sm hidden-xs">
								<div class="input-group">
									<span class="input-group-btn"><input type="text"
										name="guitarSpec.guitarmodel" id="model"
										value="${guitarmodel}" class="form-control"> </span>

								</div>
							</div>
						</td>
						<td>
							<div class="input-group search pull-right hidden-sm hidden-xs">
								<div class="input-group">
									<span class="input-group-btn"><input type="text"
										name="guitarSpec.type" id="type" value="${type}"
										class="form-control"> </span>

								</div>
							</div>
						</td>
						<td>
							<div class="input-group search pull-right hidden-sm hidden-xs">
								<div class="input-group">
									<span class="input-group-btn"><input type="text"
										name="guitarSpec.topwood" id="topwood" value="${topwood}"
										class="form-control"> </span>

								</div>
							</div>
						</td>
						<td>
							<div class="input-group search pull-right hidden-sm hidden-xs">
								<div class="input-group">
									<span class="input-group-btn"><input type="text"
										name="guitarSpec.backwood" id="backwood" style="width: 120px"
										value="${backwood}" class="form-control"> </span>


								</div>
							</div>
						</td>
						<td>
							<div class="input-group search pull-right hidden-sm hidden-xs">
								<div class="input-group">
									<button class="btn btn-primary" type="submit">
										<i class="fa fa-search "></i>
									</button>

								</div>
							</div>
						</td>
					</tr>
				</table>
			</form>

			<!-- 后台返回结果为空 -->
			<c:if test="${fn:length(result) eq 0 }">
				<span>查询的结果不存在${msg}</span>
			</c:if>
			<!-- 后台返回结果不为空 -->
			<c:if test="${fn:length(result) gt 0 }">
				<div class="btn-group"></div>
				<table class="table">
					<thead>
						<tr>
							<th>序列号</th>
							<th>价格</th>
							<th>制造商</th>
							<th>型号</th>
							<th>类型</th>
							<th>正面</th>
							<th>反面</th>
							<th style="width: 3.5em;"></th>

						</tr>
					</thead>
					<tbody>

						<c:forEach items="${result}" var="guitar">
							<tr bgcolor="#FFFFFF">
								<td height="30"><c:out value="${guitar.id }"></c:out></td>
								<td><c:out value="${guitar.price }"></c:out></td>
								<td><c:out value="${guitar.guitarSpec.builder }"></c:out></td>
								<td><c:out value="${guitar.guitarSpec.guitarmodel }"></c:out></td>
								<td><c:out value="${guitar.guitarSpec.type }"></c:out></td>
								<td><c:out value="${guitar.guitarSpec.topwood }"></c:out></td>
								<td><c:out value="${guitar.guitarSpec.backwood }"></c:out></td>
								<td><a
									href="${basePath}/guitar_delete.action?id=${guitar.id }">删除</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</c:if>



			<!-- 页面底部 -->
			<jsp:include page="adminFooter.html" flush="true" />
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

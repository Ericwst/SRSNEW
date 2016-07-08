<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1.0" />
<title>登陆</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<style type="text/css">
html, body {
	height: 100%;
}

.box {
	FILTER: progid:DXImageTransform.Microsoft.gradient(startColorstr='#87CEFA',
		endColorstr='#87CEFA'); /*  IE */
	background-image: linear-gradient(bottom, #87CEFA 0%, #87CEFA 100%);
	background-image: -o-linear-gradient(bottom, #87CEFA 0%, #87CEFA 100%);
	background-image: -moz-linear-gradient(bottom, #87CEFA 0%, #87CEFA 100%);
	background-image: -webkit-linear-gradient(bottom, #87CEFA 0%, #87CEFA 100%);
	background-image: -ms-linear-gradient(bottom, #87CEFA 0%, #87CEFA 100%);
	margin: 0 auto;
	position: relative;
	width: 100%;
	height: 100%;
}

.login-box {
	width: 100%;
	max-width: 500px;
	height: 400px;
	position: absolute;
	top: 50%;
	margin-top: -200px;
	/*设置负值，为要定位子盒子的一半高度*/
}

@media screen and (min-width:500px) {
	.login-box {
		left: 50%;
		/*设置负值，为要定位子盒子的一半宽度*/
		margin-left: -250px;
	}
}

.form {
	width: 100%;
	max-width: 500px;
	height: 275px;
	margin: 25px auto 0px auto;
	padding-top: 25px;
}

.login-content {
	height: 300px;
	width: 100%;
	max-width: 500px;
	background-color: rgba(255, 250, 2550, .6);
	float: left;
}

.input-group {
	margin: 0px 0px 30px 0px !important;
}

.form-control, .input-group {
	height: 40px;
}

.form-group {
	margin-bottom: 0px !important;
}

.login-title {
	padding: 20px 10px;
	background-color: rgba(0, 0, 0, .6);
}

.login-title h1 {
	margin-top: 10px !important;
}

.login-title small {
	color: #fff;
}

.link p {
	line-height: 20px;
	margin-top: 30px;
}

.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}
</style>
<!-- 检查表单是否为空 -->
<script type="text/javascript" src="js/checkEmpty.js"></script>
</head>

<body>
	<div class="box">
		<!--学生登陆  -->
		<div class="login-box">
			<div class="login-title text-center">
				<h1>
					<small>SRS登陆</small>
				</h1>
			</div>
			<div class="login-content">
				<div class="form">
					<form name="person" action="person_login" method="post"
						onSubmit="return checkEmpty(personLogin)">
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-user"></span></span> <input type="text"
										name="ssn" class="form-control" placeholder="ssn" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span> <input
										type="password" id="password" name="password"
										class="form-control" placeholder="密码" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<label>身份</label> <select name="status"
									class="form-control">
									<option value="0">学生</option>
									<option value="1">教师</option>
								</select>
							</div>
						</div>
						<div>
							<s:fielderror />
							<!-- 显示表单验证的出错信息 -->
						</div>
						<div class="form-group form-actions">
							<div class="col-xs-4 col-xs-offset-4 ">
								<button type="submit" class="btn btn-sm btn-info" value="登录">
									登录</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div style="text-align: center;"></div>

</body>
</html>


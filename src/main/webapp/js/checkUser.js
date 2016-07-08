/**
 * 用于注册时检查user是否正确
 * 
 */
	function checkUser(form) {
		for (i = 0; i <form.length; i++) {
			if (form.elements[i].value == "") {
				alert("表单信息不能为空");
				return false;
			}
		}
		if (document.form.userPassword.value != document.form.confirmedPassword.value) {
			window.alert("您两次输入的密码不一致，请重新输入");
			return false;
		}
		if (isNaN(document.form.userNumber.value)) {
			window.alert("学号只能为数字");
			return false;
		}
	}
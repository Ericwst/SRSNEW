
function checkEmpty(form) {
	for (i = 0; i < form.length; i++) {
		if (form.elements[i].value == "") {
			alert("表单信息不能为空");
			return false;
		}
	}
}
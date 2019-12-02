function checknews() {
	var title = $("#title");
	if (title.val() == "") {
		alert("标题不能为空!");
		title.focus();
		return false;
	}
	var author = $("#author");
	if (author.val() == "") {
		alert("作者不能为空!");
		author.focus();
		return false;
	}
	var summary = $("#summary");
	if (summary.val() == "") {
		alert("摘要不能为空!");
		summary.focus();
		return false;
	}
	var contents = $("#contents");
	if (contents.val() == "") {
		alert("内容不能为空!");
		contents.focus();
		return false;
	}
	var file = $("input[name=filename]").prop("files")[0];
	if (file) {
		if (file.size > 5 * 1024 * 1024) {
			alert("文件大小不能超过5mb");
			return false;
		}
		var filename = file.name.toLowerCase();
		if (!/^.+\.(jpg|jpeg|png|gif|bmp)$/.test(filename)) {
			alert("必须是个图片文件!");
			return false;
		}
	}
	return true;
}
function addnews() {
	if (!checknews()) {
		return;
	}
	var formData = new FormData($("#frmnews")[0]);
	$.ajax({
		url : "newsmanager?action=newsAdd",
		data : formData,
		dataType : "json",
		type : "post",
		cache : false,
		contentType : false,
		processData : false,
		success : function(result, textStatus, jqxhr) {
			if (result.status == 1) {
				alert("新增新闻成功!");
				location.href = "admin?action=home&categoryId=" + result.message;
			} else {
				alert(result.message);
			}
		},
		error : function(jqxhr, textStatus, errorThrown) {
			console.log(jqxhr.status + textStatus + errorThrown);
		}
	});
}
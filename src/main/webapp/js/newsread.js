//选择主题
function choiceCategory(categoryId) {
	// 最新的新闻和评论
	getLaestDetail(categoryId);
}
// 最新的新闻和评论
function getLaestDetail(categoryId) {
	$.ajax({
		url : "index?action=getLaest",
		data : {
			"categoryId" : categoryId
		},
		dataType : "json",
		type : "get",
		success : function(result, textStatus, jqxhr) {
			if (result.status == 1) {
				var myTemplate = Handlebars.compile($("#laest-template").html());
				var strhtml = myTemplate(result.data.laestDetailList);
				$(".left-box>.left-box-content>ul:eq(0)").html(strhtml);
				strhtml = myTemplate(result.data.laestCommentList);
				$(".left-box>.left-box-content>ul:eq(1)").html(strhtml);
			} else {
				alert(result.message);
			}
		},
		error : function(jqxhr, textStatus, errorThrown) {
			console.log(jqxhr.status + textStatus + errorThrown);
		}
	});
}
// 发表评论
function sendComment() {
	var contents = $("#contents").val().trim();
	if (contents == "") {
		alert("评论的内容不能为空!");
		return;
	}
	// console.log($.param($("#frmcomment").serializeArray()));
	$.ajax({
		url : "newsread?action=commentAdd",
		data : $("#frmcomment").serialize(),
		dataType : "json",
		type : "post",
		success : function(result, textStatus, jqxhr) {
			//console.log(result);
			if (result.status == 1) {
				var myTemplate = Handlebars.compile($("#comments-template").html());
				var strhtml = myTemplate(result.data);
				$(".comment").html(strhtml);
			} else {
				alert(result.message);
			}
		},
		error : function(jqxhr, textStatus, errorThrown) {
			console.log(jqxhr.status + textStatus + errorThrown);
		}
	});
}
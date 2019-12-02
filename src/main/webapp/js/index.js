//选择主题
function choiceCategory(categoryId) {
	// 最新的新闻和评论
	getLaestDetail(categoryId);
	// 新闻列表
	getDetailList(categoryId, 1);
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
// 新闻列表
function getDetailList(categoryId, currPageNo) {
	$.ajax({
		url : "index?action=getDetailList",
		data : {
			"categoryId" : categoryId,
			"currPageNo" : currPageNo
		},
		dataType : "json",
		type : "get",
		success : function(result, textStatus, jqxhr) {
			if (result.status == 1) {
				//console.log(result);
				// 新闻列表
				var myTemplate = Handlebars.compile($("#newsList-template").html());
				var strhtml = myTemplate(result.data);
				$(".news-list-ul").html(strhtml);
				//分页
				myTemplate = Handlebars.compile($("#page-template").html());
				strhtml = myTemplate(result.data);
				$(".page-bar").html(strhtml);
			} else {
				alert(result.message);
			}
		},
		error : function(jqxhr, textStatus, errorThrown) {
			console.log(jqxhr.status + textStatus + errorThrown);
		}
	});
}
function jump() {
	var currPageNo = $("#currPageNo").val();
	var totalpagecount = $("#hidtotalpagecount").val();
	var categoryId = $("#hidcategoryId").val();
	var regexp = /^[1-9]\d*$/;
	if (!regexp.test(currPageNo)) {
		alert("必须输入大于0的整数!");
		return;
	}
	if ((currPageNo - totalpagecount) > 0) {
		alert("页号超出范围了!")
		return;
	}
	getDetailList(categoryId, currPageNo);
}
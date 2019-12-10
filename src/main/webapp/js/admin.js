//选择主题
function choiceCategory() {
	var categoryId = $("#categoryId").val();
	// 新闻列表
	getDetailList(categoryId, 1);
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
				// console.log(result);
				// 新闻列表
				var myTemplate = Handlebars.compile($("#newsList-template").html());
				var strhtml = myTemplate(result.data);
				$("tbody").html(strhtml);
				// 分页
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
function deleteNews(id, link) {
	var flag = confirm("是否删除?");
	if (flag) {
		// location.href = "newsmanager?action=newsDelete&id=" + id;
		$.ajax({
			url : "newsmanager",
			data : {
				"action" : "newsDelete",
				"id" : id
			},
			dataType : "json",
			type : "get",
			success : function(result, textStatus, jqxhr) {
				if (result.status == 1) {
					alert("删除成功!");
					$(link).parent().parent().remove();
				} else {
					alert(result.message);
				}
			},
			error : function(jqxhr, textStatus, errorThrown) {
				console.log(jqxhr.status + textStatus + errorThrown);
			}
		});
	}
}
function addNews() {
	location.href = "category?opt=addnews";
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
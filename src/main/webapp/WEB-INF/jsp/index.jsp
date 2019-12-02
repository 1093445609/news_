<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<c:set var="basePath"
	value="${pageContext.request.scheme }://${pageContext.request.serverName }:${pageContext.request.serverPort }${path}/"></c:set>
<!DOCTYPE html>
<html>
<head>
<base href="${basePath }">
<meta charset="utf-8">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/handlebars-v4.0.11.js"></script>
<script type="text/javascript" src="js/handlerbarshelper.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<script id="newsList-template" type="text/x-handlebars-template">
{{#each newsList}}
	{{#addspace @index 5}}
		<li class='li-line'>
  {{else}}
		<li>
	{{/addspace}}
	<span>{{createDate}}</span> 
	<a href='newsread?id={{id}}'> {{title}}</a>
  </li>
{{/each}}
</script>
<script id="page-template" type="text/x-handlebars-template">
<form action="" method="post">
	<input type="hidden" name="categoryId" id="hidcategoryId"
		value="{{id}}"> <input type="hidden"
		id="hidtotalpagecount" value="{{totalPageCount}}">
	<ul class="page-num-ul clearfix">
		<li>共 {{totalRecordCount}}条记录&nbsp;&nbsp;
			{{currPageNo}}/{{totalPageCount}}页</li>
		{{#gt currPageNo 1}}
			<li><a href="javascript:getDetailList({{id}},1);">第一页</a>
			</li>
			<li><a
				href="javascript:getDetailList({{id}},{{currPageNo}}-1);">上一页</a>
			</li>
		{{/gt}}
		{{#lt currPageNo totalPageCount}}
			<li><a
				href="javascript:getDetailList({{id}},{{currPageNo}}+1);">下一页</a>
			</li>
			<li><a
				href="javascript:getDetailList({{id}},{{totalPageCount}});">最后一页</a>
			</li>
		{{/lt}}
	</ul>
	<span class="page-go-form"><label>跳转至</label> 
	<input type="text"
		id="currPageNo" name="currPageNo" class="page-key"
		value="{{currPageNo}}" />页 <input type="button"
		class="page-btn" value="GO" onclick="jump();"/> </span>
</form>
</script>
<body>
	<c:import url="../include/indexTop.jsp"></c:import>
	<!--d页面主体-->
	<div id="content" class="main-content clearfix">
		<c:import url="../include/indexSidebar.jsp"></c:import>
		<!--页面主体的右部，包括新闻的列表和评论内容 -->
		<div class="main-content-right">
			<!--各专题的新闻列表-->
			<div class="main-text-box">
				<div class="main-text-box-header">
					<h3>全部新闻</h3>
				</div>
				<div class="main-text-box-content">
					<ul class="news-list-ul clearfix">

						<c:set var="newspage" value="${newspage }"></c:set>
						<c:set var="detailList" value="${newspage.newsList }"></c:set>
						<c:forEach var="detail" items="${detailList }" varStatus="status">
							<li <c:if test="${status.count%5==0 }"> class='li-line'</c:if>><span>
									<fmt:formatDate value="${detail.createDate }"
										pattern="yyyy-MM-dd HH:mm:dd" />
							</span> <a href='newsread?id=${detail.id }'> ${detail.title } </a></li>
						</c:forEach>

					</ul>
				</div>
				<div class="page-bar">
					<form action="" method="post">
						<input type="hidden" name="categoryId" id="hidcategoryId"
							value="${newspage.id }"> <input type="hidden"
							id="hidtotalpagecount" value="${newspage.totalPageCount }">
						<ul class="page-num-ul clearfix">
							<li>共${newspage.totalRecordCount}条记录&nbsp;&nbsp;
								${newspage.currPageNo }/${newspage.totalPageCount }页</li>
							<c:if test="${newspage.currPageNo>1 }">
								<li><a href="javascript:getDetailList(${newspage.id },1);">第一页</a>
								</li>
								<li><a
									href="javascript:getDetailList(${newspage.id },${newspage.currPageNo-1});">上一页</a>
								</li>
							</c:if>

							<c:if test="${newspage.currPageNo<newspage.totalPageCount }">
								<li><a
									href="javascript:getDetailList(${newspage.id },${newspage.currPageNo+1});">下一页</a>
								</li>
								<li><a
									href="javascript:getDetailList(${newspage.id },${newspage.totalPageCount});">最后一页</a>
								</li>
							</c:if>
						</ul>
						<span class="page-go-form"><label>跳转至</label> <input type="text"
							id="currPageNo" name="currPageNo" class="page-key"
							value="${newspage.currPageNo }" />页 <input type="button"
							class="page-btn" value="GO" onclick="jump();" /> </span>
					</form>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../include/indexBottom.jsp"></c:import>
</body>
</html>
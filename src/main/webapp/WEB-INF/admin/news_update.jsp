<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<c:set var="basePath"
	value="${pageContext.request.scheme }://${pageContext.request.serverName }:${pageContext.request.serverPort }${path}/"></c:set>

<!DOCTYPE html>
<html>
<head>
<base href="${basePath }">
<meta charset="UTF-8">
<title>修改新闻</title>
<link type="text/css" rel="stylesheet" href="css/common.css" />
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/newsupdate.js"></script>
</head>
<body>
	<!--页面顶部-->
	<c:import url="include/adminTop.jsp"></c:import>
	<!--主体-->
	<div id="content" class="main-content clearfix">
		<c:import url="include/adminSidebar.jsp"></c:import>
		<div class="main-content-right">
			<!--即时新闻-->
			<div class="main-text-box">
				<c:set var="categorys" value="${requestScope.categorys }"></c:set>
				<c:set var="detail" value="${requestScope.detail }"></c:set>
				<form action="" id="frmnews" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="id" value="${detail.id }">
					<input type="hidden" name="hidpicpath"
						value="${detail.picPath }">
					<fieldset>
						<h2 class="hdr-headinfo">修改新闻</h2>
						<div class="fields">
							<p class="row">
								<label for="categoryId">主题:</label> 
								<select id="categoryId"
									name="categoryId" style="width: 302px; height: 25px;">
									<c:forEach var="category" items="${categorys }">
									<option 
									<c:if test="${category.id eq detail.categoryId }"> selected</c:if>
									value='${category.id }'>${category.name }</option>
									</c:forEach>
								</select>
							</p>
							<p class="row">
								<label for="title">标题:</label> 
								<input id="title" name="title"
									type="text" class="field-large"
									value="${detail.title }" />
							</p>
							<p class="row">
								<label for="author">作者:</label> <input id="author" name="author"
									type="text" class="field-large"
									value="${detail.author }" />
							</p>
							<p class="row">
								<label for="summary">摘要:</label>
								<textarea id="summary" name="summary"
									cols="40" rows="5" class="field-large">${detail.summary }</textarea>
							</p>
							<p class="row">
								<label for="contents">内容:</label>
								<textarea id="contents" name="contents"
									cols="40" rows="5" class="field-large">${detail.content }</textarea>
							</p>
							<p class="row">
								<label for="filename">上传图片:</label> 
								<input id="filename"
									name="filename" type="file" class="field-large" />
							</p>
						</div>
					</fieldset>
					<table style="width: 100%">
						<tr>
							<td style="text-align: center;" colspan="2">
								<button type="button" class="page-btn" name="save" onclick="updatenews();">保存</button>
								<button type="button" class="page-btn" name="return"
									onclick="javascript:location.href='admin'">返回
								</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!--底部-->
	<c:import url="include/adminBottom.jsp"></c:import>
</body>
</html>
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
<title>阅读新闻</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/handlebars-v4.0.11.js"></script>
<script type="text/javascript" src="js/handlerbarshelper.js"></script>
<script type="text/javascript" src="js/newsread.js"></script>
</head>
<script id="comments-template" type="text/x-handlebars-template">
{{#each this}}
<dl>
	<dt class="comment-top">
		<span class="fr">{{createDate}}</span>
		<b>{{addone @index}}楼</b> <b>{{author}}</b>
	</dt>
	<dd class="comment-body">{{content}}</dd>
</dl>
{{/each}}
</script>
<body>
	<!--页面顶部-->
	<c:import url="../include/indexTop.jsp"></c:import>
	<!--d页面主体-->
	<div id="content" class="main-content clearfix">
		<c:import url="../include/indexSidebar.jsp"></c:import>
		<!--页面主体的右部，包括新闻的列表和评论内容 -->
		<div class="main-content-right">
			<!--各专题的新闻列表-->
			<div class="main-text-box">
				<div class="article-box">
					<c:set var="detail" value="${requestScope.detail }"></c:set>
					<!--新闻的标题-->
					<h1>${detail.title }</h1>
					<div class="source-bar">
						发布者：${detail.author } 分类：新闻信息 更新时间：
						<fmt:formatDate value="${detail.modifyDate }"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
					<div class="article-content">
						<span class="article-summary"><b>摘要：</b> ${detail.summary }
						</span>
						<c:set var="picPath" value="${detail.picPath }"></c:set>
						<c:choose>
							<c:when test="${not empty  picPath}">
								<img class="image-responsive" alt="图片位置错误"
									src='${path }/upload/${picPath}'>
							</c:when>
							<c:otherwise>
								<span style="color:red;">没有图片</span>
							</c:otherwise>
						</c:choose>
						<p>${detail.content }</p>
					</div>
					<div class="comment">
						<c:set var="comments" value="${requestScope.comments }"></c:set>
						<c:forEach var="comment" items="${comments }" varStatus="status">
							<dl>
								<dt class="comment-top">
									<span class="fr"><fmt:formatDate
											value="${comment.createDate }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
									<b>${status.count }楼</b> <b>${comment.author }</b>
								</dt>
								<dd class="comment-body">${comment.content }</dd>
							</dl>
						</c:forEach>
					</div>
					<div class="comment-form">
						<form action="" method="post" id="frmcomment">
							<c:set var="username" value="${empty user?'匿名用户':user.userName }"></c:set>
							<input type="hidden" id="author" name="author" value="${username }">
							<input type="hidden" id="newsid" name="newsid" value="${detail.id }">
							<div class="comment-form-header">
								<span>用户：${username }</span>
								<h3>发表评论：</h3>
							</div>
							<div class="comment-form-content">
								<textarea name="contents" id="contents" class="comment-textarea"></textarea>
								<button type="button" class="comment-btn" onclick="sendComment();">评论</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../include/indexBottom.jsp"></c:import>
</body>
</html>
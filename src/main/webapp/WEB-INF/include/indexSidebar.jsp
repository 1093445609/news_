<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,org.news.entity.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script id="laest-template" type="text/x-handlebars-template">
{{#each this}}
	<li><a href='newsread?id={{id}}'>{{title}}</a></li>
{{/each}}
</script>
<!--主体的的左边部分-->
<div class="main-content-left">
	<!--新闻专题分类-->
	<div class="class-box">
		<div class="class-box-header">
			<span class="fr"><a href="#">更多...</a></span>
			<h3>新闻专题</h3>
		</div>
		<div class="class-box-content">
			<ul>
				<c:set var="categorys" value="${requestScope.categoryList }"></c:set>
				<c:forEach var="category" items="${categorys }" varStatus="status">
					<li
						<c:if test="${status.count==fn:length(categorys) }"> class='clear-bottom-line'</c:if>>
						<a href='javascript:choiceCategory(${category.id });'>${category.name }</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!--最新新闻-->
	<div class="left-box">
		<div class="left-box-header">
			<h3>最新新闻</h3>
		</div>
		<div class="left-box-content">
			<ul>
				<c:set var="detailLaestNews"
					value="${requestScope.detailLaestNews }"></c:set>
				<c:forEach var="detail" items="${detailLaestNews }">
					<li><a href='newsread?id=${detail.id }'>${detail.title }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!--最新评论-->
	<div class="left-box">
		<div class="left-box-header">
			<h3>最新评论</h3>
		</div>
		<div class="left-box-content">
			<ul>

				<c:set var="detailLaestComments"
					value="${requestScope.detailLaestComments }"></c:set>
				<c:forEach var="detail" items="${detailLaestComments }">
					<li><a href='newsread?id=${detail.id }'>${detail.title }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
<!--主体的的左边部分-->
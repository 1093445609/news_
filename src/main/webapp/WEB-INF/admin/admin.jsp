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
<meta charset="UTF-8">
<title>新闻管理</title>
<link type="text/css" rel="stylesheet" href="css/common.css" />
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/handlebars-v4.0.11.js"></script>
<script type="text/javascript" src="js/handlerbarshelper.js"></script>
<script type="text/javascript" src="js/admin.js"></script>
</head>
<script id="newsList-template" type="text/x-handlebars-template">
{{#each newsList}}
	{{#addspace @index 2}}
		<tr class='admin-list-td-h2'>
  {{else}}
		<tr>
	{{/addspace}}
	<td><a href='newsread?id={{id}}'>{{title}}</a></td>
	<td>{{author}}</td>
	<td>{{createDate}}</td>
	<td><a href='category?opt=updatenews&id={{id}}'>修改</a>&nbsp;
			<a href='javascript:void(0)' onclick="deleteNews({{id}},this);">删除</a>
  </td>
	</tr>
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
	<c:import url="include/adminTop.jsp"></c:import>
	<!--主体-->
	<div id="content" class="main-content clearfix">
		<c:import url="include/adminSidebar.jsp"></c:import>

		<div class="main-content-right">
			<!--即时新闻-->
			<c:set var="newspage" value="${requestScope.newspage }"></c:set>
			<c:set var="detailList" value="${newspage.newsList }"></c:set>
			<c:set var="categorys" value="${requestScope.categoryList }"></c:set>
			<div class="main-text-box">
				<form name="searchForm" id="searchForm" action="" method="post">
					<div>
						新闻分类： 
						<select name="categoryId" id="categoryId">
							<c:forEach var="category" items="${categorys }">
								<option  <c:if test="${category.id==newspage.id }">selected</c:if>
								value='${category.id }'>${category.name }</option>
							</c:forEach>
						</select>
						<button type="button" class="page-btn-small" onclick="choiceCategory();">GO</button>
						<button type="button" onclick="addNews();" class="page-btn-small">增加</button>
					</div>
				</form>
				<table class="admin-list">
					<thead>
						<tr class="admin-list-head">
							<th>新闻标题</th>
							<th>作者</th>
							<th>时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="detail" items="${detailList }" varStatus="status">
							<tr <c:if test="${status.index%2==0 }"> class='admin-list-td-h2'</c:if>>
								<td><a href='newsread?id=${detail.id }'>${detail.title }</a></td>
								<td>${detail.author }</td>
								<td>${detail.createDate }</td>
								<td><a href='category?opt=updatenews&id=${detail.id }'>修改</a>&nbsp;
									<a href='javascript:void(0)' onclick="deleteNews(${detail.id },this);">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
									href="javascript:getDetailList(${newspage.id },${newspage.currPageNo-1 });">上一页</a>
								</li>
							</c:if>

							<c:if test="${newspage.currPageNo < newspage.totalPageCount }">
								<li><a
									href="javascript:getDetailList(${newspage.id },${newspage.currPageNo+1 });">下一页</a>
								</li>
								<li><a
									href="javascript:getDetailList(${newspage.id },${newspage.totalPageCount});">最后一页</a>
								</li>
							</c:if>
						</ul>
						<span class="page-go-form"><label>跳转至</label> 
						<input type="text" id="currPageNo" name="currPageNo" class="page-key"
							value="${newspage.currPageNo }" />页 
							<input type="button" onclick="jump();"
							class="page-btn" value="GO" /> </span>
					</form>
				</div>
			</div>
		</div>
	</div>
	<c:import url="include/adminBottom.jsp"></c:import>
</body>
</html>
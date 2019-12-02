<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<!--页面顶部-->
<div id="header">
	<div class="main-top">
		<div class="logo">
			<a href=""><span>新闻大视野</span></a>
		</div>
	</div>
	<!--banner-->
	<div class="main-banner">
		<img src="images/banner.png" />
	</div>
	<!--管理工具栏-->
	<div class="admin-bar">
		<a class="fr" href="login?action=logout">退出账户</a> <a class="fr"
			href="index">返回首页</a> 管理员： 
			<c:set var="user" value="${sessionScope.user }"></c:set>
			<c:if test="${not empty user }">${user.userName }</c:if>
			<fmt:formatDate value="${now }" pattern="yyyy-MM-dd HH:mm:ss"/>
	</div>
</div>
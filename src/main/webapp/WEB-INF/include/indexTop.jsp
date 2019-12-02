<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="js/indextop.js"></script>
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
	<div class="login-box">
		<c:set var="user" value="${sessionScope.user }"></c:set>
		<c:choose>
			<c:when test="${empty user }">
				<form action="" method="post" id="frmlogin">
					<label>用户名</label> 
					<input type="text" name="username" id="username" value="王新宇"
						class="field-small" /><label>密码</label> 
					<input type="password" id="password"
						name="password" value="user" class="field-small" /> 
						<input	type="button" class="submit" value="登录" 
						onclick="login();">
				</form>
			</c:when>
			<c:otherwise>
				用户名:${user.userName }
				&nbsp;&nbsp;&nbsp;<a href="admin">管理界面</a>
				&nbsp;&nbsp;&nbsp;<a href="login?action=logout">注销</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<!--页面顶部-->
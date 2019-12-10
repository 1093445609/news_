
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" isErrorPage="true"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- isErrorPage的作用设置当前页面为错误页面，当在别的页面设置errorPage="error.jsp" 后，在设置页面出现问题后就自动会跳转到当前的错误页面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>错误页面</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	font-size: 12px;
}

a {
	color: #212121;
	text-decoration: none;
}

a:hover {
	color: #a605c1;
	text-decoration: underline;
}

#content {
	width: 766px;
	margin: 0 auto;
	background-color: #fafffd;
	border: 1px solid #dcdcdc;
}
</style>
</head>
<body>
	<div id="content">
		<br> <a href="javascript: history.back();">返回</a> <br>
		<h1>网页发生错误</h1>
		<%=exception%>
		<hr>
		<p>
		<h2>显示异常堆栈跟踪</h2>
		<%
			exception.printStackTrace(new PrintWriter(out));
		%>

	</div>
</body>
</html>

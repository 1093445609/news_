<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/3 0003
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/logins" method="post" id="frmlogin">
    <label>用户名</label>
    <input type="text" name="username" id="username" value="王新宇"
           class="field-small" /><label>密码</label>
    <input type="password" id="password"
           name="password" value="user" class="field-small" />
    <input	type=submit value="登录">
</form>
</body>
</html>

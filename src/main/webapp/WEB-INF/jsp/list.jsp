<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/2 0002
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <a:forEach items="${list}" var="c">
       名字 ${c.userName}
       密码 ${c.password}

    </a:forEach>

</body>
</html>

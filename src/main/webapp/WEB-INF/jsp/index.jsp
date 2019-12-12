<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/3 0003
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>首页</title>
    <%--js路径需要绝对路径 否则当后台跳转后找不到文件路径--%>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path + "/";
    %>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <%--<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
--%>


    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">新闻大视野</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <form id="searchFrom" class="navbar-form navbar-left">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">
                            <select name="categoryId" id="categoryId">
                                <option value="1">全部</option>
                                <option value="3">国际</option>
                                <option value="2">国内</option>
                                <option value="4">娱乐</option>
                                <option value="5">军事</option>
                                <option value="6">财经</option>
                                <option value="7">天气</option>

                            </select>
                        </a> <span class="caret"></span></a>


                    </li>
                </ul>

                <div class="form-group">
                    <%--搜索框--%>
                    <input type="text" class="form-control" placeholder="Search" id="searchContext" name="search">
                </div>
                <button type="submit" id="searchNews"   class="btn btn-success">搜索一下新闻</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <button id="login" class="login"> 登陆</button>
                </li>
                <li>
                    <button id="logout" class="logout"> 退出</button>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">help <span class="caret"></span></a>
                </li>

                <ul class="dropdown-menu">
                    <li><a href="#">发表评论需要登陆</a></li>
                    <li><a href="#">管理员界面需要权限</a></li>
                    <li><a href="#">游客只能看新闻</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="https://www.baidu.com" target="_blank">Separated link</a></li>
                </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container-fluid">
    <div class="row bg-info">
        <div class="col-sm-3 col-md-2 sidebar " style="background-color: #67b168">
            <ul class="nav nav-sidebar">
                <%--用户信息显示--%>
                <li class="active"><a href="#">
                    用户:<c:choose><c:when test="${ empty user.id}">欢迎路过的游客,您好</c:when>
                    <c:otherwise> ${user.userName},您好!</c:otherwise></c:choose>

                    <span class="sr-only">(current)</span></a></li>

                <c:forEach items="${categoryLists}" var="clist">
                    <li><a href="/?categoryId=${clist.id}"> ${clist.name} </a></li>
                </c:forEach>

            <ul class="nav nav-sidebar">
                <li><a href="#"> 管理系统</a></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>


            </ul>
        </div>

        <nav aria-label="Page navigation">
            <div style="height: 570px">
                <h2 align="center">新闻大视野<small>${news.type}</small></h2>


                <div class="panel panel-default">
                    <%--内容块--%>
                    <div id="content" class="panel-heading">
                    </div>

                        <c:if test="${!empty articleLists}">
                        <c:forEach items="${articleLists}" var="list" varStatus="i">
                            <p>
                                <a href="">${i.count} ${list.title} ${list.summary}&nbsp;&nbsp;&nbsp;<small> ${list.modifyDate}</small>
                                    &nbsp; &nbsp;&nbsp;&nbsp;${cid}</a></p>

                        </c:forEach>
                        </c:if>

                </div>
            </div>

            <!-- Table -->

        </nav>
    </div>
</div>
<%--分页--%>

</div>


</div>

<!--页面底部-->
<div class="container bg-success">
    <%--<p>这里是底部信息的标题</p>--%>
    <div class="row">
        <!-- 部分：一 -->
        <div class="col-md-4">
            <p> 24小时客户服务热线：</p>
            <div class="row">
                <div class="col-md-9">
                    <ul>
                        <li>010-68988888</li>
                        <li>常见问题解答 新闻热线：</li>
                        <li>010-627488888</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 部分：二 -->
        <div class="col-md-5">
            <p>文明办网文明上网举报电话：</p>
            <ul>
                <li>010-627488888</li>
                <li>举报邮箱：</li>
                <li>jubao@bj-aptech.com.cn</li>
            </ul>
        </div>
        <!-- 部分：三 -->
        <div class="col-md-3">
            <p>网站版权声明</p>
            <ul>
                <li>Coyright&copy;1999-2007 News China gov,All Right Reserved.</li>
                <li>新闻中心版权所有</li>
            </ul>
        </div>
    </div>

</div>


<%--当你点击登陆按钮 div内容改为登陆表单--%>
<script type="text/javascript">
    var divA = document.getElementById("content");
    $(document).ready(function () {

        $("#login").click(function () {
            if (${empty user.id}) {
                divA.innerHTML = '<form method="post" id="frmlogin">' +
                    ' <label>用户名</label>' +
                    ' <input type="text" name="username" id="username" value="王新宇"' +
                    ' class="field-small" /><label>密码</label>' +
                    ' <input type="password" id="password"' +
                    ' name="password" value="user" class="field-small" />' +
                    ' <input id="getLogin" type=button value="登录">' +
                    '</form>';
            } else {
                alert("您已经登陆!")

            }


        })



    })
    $(document).ready(function () {
        $("#logout").click(function () {
            if (${empty user}) {
                divA.innerHTML = '<p>您还没有登陆,不能退出<p>';
            } else {
                window.location.href = "/logout";
            }
        })
    })
</script>


</body>
<script> /* 判断登陆信息 动态生成的html绑定事件change*/
$(document).change(function () {
    var divA = document.getElementById("content")
    $("#getLogin").click(function () {
        var user = $("#username").val;
        var password = $("#password").val;
        if (user == "") {
            alert("用户名不可为空!");
        } else if (password == "") {
            alert("密码不可为空!");
        } else {
            /*ajax查询是否有cookie*/
            $.ajax({
                async: true,//同步，待请求完毕后再执行后面的代码
                type: "POST",
                url: '/logins',
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: $("#frmlogin").serialize(),
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    alert(data.code)
                    /*cookie失效或者啥问题?*/
                    if (data.code == 0) {
                        divA.innerHTML = '登陆失败!';
                    } else {
                        //divA.innerHTML = '欢迎登陆!';跳转了登陆所以不能显示
                        alert("登陆成功!");
                        window.location.href = "/";//跳转链接

                    }
                },
                error: function () {
                    alert("数据获取失败")
                }
            })


        }

    })
})
$("#searchNews").click(function () {
        window.location.href='/'


    })

</script>

</html>

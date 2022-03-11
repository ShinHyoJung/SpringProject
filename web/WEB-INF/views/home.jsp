<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-14
  Time: 오전 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>홈</title>

    <style>
        .navbar-right{
            background-color: lightgray;
        }

    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">홈</a>

        <div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
        
            </ul>
        </div>
    </div>
</nav>

<form class="navbar-form navbar-right" style="width:101%;">
    <div style="margin-left: 1500px;">
    <a class="btn btn-default navbar-btn" href="/Login">로그인</a>
    <a class="btn btn-default navbar-btn" href="/beforeSignup">회원가입</a>
    </div>
</form>
</body>
</html>

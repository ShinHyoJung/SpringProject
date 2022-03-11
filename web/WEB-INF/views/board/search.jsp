<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-02-23
  Time: 오후 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>작성자가 쓴글</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>

<div class="container-fluid">
    <a class="navbar-brand" href="/">홈</a>

    <div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li class="active"><a href="/list">게시판</a></li>
        </ul>

    </div>
</div>

<table class="table table-hover" style="width:70%; margin-left: 300px;" >
    <h1 style="margin-left: 300px;">${writer}</h1>
    <tr>
        <th>글번호</th>
        <th>제목</th>
        <th>작성날짜</th>
        <th>조회수</th>
    </tr>

    <c:forEach items="${result}" var="result">
        <tr>
            <td>${result.bno}</td>
            <td><a href="/read/${result.bno}" name="result.btitle"/>${result.btitle}</td>
            <td>${result.bupdatetime}</td>
            <td>${result.bhit}</td>
        </tr>
    </c:forEach>
</table>

<a href="/list" style="margin-left: 305px;">목록</a>
</body>
</html>

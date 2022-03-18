<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-02-23
  Time: 오후 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>작성자가 쓴글</title>

    <link rel="stylesheet" href="<c:url value="/css/background.css"/>" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body class="background">

<nav class="navbar navbar-default"  style="background-color: ghostwhite; border: 0; max-width: 800px; margin: 25px auto;">
    <a class="navbar-brand" style="color: thistle">Board</a>

    <div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav" style="float:right;">
            <li class="active"><a class = "nav-menu" href="/" >홈</a></li>
            <sec:authorize access="isAuthenticated()">
                <li class="active"><a class = "nav-menu" href="/list"> 게시판 </a></li>
                <div class="nav-underline"></div>
            </sec:authorize>
        </ul>
    </div>
    </div>
</nav>

<table class="table table-hover" style="width:50%; margin-left: 450px; margin-top: 70px;" >
    <h2 style="margin-left: 600px; margin-top: 50px; display: inline-block;">${writer}</h2>
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

<a href="/list" class="btn btn-primary" style="margin-left: 1300px;">목록</a>
</body>
</html>

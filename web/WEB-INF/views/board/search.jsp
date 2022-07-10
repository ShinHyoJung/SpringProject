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
</head>
<body class="background">

<jsp:include page="/static/header.jsp"/>

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

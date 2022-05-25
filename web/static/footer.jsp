<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-05-25
  Time: 오전 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value="/css/background.css"/>" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<form class="navbar-form navbar-right" style="display: block; width:100%;">
    <div style="text-align: right; max-width: 1000px; margin: 0 auto;">
        <sec:authorize access="isAnonymous()">
            <a class="btn btn-default navbar-btn" href="/Login">로그인</a>
            <a class="btn btn-default navbar-btn" href="/beforeSignup">회원가입</a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <button class = "btn btn-default navbar-btn" type="button" onclick="Logout()">로그아웃</button>
            <a id="logout" href="/Logout"></a>
            <a class="btn btn-default navbar-btn" href="/Info">회원정보</a>
        </sec:authorize>
    </div>
</form>
</body>
</html>

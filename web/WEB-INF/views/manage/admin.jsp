<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-03-20
  Time: 오전 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>관리자 페이지</title>

    <link rel="stylesheet" href="<c:url value="/css/background.css"/>" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body class="background">

<jsp:include page="/static/header.jsp"/>

<p style="font-size: 70px; margin-left: 700px; margin-top: 100px;">관리자 페이지</p>

<a style="margin-left: 600px; margin-top: 200px;" href="/">뒤로가기</a>
</body>
</html>

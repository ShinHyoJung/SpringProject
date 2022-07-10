<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-14
  Time: 오전 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content = "width=device-width, initial-scale=1.0">
    <title>홈</title>

    <style>
        .navbar-right{
            background-color: thistle;
        }
        .navbar-default .navbar-nav .active a.nav-menu {
            background-color: transparent;
            background-color: ghostwhite;
        }
        .navbar-default .navbar-nav .active a.nav-menu:hover {
            background-color: transparent;
            background-color: ghostwhite;
        }
        .nav-menu {
            font-size: 15px;
            color: black;
            text-decoration: none;
            position: relative;
            padding: 6px 12px;
            background-color: ghostwhite;
        }

        .nav-menu::after {
            content:"";
            position:absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 4px;
            background: thistle;
            transition: all .5s ease-out;
        }

        .nav-menu:hover::after {
            width:100%;
        }

        .background {
            background-color: ghostwhite;
        }

        .navbar-form .navbar-right {
            display: block;
            width:100%;
        }
    </style>
    <link rel="stylesheet" href="<c:url value="/css/background.css"/>" >
</head>
<body class="background" style="background-color: ghostwhite;">

<jsp:include page="/static/header.jsp"/>
<main style="max-width: 800px; margin: 0 auto; min-height: 400px;">
    <div class="inner cover" style="margin-top: 280px;">
        <sec:authorize access="isAuthenticated()">
            <p style="font-size: 20px;">
                <sec:authentication property="principal.username"/> 님 환영합니다.
            </p>
        </sec:authorize>
        <h1 class="cover-heading">페이지</h1>
        <p class="lead">자유롭게 글을 쓰고, 댓글로 의견을 표현하세요.</p>
    </div>
<a href="/qrCode">QrCode</a>
</main>
<jsp:include page="/static/footer.jsp"/>
<script>

    function Logout() {

        if(confirm("로그아웃하시겠습니까?")) {
            logout.click();
        } else {
        }

    }

</script>


</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-14
  Time: 오전 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
        }
        .navbar-default .navbar-nav .active a.nav-menu:hover {
            background-color: transparent;
        }
        .nav-menu {
            font-size: 15px;
            color: black;
            text-decoration: none;
            position: relative;
            padding: 6px 12px;
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

    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body style="background-color: ghostwhite; ">
<nav class="navbar navbar-default"  style="background-color: ghostwhite; border: 0; max-width: 800px; margin: 25px auto;">
        <a class="navbar-brand" style="color: thistle">Board</a>

        <div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" style="float:right;">
                    <li class="active"><a class = "nav-menu" href="/" >홈</a></li>
                <c:if test="${not empty sessionScope.idx}">
                    <li class="active"><a class = "nav-menu" href="/list" style=""> 게시판 </a></li>
                    <div class="nav-underline"></div>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
<main style="max-width: 800px; margin: 0 auto; min-height: 500px;">
    <div class="inner cover" style="margin-top: 300px;">
        <h1 class="cover-heading">페이지</h1>
        <p class="lead">자유롭게 글을 쓰고, 댓글로 의견을 표현하세요.</p>

    </div>

</main>
<form class="navbar-form navbar-right" style="display: block; width:100%;">
    <div style="text-align: right; max-width: 1000px; margin: 0 auto;">
        <c:choose>
            <c:when test="${empty sessionScope.idx}">
                <a class="btn btn-default navbar-btn" href="/Login">로그인</a>
                <a class="btn btn-default navbar-btn" href="/beforeSignup">회원가입</a>
            </c:when>
            <c:otherwise>
                <button class = "btn btn-default navbar-btn" type="button" onclick="Logout()">로그아웃</button>
                <a id="logout" href="/Logout"></a>
                <a class="btn btn-default navbar-btn" href="/info">회원정보</a>
            </c:otherwise>
        </c:choose>
    </div>
</form>
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
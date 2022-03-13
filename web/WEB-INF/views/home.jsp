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
    <title>홈</title>

    <style>
        .navbar-right{
            background-color: lightgray;
        }

        nav {
            position: relative;
            display: flex;
        }
        nav a {
            display: block;
            width: 20%;
            padding: .75em 0;
            color: #333;
            text-decoration: none;
            text-align: center;
        }
        .nav-underline {
            position: absolute;
            left: 0;
            bottom: -2px;
            width: 10%;
            height: 2px;
            background: #333;
            transition: all .3s ease-in-out;
        }

    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid ">
        <a class="navbar-brand" href="/">홈</a>

        <div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <c:if test="${not empty sessionScope.idx}">
                    <li class="active"><a href="/list">게시판</a></li>
                    <div class="nav-underline"></div>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<form class="navbar-form navbar-right" style="width:101%;">
    <div style="margin-left: 1500px;">
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
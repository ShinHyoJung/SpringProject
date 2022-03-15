<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-03-14
  Time: 오후 3:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>아이디찾기</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<h2 style="margin-left: 650px; margin-top: 50px;">이름과 전화번호를 입력해주세요.</h2>

        <form method="post" action="/findId" style="max-width: 300px; margin-left: 700px; margin-top: 200px;">
            <label for="name">이름</label>
            <input class="form-control" type="text" id="name" name="name"/>
            <label for="email">이메일</label>
            <input class="form-control" type="text" id="email" name="email"/>
            <button type="submit" class="btn btn-default" value="check">아이디찾기</button>
        </form>

        <c:if test="${check==1}">
            <label style="margin-left: 750px;">일치하는정보가 없습니다.</label>
        </c:if>

        <c:if test="${check==0}">
            <label style="margin-left:750px;">찾으시는 아이디는 ${username} 입니다.</label>
        </c:if>
<br>
<br>
<a href="/" style="margin-left: 700px;" >뒤로가기</a>
</body>
</html>

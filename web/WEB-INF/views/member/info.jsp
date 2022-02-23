<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-16
  Time: 오후 2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원정보</title>
</head>
<body>
<h1>회원정보</h1>

<form action="/updateInfo" method="post">
    아이디 <input name="id" value="${user.id}" readonly="readonly"> <br><br>
    비밀번호 <input type="password" name="password"><br><br>
    이름 <input name="name" value="${user.name}"><br><br>
    닉네임<input name="nickname" value="${user.nickname}"><br><br>
    전화번호 <input name="pnum" value="${user.pnum}"><br><br>
    주소 <input name="address" value="${user.address}"><br><br>
    <button type="submit">수정 </button>
</form>

<a href="/Logout">로그아웃</a>
<a href="/quitSignup">회원탈퇴</a>
<a href="/list">목록</a>
</body>
</html>

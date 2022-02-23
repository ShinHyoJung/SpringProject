<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-14
  Time: 오후 2:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
</head>

<body>
<h1>회원 가입</h1>
    <form action="/Signup" method="post" >
        <input type="text" name="id" placeholder="아이디"> <br> <br>
        <input type="text" name="password" placeholder="비밀번호"> <br><br>
        <input type="text" name="name" placeholder="이름"> <br><br>
        <input type="text" name="nickname" placeholder="닉네임"> <br><br>
        <input type="text" name="pnum" placeholder="전화번호"> <br> <br>
        <input type="text" name="address" placeholder="주소"> <br> <br>
        <button type="submit">가입하기</button>
    </form>
</body>
</html>

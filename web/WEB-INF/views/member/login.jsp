<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-14
  Time: 오후 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
</head>
<body>
    <h1>로그인</h1>

    <form action="/doLogin" method="post">
        <input type="text" name="id" placeholder="아이디"/> <br><br>
        <input type="password" name="password" placeholder="비밀번호"/> <br>
        <button type="submit">로그인</button>
    </form>
</body>
</html>

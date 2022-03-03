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

    <form name="loginForm" action="/doLogin" method="post">
        <input type="text" id="id" name="id" placeholder="아이디"/> <br><br>
        <input type="password" name="password" onkeyup="enterLogin()" placeholder="비밀번호"/> <br>
        <button type="button"  onclick="loginChk()">로그인</button>
    </form>

    <a href="/">홈으로</a>

<script>
    var form = document.loginForm;


    function enterLogin() { //로그인 버튼 키이벤트
        if(window.event.keyCode == 13) {
            loginChk();
        }
    }

    function loginChk() { // 로그인 유효성 검사

        if(!form.id.value) {
            alert("아이디를 입력해주세요.");
            form.id.focus();
            return;
        }
        else if(!form.password.value) {
            alert("비밀번호를 입력해주세요.");
            form.password.focus();
            return;
        }
        else {
            form.submit();
        }
    }

</script>
</body>
</html>

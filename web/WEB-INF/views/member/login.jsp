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

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">홈</a>

        <div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/list">게시판</a></li>
            </ul>
        </div>
    </div>
</nav>

    <form class="form-horizontal"  style="width:50%; margin-left: 600px;"name="loginForm" action="/doLogin" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <h1 style="margin-left: 200px;">로그인</h1>
        <div class="form-group">
            <label for="username" class="col-sm-2 control-label">아이디</label>
            <div class="col-sm-10">
            <input id="username" class="form-control" style="width:30%;" type="text"  name="username" placeholder="아이디를 입력해주세요."/>
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label">비밀번호</label>
            <div class="col-sm-10">
            <input id="password" class="form-control" style="width:30%;" type="password" name="password" onkeyup="enterLogin()" placeholder="비밀번호를 입력해주세요."/> <br>
            </div>
        </div>
        <div class="form -group">
        <button class="btn btn-default" style="margin-left: 230px;" type="button"  onclick="loginChk()">로그인</button>
        </div>
    </form>

    <a href="/" style="margin-left: 700px;">홈으로</a>

<script>
    var form = document.loginForm;


    function enterLogin() { //로그인 버튼 키이벤트
        if(window.event.keyCode == 13) {
            loginChk();
        }
    }

    function loginChk() { // 로그인 유효성 검사

        if(!form.username.value) {
            alert("아이디를 입력해주세요.");
            form.username.focus();
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

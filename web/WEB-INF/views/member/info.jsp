<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-16
  Time: 오후 2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>회원정보</title>
    <link rel="stylesheet" href="<c:url value="/css/background.css"/>">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<body class="background">
<nav class="navbar navbar-default"  style="background-color: ghostwhite; border: 0; max-width: 800px; margin: 25px auto;">
    <a class="navbar-brand" style="color: thistle">Board</a>

    <div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav" style="float:right;">
            <li class="active"><a class = "nav-menu" href="/" >홈</a></li>
            <sec:authorize access="isAuthenticated()">
                <li class="active"><a class = "nav-menu" href="/list"> 게시판 </a></li>
                <div class="nav-underline"></div>
            </sec:authorize>
        </ul>
    </div>
    </div>
</nav>

<form name="updateForm" style="width: 20%; margin-left: 700px; margin-top: 100px;" action="/updateInfo" method="post">
    <h1>회원정보</h1>
    <div class="form-group">
        <label for="id">아이디</label>
        <input id= "id" class="form-control" name="id" value="${user.id}" readonly="readonly">
    </div>
    <div class="form-group">
        <label for="password">비밀번호</label>
        <input id="password" class="form-control" name="password" type="password" >
        <label for="password_confirm">비밀번호 확인</label>
        <input id="password_confirm" type="password" class="form-control" name="password_confirm" placeholder="비밀번호 확인"/> <br>
    </div>
    <div class="form-group">
        <label for="name">이름</label>
        <input id="name" class="form-control" name="name" value="${user.name}">
    </div>
    <br>
    <div class="form-group">
        <label for="nickname">닉네임</label>
        <input id = "nickname" type="text" class="form-control" style="width:50%;display: inline-block;" name="nickname" value="${user.nickname}" required oninput="checkNickname()">
        <span class="nickname_ok" style="display:none;">사용가능한 닉네임입니다.</span>
        <span class="nickname_already" style="display: none;">중복된 닉네임입니다.</span>
    </div>
    <div class="form-group">
        <label for="pnum">전화번호</label>
        <input id="pnum" class="form-control" name="pnum" value="${user.pnum}">
    </div>
    <div class="form-group">
        <label for="email">이메일주소</label>
        <input id = "email" class="form-control" name="email" value="${user.email}" style="display: inline-block;">
        <button class="btn btn-default" style="margin-left: 289px;" type="button" onclick="authEmail()">이메일인증</button>
    </div>
    <input type="hidden" name = "idx" value="${user.idx}">
    <button class= "btn btn-default" type="button" onclick="update()">수정 </button>
</form>

<form name="emailForm" action="/authEmail" method="post">
    <input type="hidden" id="auth_email" name="email" value="">
    <input type="hidden" id="auth_name" name="name" value="${user.name}">
    <input type="hidden" id = "idx" name="idx" value ="${user.idx}">
</form>

<a id= "quit" href="/quitSignup"></a>
<button class = "btn btn-primary" style="margin-left: 1000px;" type="button" onclick="quitSignup()">회원탈퇴</button>

<script>

    var form = document.updateForm;
    var re1 = /^[a-zA-z0-9]{4,12}$/;
    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식
    var reg = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    var check_nickname;

    function checkNickname() {

        const nickname = document.getElementById("nickname").value;

            $.ajax({
                method: "post",
                url: "/checkNickname",
                data: {nickname: nickname},
                dataType: "json",
                success: function (data) {
                    if (data == 0) {
                        $('.nickname_ok').css("display", "block");
                        $('.nickname_already').css("display", "none");
                    } else {
                        check_nickname = -1;
                        $('.nickname_already').css("display", "block");
                        $('.nickname_ok').css("display", "none");
                    }
                }
            });


    }

    function update() {

        form.password.value = form.password.value.trim();
        form.name.value = form.name.value.trim();
        form.nickname.value = form.nickname.value.trim();
        form.pnum.value = form.pnum.value.trim();

        var pw = document.getElementById("password");
        var cpw = document.getElementById("password_confirm");
        var pnum = document.getElementById("pnum");

        if (form.password.value) {

            if (!re1.test(pw.value)) {
                alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다.");
                form.password.focus();
                return false;
            }

            if (pw.value != cpw.value) {
                alert("비밀번호가 다릅니다.");
                form.password.focus();
                return false;
            }

            if (!reg.test(pnum.value)) {
                alert("전화번호는 숫자로만 입력해야 합니다.");
                form.pnum.focus();
                return false;
            }

            if(check_nickname == -1) {
                alert("닉네임을 변경해주세요.");
                form.nickname.focus();
                return false;
            }

            if (confirm("수정하시겠습니까?")) {
                form.submit();
                alert("수정되었습니다.");
            } else {
            }
        } else {
            alert("비밀번호를 입력해주세요.");
        }
    }

    function quitSignup() {

        if(confirm("탈퇴하시겠습니까?")) {
            quit.click();
            alert("탈퇴되었습니다.");
        }else{
        }

    }

    function authEmail() {
        var form = document.emailForm;
        const email = document.getElementById("email").value;

        $.ajax({
            method: "post",
            url: "/checkEmail",
            data: {email: email},
            dataType: "json",
            success: function (data) {
                if (data == 0) {
                    document.getElementById("auth_email").value = document.getElementById("email").value;
                    form.submit();
                } else {
                    alert("중복된 이메일이 있습니다.");
                }
            }
        });

    }
</script>
</body>
</html>

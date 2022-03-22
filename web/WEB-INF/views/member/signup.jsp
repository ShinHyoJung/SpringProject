<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-14
  Time: 오후 2:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="<c:url value="/css/background.css"/>">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>

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

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <form name="signupForm" style="width:50%; margin-left: 700px;" action="/Signup" method="post" >
        <h1 style="margin-left: 145px;">회원 가입</h1> <br>
        <div class="form-group">
            <label for="id">아이디</label>
            <input id="before_id" class="form-control" style="width:30%; display: inline-block;" type="text" name="before_id" placeholder="아이디를 입력해주세요."/>
            <button class="btn btn-default" type="button" id="check_id" onclick="checkId()" value=0>아이디 중복체크</button>
            <input type="hidden" name="id" id="id">
        </div>
        <br>
        <div class="form-group" >
            <label for="password">비밀번호</label>
            <input id= "password" type="password" class="form-control" style="width:50%;" name="password" placeholder="비밀번호를 입력해주세요."/> <br>
        </div>
        <div>
            <label for="password_confirm">비밀번호 확인</label>
            <input id="password_confirm" type="password" class="form-control" style="width:50%;" name="password_confirm" placeholder="비밀번호 확인"/> <br>
        </div>
        <div class="form-group">
            <label for="name">이름</label>
            <input id= "name" type="text" class="form-control" style="width:50%;" name="name" placeholder="이름을 입력해주세요."/>
        </div>    <br>
        <div class="form-group">
            <label for="before_nickname">닉네임</label>
            <input id= "before_nickname" type="text" class="form-control" style="width:30%; display: inline-block;" name="before_nickname" placeholder="닉네임을 입력해주세요."/>
            <button class="btn btn-default" type="button" id="check_nickname" onclick="checkNickname()" value=0>닉네임 중복체크</button>
            <input type="hidden" name="nickname" id="nickname">
        </div> <br>
        <div class="form-group">
            <label for="pnum">전화번호</label>
            <input id="pnum" type="text" class="form-control" style="width:50%;" name="pnum" placeholder="전화번호를 입력해주세요."/> <br>
        </div>
        <div class="form-group">
            <label for="email">이메일</label>
            <input id="email" type="text" class= "form-control" style="width:50%;" name="email" placeholder="이메일을 입력해주세요."/>
        </div>    <br>
        <div class="form-group">
        <button class="btn btn-default" type="button" onclick="signUp()">가입하기</button>
        </div>
    </form>

<a href="/" style="margin-left: 1140px;">홈으로</a>
<script>

    var form = document.signupForm;
    let signupCheck = 0;

    var re1 = /^[a-zA-z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식

    var reg = /^[0-9]+/g; // 숫자만 입력하도록하는 정규식

    function checkValid() { // 비밀번호, 이름, 전화번호, 이메일 유효성 체크

        form.password.value = form.password.value.trim();
        form.name.value = form.name.value.trim();
        form.pnum.value = form.pnum.value.trim();
        form.email.value = form.email.value.trim();

        if(!form.password.value && !form.name.value && !form.pnum.value && !form.email.value) {
            alert("정보를 입력해주세요.");
            return false;
        }else if(!form.password.value) {
            alert("비밀번호를 입력해주세요.");
            return false;
        } else if(!form.name.value) {
            alert("이름을 입력해주세요.");
            return false;
        } else if(!form.pnum.value) {
            alert("전화번호를 입력해주세요.");
            return false;
        } else if(!form.email.value) {
            alert("이메일을 입력해주세요.");
            return false;
        } else if (form.password.value&& form.name.value&&form.pnum.value && form.email.value) {

            var pw = document.getElementById("password");
            var cpw = document.getElementById("password_confirm");
            var email = document.getElementById("email");
            var pnum = document.getElementById("pnum");


            if (!re1.test(pw.value)) {
                alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다.");
                form.password.focus();
                return false;
            }
            else if (pw.value !== cpw.value) {
                alert("비밀번호가 서로 다릅니다. 다시 확인해 주세요.");
                form.password_confirm.value = "";
                form.password_confirm.focus();
                return false;
            }
            else if(!re2.test(email.value)) {
                alert("이메일형식이 맞지 않습니다.");
                form.before_email.focus();
                return false;
            }
            else if (!reg.test(pnum.value)) {
                alert("전화번호형식이 맞지 않습니다.");
                form.pnum.focus();
                return false;
            }
            else {
                signupCheck = 1;
            }
        }
    }

    // 아이디 중복체크, 유효성검사
    function checkId() {

        form.before_id.value = form.before_id.value.trim();
        const before_id = document.getElementById("before_id").value;

        if(!form.before_id.value) {
            alert("아이디를 입력해주세요.");
            form.before_id.focus();
            return false;
        } else {

            if (!re1.test(before_id)) {
                alert("아이디는 영문자+숫자 조합으로 4~8자리 사용해야 합니다.");
                form.before_id.focus();
                return false;
            }
        }

        $.ajax({
                method: "post",
                url: "/checkId",
                data: {id: before_id},
                dataType: "json",
                success: function (data) {
                    if (data == 0) {

                        document.getElementById("check_id").setAttribute("value", 1);
                        document.getElementById("id").value = document.getElementById("before_id").value;
                        document.getElementById("before_id").disabled = true;
                        alert("사용가능한 아이디입니다.");

                    } else {
                        alert("중복된 아이디입니다.");
                    }
                }
            });
    }

    // 닉네임중복, 유효성 검사
    function checkNickname() {
        form.before_nickname.value = form.before_nickname.value.trim();

        const before_nickname = document.getElementById("before_nickname").value;

        if(!form.before_nickname.value) {
            alert("닉네임을 입력해주세요.");
            form.before_nickname.focus();
            return false;
        } else {

            $.ajax({
                method: "post",
                url: "/checkNickname",
                data: {nickname: before_nickname},
                dataType: "json",
                success: function (data) {
                    if (data == 0) {
                        alert("사용가능한 닉네임입니다.");
                        document.getElementById("check_nickname").setAttribute("value", 1);
                        document.getElementById("nickname").value = document.getElementById("before_nickname").value;
                        document.getElementById("before_nickname").disabled = true;
                    } else {
                        alert("중복된 닉네임입니다.");
                    }
                }
            });

        }

    }

    // 이메일 중복체크 
    function signUp() {

        if(confirm("이 정보로 가입하시겠습니까?")) {
            checkValid();

            var email = form.email.value;

            $.ajax({
                method: "post",
                url: "/checkEmail",
                data: {email: email},
                dataType: "json",
                success: function (data) {
                    if (data == 1) {
                        alert("이미 존재하는 이메일 입니다.")
                    } else if (data == 0) {
                        checkAll();
                    }
                }
            })
        } else {

        }
    }

    // 회원가입 진행
    function checkAll() {
        const check_id = document.getElementById("check_id").value; //
        const check_nickname = document.getElementById("check_nickname").value;
        // 공백제거

        if (signupCheck == 1 && check_id == 1 && check_nickname == 1) {
            form.submit();
            alert("가입이 완료되었습니다. 이메일 인증후 게시판 사용이 가능합니다.");
        } else if (signupCheck == 1 && check_id != 1 && check_nickname == 1) {
            alert("아이디 중복체크를 해주세요.");
            form.before_id.focus();
            return false;
        } else if (signupCheck == 1 && check_id == 1 && check_nickname != 1) {
            alert("닉네임 중복체크를 해주세요.");
            form.before_nickname.focus();
            return false;
        } else if (signupCheck == 0 && check_id == 0 && check_nickname == 0) {

            return false;
        } else if (signupCheck == 0 && check_id == 1 && check_nickname == 1) {

            return false;
        }
    }

</script>
</body>
</html>

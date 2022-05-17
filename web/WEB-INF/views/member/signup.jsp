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
            <input id="id" class="form-control" style="width:30%;" type="text" name="id" placeholder="아이디를 입력해주세요." required oninput="checkId()"/>
            <span class="id_ok" style="display: none;"> 사용가능한 아이디입니다.</span>
            <span class="id_already" style="display: none;">중복된 아이디입니다.</span>
            <span class="id_valid" style="display: none;">아이디는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다.</span>
        </div>
        <br>
        <div class="form-group">
            <label for="name">이름</label>
            <input id= "name" type="text" class="form-control" style="width:30%;" name="name" placeholder="이름을 입력해주세요."/> <br>
        </div>
        <div class="form-group">
            <label for="nickname">닉네임</label>
            <input id= "nickname" type="text" class="form-control" style="width:30%;" name="nickname" placeholder="닉네임을 입력해주세요." required oninput="checkNickname()"/>
            <span class="nickname_ok" style="display: none;">사용가능한 닉네임입니다.</span>
            <span class="nickname_already" style="display: none;">중복된 닉네임입니다.</span>
        </div> <br>
        <div class="form-group" >
            <label for="password">비밀번호</label>
            <input id= "password" type="password" class="form-control" style="width:40%;" name="password" placeholder="비밀번호를 입력해주세요."/>
        </div>
        <div>
            <label for="password_confirm">비밀번호 확인</label>
            <input id="password_confirm" type="password" class="form-control" style="width:40%;" name="password_confirm" placeholder="비밀번호 확인"/> <br>
        </div>
        <br>

        <div class="form-group">
            <label for="pnum">전화번호</label>
            <input id="pnum" type="text" class="form-control" style="width:50%;" name="pnum" placeholder="전화번호를 입력해주세요."/> <br>
        </div>
        <div class="form-group">
            <label for="email">이메일</label>
            <input id="email" type="text" class= "form-control" style="width:50%;" name="email" placeholder="이메일을 입력해주세요." required oninput="checkEmail()"/>
            <span class="email_ok" style="display: none;">사용가능한 이메일 입니다.</span>
            <span class="email_already" style="display: none;">중복된 이메일 입니다.</span>
        </div>
        <div class="form-group">
        <button class="btn btn-default" type="button" onclick="signUp()">가입하기</button>
        </div>
    </form>

    <input type="hidden" id="check_id">
    <input type="hidden" id="check_email">
    <input type="hidden" id="check_nickname">

<a href="/" style="margin-left: 1140px;">홈으로</a>
<script>

    var form = document.signupForm;
    let Check = 0;

    var re1 = /^[a-zA-z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식

    var reg = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/; // 숫자만 입력하도록하는 정규식

    function checkValid() { // 비밀번호, 이름, 전화번호, 이메일 유효성 체크

        form.id.value = form.id.value.trim();
        form.password.value = form.password.value.trim();
        form.name.value = form.name.value.trim();
        form.pnum.value = form.pnum.value.trim();
        form.email.value = form.email.value.trim();

        var id = document.getElementById("id");
        var pw = document.getElementById("password");
        var cpw = document.getElementById("password_confirm");
        var pnum = document.getElementById("pnum");
        var email = document.getElementById("email");


        if(!form.id.value && !form.password.value && !form.name.value && !form.pnum.value && !form.email.value) {
            alert("정보를 입력해주세요.");
            return false; // 아래코드부터 아무것도 진행하지 말 것
        }

        if(!form.id.value) {
            alert("아이디를 입력해주세요.");
            return false;
        }

        if(!form.password.value) {
            alert("비밀번호를 입력해주세요.");
            return false;
        }

        if(!form.name.value) {
            alert("이름을 입력해주세요.");
            return false;
        }

        if(!form.nickname.value) {
            alert("닉네임을 입력해주세요.");
            return false;
        }

        if(!form.pnum.value) {
            alert("전화번호를 입력해주세요.");
            return false;
        }

        if(!form.email.value) {
            alert("이메일을 입력해주세요.");
            return false;
        }

        if (!re1.test(pw.value)) {
            alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다.");
            form.password.focus();
            return false;
        }

        if (pw.value !== cpw.value) {
            alert("비밀번호가 서로 다릅니다. 다시 확인해 주세요.");
            form.password_confirm.value = "";
            form.password_confirm.focus();
            return false;
        }

        if (!reg.test(pnum.value)) {
            alert(pnum.value);
            alert("전화번호형식이 맞지 않습니다.");
            form.pnum.focus();
            return false;
        }

        if(!re2.test(email.value)) {
            alert("이메일형식이 맞지 않습니다.");
            form.email.focus();
            return false;
        }

        Check=1;
    }

    // 아이디 중복체크, 유효성검사
    function checkId() {

        const id = document.getElementById("id").value;

        $.ajax({
                method: "post",
                url: "/checkId",
                data: {id: id},
                dataType: "json",
                success: function (data) {

                    if(!re1.test(id)) {
                        $('.id_valid').css("display","block");
                        form.id.focus();
                        return false;
                    }else {
                        $('.id_valid').css("display","none");
                    }

                    if (data == 0) {
                        $('.id_ok').css("display","block");
                        $('.id_already').css("display", "none");
                    } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                        $('.id_already').css("display","block");
                        $('.id_ok').css("display", "none");

                    }
                }
            });
    }

    // 닉네임중복, 유효성 검사
    function checkNickname() {
        form.nickname.value = form.nickname.value.trim();

        const nickname = document.getElementById("nickname").value;

        if(!form.nickname.value) {
            alert("닉네임을 입력해주세요.");
            form.nickname.focus();
            return false;
        } else {

            $.ajax({
                method: "post",
                url: "/checkNickname",
                data: {nickname: nickname},
                dataType: "json",
                success: function (data) {

                    if (data == 0) {
                        $('.nickname_ok').css("display", "block");
                        $('.nickname_already').css("display", "none");
                    } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                        $('.nickname_already').css("display", "block");
                        $('.nickname_ok').css("display", "none");
                    }
                }
            });

        }

    }

    // 이메일 중복체크 및 회원가입 진행
    function checkEmail() {

        const email = form.email.value;

            $.ajax({
                method: "post",
                url: "/checkEmail",
                data: {email: email},
                dataType: "json",
                success: function (data) {

                    if (data == 0) {
                        $('.email_ok').css("display", "block");
                        $('.email_already').css("display", "none");
                    } else {
                        $('.email_already').css("display", "block");
                        $('.email_ok').css("display", "none");
                    }
                }
            })
    }

    function check() {

        const id = document.getElementById("id").value;
        const nickname = document.getElementById("nickname").value;
        const email = form.email.value;

     $.ajax({
            method: "post",
            url: "/checkId",
            data: {id: id},
            dataType: "json",
            async: false,
            success: function (data) {
              document.getElementById("check_id").value = data;
            }
        });

     $.ajax({
            method: "post",
            url: "/checkEmail",
            data: {email: email},
            dataType: "json",
            async: false,
            success: function (data) {
              document.getElementById("check_email").value = data;
            }
        });

     $.ajax({
            method: "post",
            url: "/checkNickname",
            data: {nickname: nickname},
            dataType: "json",
            async: false,
            success: function (data) {
                document.getElementById("check_nickname").value = data;
            }
        });

    }

    // 유효성 총 검사
    function signUp() {
        // 공백제거
        check();

        if(confirm("이 정보로 가입하시겠습니까?")) {

            checkValid();

            if(document.getElementById("check_id").value != 0) {
                alert("아이디가 중복되었습니다.");
                form.id.focus();
            }

            if(document.getElementById("check_email").value != 0) {
                alert("이메일이 중복되었습니다.");
                form.email.focus();
            }

            if(document.getElementById("check_nickname").value != 0) {
                alert("닉네임이 중복되었습니다.");
                form.nickname.focus();
            }

            if (Check==1 && document.getElementById("check_id").value == 0 && document.getElementById("check_email").value ==0 && document.getElementById("check_nickname").value ==0) {
                form.submit();
                alert("가입이 완료되었습니다. 이메일 인증후 게시판 사용이 가능합니다.");
            }

        } else {
        }
    }

</script>
</body>
</html>

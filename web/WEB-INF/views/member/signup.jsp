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
        <h1>회원 가입</h1> <br>
        <div class="form-group">
            <label for="id">아이디</label>
            <input id="id" class="form-control" style="width:30%;" type="text" name="id" placeholder="아이디를 입력해주세요."/> <button class="btn btn-default" type="button" id="check" onclick="idCheck()" value=0>아이디 중복체크</button>
        </div><br>
        <div class="form-group" >
            <label for="password">비밀번호</label>
            <input id= "password" type="text" class="form-control" style="width:50%;" name="password" placeholder="비밀번호를 입력해주세요."/> <br><br>
        </div>
        <div class="form-group">
            <label for="name">이름</label>
            <input id= "name" type="text" class="form-control" style="width:50%;" name="name" placeholder="이름을 입력해주세요."/>
        </div>    <br>
        <div class="form-group">
            <label for="nickname">닉네임</label>
            <input id= "nickname" type="text" class="form-control" style="width:50%;" name="nickname" placeholder="닉네임을 입력해주세요."/>
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

<a href="/" style="margin-left: 700px;">홈으로</a>
<script>

    var form = document.signupForm;
    let signupCheck = 0;


    //정보입력 유효성 체크
    function infoCheck() {

        if(!form.id.value && !form.password.value && !form.name.value && !form.nickname.value && !form.pnum.value && !form.email.value) {
            alert("정보를 입력해주세요.");
        } else if(!form.password.value) {
            alert("비밀번호를 입력해주세요.");
        } else if(!form.name.value) {
            alert("이름을 입력해주세요.");
        } else if(!form.nickname.value) {
            alert("닉네임을 입력해주세요.");
        } else if(!form.pnum.value) {
            alert("전화번호를 입력해주세요.");
        } else if(!form.email.value) {
            alert("이메일을 입력해주세요.");
        } else if (!form.id.value) {
            alert("아이디를 입력해주세요.");
        } else if (form.id.value && form.password.value&& form.name.value&& form.nickname.value&& form.pnum.value && form.email.value) {
            signupCheck =1;
        }

    }
    // 아이디 유효성체크
    function idCheck() {

        form.id.value = form.id.value.trim();

        if(!form.id.value) {
            alert("아이디를 입력해주세요.");
        }else {
            overlapCheck();
        }
    }

    // 아이디 중복체크
    function overlapCheck() {

        const id = document.getElementById("id").value;

        $.ajax({
            method: "post",
            url: "/checkId",
            data: {id: id},
            dataType: "json",
            success: function (data) {
                if (data == 1) {
                    alert("중복된 아이디입니다.");
                } else if (data == 0) {
                    document.getElementById("check").setAttribute("value", 1);
                    alert("사용가능한 아이디입니다.");
                }
            },
            error: function (error) {
                alert("ajax error" + error);
            }
        });
    }

    function signUp() {

        const check = document.getElementById("check").value;

        // 공백제거
        form.id.value = form.id.value.trim();
        form.password.value = form.password.value.trim();
        form.name.value = form.name.value.trim();
        form.nickname.value = form.nickname.value.trim();
        form.pnum.value = form.pnum.value.trim();
        form.email.value = form.email.value.trim();

        infoCheck();

        if(signupCheck==1 && check == 1) {
            form.submit();
            alert("가입이 완료되었습니다. 이메일 인증 후 로그인해주세요.");
        } else if(signupCheck==1 && check ==0) {
            alert("아이디 중복체크를 해주세요.");
        } else if(signupCheck ==0 && check==1) {
            alert("정보를 입력해주세요.");
        }

    }

</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-14
  Time: 오후 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>로그인</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/background.css"/>">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body class="background">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<nav class="navbar navbar-default"  style="background-color: ghostwhite; border: 0; max-width: 800px; margin: 25px auto;">
    <a class="navbar-brand" style="color: thistle">Board</a>

    <div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav" style="float:right;">
            <li class="active"><a class = "nav-menu" href="/" >홈</a></li>
            <c:if test="${not empty sessionScope.idx}">
                <li class="active"><a class = "nav-menu" href="/list"> 게시판 </a></li>
                <div class="nav-underline"></div>
            </c:if>
        </ul>
    </div>
    </div>
</nav>

    <form class="form-horizontal"  style="width:50%; margin-left: 600px; margin-top: 150px;"name="loginForm" action="/doLogin" method="post">
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
    <div class = "cookie" style="margin-left: 700px;">
        <input type="checkbox" id="checkId" name="checkId">
        <label for="checkId"><span></span></label>
        아이디저장
    </div>

    <a href="/beforeSignup" style="margin-left: 900px;">회원이 아니신가요?</a> <br>
    <a href="/findId_page" style="margin-left: 860px;">아이디 찾기</a>
    <a href="/findPwd_page" style="margin-left: 10px;">비밀번호 찾기</a>
<script>
    var form = document.loginForm;

    // 저장된 쿠키값을 가져와서 id칸에 넣어준다. 없으면 공백으로 들어감
    $(document).ready(function () {

        var key = getCookie("key");
        $("#username").val(key);

        // 그전에 id를 저장해서 처음 페이지 로딩시, 입력칸에 저장된 id가 표시된 상태라면,
        if($("#username").val() != "") {
            $("#checkId").attr("checked", true); // id 저장하기를 체크상태로 두기
        }
    });


    $("#checkId").change(function () { // 체크박스에 변화가 있다면,
       if($("#checkId").is(":checked")) { // id저장하기 체크했을때,
           setCookie("key", $("#username").val(), 3);  //3일동안 쿠키보관

       }else { // id 저장하기 체크 해제시,
           deleteCookie("key");
       }
    });

    //쿠키 저장하기
    //setCookie => savid함수에서 넘겨준시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
    function setCookie(cookieName, value, exdays) {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value)
                        + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }

    // id 저장하기를 체크한 상태에서 id를 입력하는 경우, 이럴때도 쿠키 저장
    $("#username").keyup(function () {
       if($("#checkId").is(":checked")) {
           setCookie("key", $("#username").val(), 3);
       }
    });

    // 쿠키 삭제
    function deleteCookie(cookieName) {
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate()-1);
        document.cookie = cookieName + "= " + "; expires"
                            + expireDate.toGMTString();
    }

    // 쿠키 가져오기
    function getCookie(cookieName) {
        cookieName = cookieName + "=";
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = "";

        if(start != -1) {
            start += cookieName.length;
            var end = cookieData.indexOf(";", start);
            if(end == -1) {
                end = cookieData.length;
                console.log("end위치 : " + end);
                cookieValue = cookieData.substring(start, end);
            }
            return unescape(cookieValue);
        }
    }

    function enterLogin() { //로그인 버튼 키이벤트
        if(window.event.keyCode == 13) {
            loginChk();
        }
    }

    function loginChk() { // 로그인 유효성 검사
        form.username.value = form.username.value.trim();
        form.password.value = form.password.value.trim();

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

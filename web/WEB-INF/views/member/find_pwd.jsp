<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-03-14
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="<c:url value="/css/background.css"/>">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <style>
        h2 {
            margin-left: 740px;
            margin-top: 100px;
        }

        div {
            width:15%;
            margin-left: 800px;
        }
    </style>
</head>
<body class="background">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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

<h2>아이디와 이름을 입력해주세요.</h2>
<br>
    <div>
        <form method="post" action="/updatePwd" name="PwdForm" style="margin-top: 50px;">
            <label for="id">아이디</label>
            <input class="form-control" type="text" id="id" name="id"/>
            <label for="name">이름</label>
            <input class="form-control" type="text" id="name" name="name"/> <br>
            <button type="button" class="btn btn-default" onclick="find()">본인인증</button> <br>
            <input class="form-control" type="password" id="password" name="password" style="margin-top: 10px;"/> <br>
            <button type="button" onclick="update()" class="btn btn-default">비밀번호 변경</button>
        </form>
    </div>

<a href="/" style="margin-left: 1030px;">뒤로가기</a>
<input type="hidden" id="find" value=0 />
<script>

    function find() {
        document.id.value = document.id.value.trim();
        document.name.value = document.name.value.trim();

        if(document.id.value && document.name.value) {
            let id = document.getElementById("id").value;
            let name = document.getElementById("name").value;

            $.ajax({
                method: "post",
                url: "/findPwd",
                data: {id: id, name: name},
                dataType: "json",
                success: function (data) {
                    if (data == 1) {
                        alert("본인인증이 완료되었습니다.");
                        document.getElementById("id").disabled = true;
                        document.getElementById("name").disabled = true;
                        document.getElementById("find").setAttribute("value", 1);
                    } else {
                        alert("개인정보가 틀렸습니다.");
                    }
                }
            });
        } else {
            alert("정보를 입력해주세요.");
        }
    }

    function update() {

        var find = document.getElementById("find").getAttribute("value");

        if(find == 0) {
            alert("본인인증을 해주세요.");
        }
        else if(find ==1) {
            alert("비밀번호 변경이 완료되었습니다.");
            PwdForm.submit();
        }
    }


</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-16
  Time: 오후 2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원정보</title>

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

<form name="updateForm" style="width: 20%; margin-left: 700px;" action="/updateInfo" method="post">
    <h1>회원정보</h1>
    <div class="form-group">
        <label for="id">아이디</label>
        <input id= "id" class="form-control" name="id" value="${user.id}" readonly="readonly">
    </div>
    <div class="form-group">
        <label for="password">비밀번호</label>
        <input id="password" class="form-control" type="password" name="password">
    </div>
    <div class="form-group">
        <label for="name">이름</label>
        <input id="name" class="form-control" name="name" value="${user.name}">
    </div>
    <div class="form-group">
        <label for="nickname">닉네임</label>
        <input id = "nickname" class="form-control" name="nickname" value="${user.nickname}">
    </div>
    <div class="form-group">
        <label for="pnum">전화번호</label>
        <input id="pnum" class="form-control" name="pnum" value="${user.pnum}">
    </div>
    <div class="form-group">
        <label for="address">주소</label>
        <input id = "address" class="form-control" name="address" value="${user.address}">
    </div>
    <input type="hidden" name = "idx" value="${user.idx}">
    <button class= "btn btn-default" type="button" onclick="update()">수정 </button>
</form>


<a id= "quit" href="/quitSignup"></a>
<button class = "btn btn-default" style="margin-left: 1000px;" type="button" onclick="quitSignup()">회원탈퇴</button>
<a href="/list" style="margin-left: 1100px;">뒤로가기</a>

<script>

    function update() {

        if (confirm("수정하시겠습니까?")) {
            updateForm.submit();
            alert("수정되었습니다.");
        }else {
        }
    }

    function quitSignup() {

        if(confirm("탈퇴하시겠습니까?")) {
            quit.click();
        }else{
        }

    }

</script>
</body>
</html>

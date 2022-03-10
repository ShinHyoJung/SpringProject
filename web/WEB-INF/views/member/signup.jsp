<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-14
  Time: 오후 2:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>

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

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <form name="signupForm" style="width:50%; margin-left: 700px;"action="/Signup" method="post" >
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
            <input id="pnum" type="text" class="form-control" style="width:50%;" name="pnum" placeholder="전화번호를 입력해주세요."/> <br> <br>
        </div>
        <div class="form-group">
            <label for="address">주소</label>
            <input id="address" type="text" class= "form-control" style="width:50%;" name="address" placeholder="주소를 입력해주세요."/>
        </div>    <br>
        <div class="form-group">
        <button class="btn btn-default" type="button" onclick="signup()">가입하기</button>
        </div>
    </form>

<a href="/" style="margin-left: 700px;">홈으로</a>
<script>

    function idCheck() {

        const id = document.getElementById("id").value;

        $.ajax({
            method: "post",
            url: "/checkMember",
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

    function signup() {

        const check = document.getElementById("check").value;

        if(check == 1) {
            signupForm.submit();
            alert("가입이 완료되었습니다.");
        } else {
            alert("아이디 중복체크를 해주세요.");
        }

    }


</script>
</body>
</html>

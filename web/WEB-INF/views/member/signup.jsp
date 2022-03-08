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
</head>

<body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<h1>회원 가입</h1>
    <form name="signupForm" action="/Signup" method="post" >
        <input id="id" type="text" name="id" placeholder="아이디"/> <button type="button" id="check" onclick="idCheck()" value=0>아이디 중복체크</button><br> <br>
        <input type="text" name="password" placeholder="비밀번호"/> <br><br>
        <input type="text" name="name" placeholder="이름"/> <br><br>
        <input type="text" name="nickname" placeholder="닉네임"/> <br><br>
        <input type="text" name="pnum" placeholder="전화번호"/> <br> <br>
        <input type="text" name="address" placeholder="주소"/> <br> <br>
        <button type="button" onclick="signup()">가입하기</button>
    </form>

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

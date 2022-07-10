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
<jsp:include page="/static/header.jsp"/>
<h2>아이디와 이름을 입력해주세요.</h2>
<br>
    <div>
        <form method="post" action="/updatePwd" name="PwdForm" style="margin-top: 50px;">
            <label for="id">아이디</label>
            <input class="form-control" type="text" id="before_id" name="before_id"/>
            <input type="hidden" id="id" name = "id">
            <label for="name">이름</label>
            <input class="form-control" type="text" id="before_name" name="before_name"/> <br>
            <input type="hidden" id="name" name="name">
            <button type="button" class="btn btn-default" onclick="find()">본인인증</button> <br>
            <label for="password" style="margin-top: 10px;">변경할 비밀번호</label>
            <input class="form-control" type="password" id="password" name="password" style="margin-top: 10px;"/> <br>
            <label for="password_confirm">비밀번호 확인</label>
            <input id="password_confirm" type="password" class="form-control" name="password_confirm" placeholder="비밀번호 확인"/> <br>
            <button type="button" onclick="update()" class="btn btn-default">비밀번호 변경</button>
        </form>
    </div>

<a href="/" style="margin-left: 1030px;">뒤로가기</a>
<input type="hidden" id="find" value=0 />
<script>

    var form = document.PwdForm;
    var re1 = /^[a-zA-z0-9]{4,12}$/;

    function find() {

        form.before_id.value = form.before_id.value.trim();
        form.before_name.value = form.before_name.value.trim();

        if(form.before_id.value && form.before_name.value) {
            let before_id = document.getElementById("before_id").value;
            let before_name = document.getElementById("before_name").value;

            $.ajax({
                method: "post",
                url: "/findPwd",
                data: {id: before_id, name: before_name},
                dataType: "json",
                success: function (data) {
                    if (data == 1) {
                        alert("본인인증이 완료되었습니다.");
                        document.getElementById("before_id").disabled = true;
                        document.getElementById("before_name").disabled = true;
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

        var pw = document.getElementById("password");
        var cpw = document.getElementById("password_confirm");

        if(find == 0) {
            alert("본인인증을 해주세요.");
        }
        else if(find ==1) {
            document.getElementById("id").value = document.getElementById("before_id").value;
            document.getElementById("name").value = document.getElementById("before_name").value;
            if(form.password.value) {

                if(!re1.test(pw.value)) {
                    alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다.");
                    form.password.focus();
                    return false;
                }

                if(pw.value != cpw.value) {
                    alert("비밀번호가 다릅니다.");
                    form.password.focus();
                    return false;
                }

                form.submit();
                alert("비밀번호 변경이 완료되었습니다.");

            } else {
                alert("비밀번호를 입력해주세요.");
            }


        }
    }


</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-03-14
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비밀번호 찾기</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <style>
        h2 {
            margin-left: 650px;
        }

        div {
            width:15%;
            margin-left: 700px;
        }
    </style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<h2>아이디와 이름을 입력해주세요.</h2>
<br>
    <div>
        <form method="post" action="/updatePwd" name="PwdForm">
            <label for="id">아이디</label>
            <input class="form-control" type="text" id="id" name="id"/>
            <label for="name">이름</label>
            <input class="form-control" type="text" id="name" name="name"/> <br>

            <button type="button" class="btn btn-default" onclick="find()">본인인증</button>
            <input class="form-control" type="text" id="password" name="password"/> <br>
            <button type="button" onclick="update()" class="btn btn-default">비밀번호 변경</button>
        </form>
    </div>
<input type="hidden" id="find" value=0 />
<script>

    function find() {
        alert("ddd");
        let id = document.getElementById("id").value;
        let name = document.getElementById("name").value;

        $.ajax ({
            method: "post",
            url: "/findPwd",
            data: {id: id , name: name},
            dataType: "json",
            success: function(data) {
                if(data == 1) {
                    alert("본인인증이 완료되었습니다.");
                    document.getElementById("find").setAttribute("value", 1);
                }
                else {
                    alert("개인정보가 틀렸습니다.");
                }
            }
        });
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

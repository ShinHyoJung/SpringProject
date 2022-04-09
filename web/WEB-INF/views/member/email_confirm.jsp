<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-03-15
  Time: 오전 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>이메일 확인</title>
</head>
<body>
    <script type="text/javascript">
        var email = "${email}";

        alert(email + "회원가입을 축하합니다. 이제 게시판이용이 가능합니다. 확인버튼을 누르면 로그인 페이지로 이동합니다.");

        self.location = "/Login";
    </script>
</body>
</html>

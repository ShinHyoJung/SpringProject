<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-21
  Time: 오후 5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글읽기</title>

</head>
<body>
    <table>
        <tr>
            <td style="width:200px; height:30px;">${board.btitle}</td>
        <tr>
            <td style="width:200px; height:30px;">${board.bwriter}</td>
        <tr>
            <td style="width:200px; height:300px;">${board.bcontent}</td>
        <tr>
            <td style="width:200px; height:30px;">${board.bhit}</td>
    </table>

    <a href="/list">목록</a>
</body>
</html>

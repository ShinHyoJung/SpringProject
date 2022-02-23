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

    <style>
        td {
            width:300px;
            height:50px;
        }

    </style>
</head>
<body>
    <table>
        <tr>
            <td>제목: ${board.btitle}</td>
        <tr>
            <td>작성자: ${board.bwriter}</td>
        <tr>
            <td style="height:500px;">내용 ${board.bcontent}</td>
        <tr>
            <td>조회수: ${board.bhit}</td>
        <tr>
            <td>작성날짜: ${board.bdatetime}</td>
        <tr>
            <td>업데이트날짜: ${board.bupdatetime}</td>
    </table>

    <a href="/list">목록</a>
    <a href="/modify/${board.bno}">수정</a>

    <form method="post" action="/delete">
        <input type="hidden" value="${board.bno}" name="bno">
        <button type="submit">삭제</button>
    </form>
</body>
</html>

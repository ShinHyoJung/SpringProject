<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-21
  Time: 오전 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>게시판 목록</title>


</head>
<body>
<h1>게시판</h1>
    <table>
        <tr>
          <th>글번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>작성날짜</th>
          <th>조회수</th>
        </tr>
        <c:forEach items="${list}" var="list">
        <tr>
            <td>${list.bno}</td>
            <td><a href="/read/${list.bno}" name="list.btitle"/>${list.btitle}</td>
            <td>${list.bwriter}</td>
            <td>${list.bupdatetime}</td>
            <td>${list.bhit}</td>
        </tr>
        </c:forEach>
    </table>

    <a href="/info">회원정보</a>
    <a href="/write">글쓰기</a>

    <form id="/pageform" method="get">
        <input type="hidden" name="pageNum" value="${page.cri.pageNum}">
        <input type="hidden" name="amount" value = "${page.cri.amount}">
    </form>
</body>
</html>

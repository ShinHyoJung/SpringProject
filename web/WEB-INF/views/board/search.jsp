<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-02-23
  Time: 오후 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>작성자가 쓴글</title>
</head>
<body>
<table>
    <h1>${writer}</h1>
    <tr>
        <th>글번호</th>
        <th>제목</th>
        <th>작성날짜</th>
        <th>조회수</th>
    </tr>

    <c:forEach items="${result}" var="result">
        <tr>
            <td>${result.bno}</td>
            <td><a href="/read/${result.bno}" name="result.btitle"/>${result.btitle}</td>
            <td>${result.bupdatetime}</td>
            <td>${result.bhit}</td>
        </tr>
    </c:forEach>
</table>

<a href="/list">목록</a>
</body>
</html>

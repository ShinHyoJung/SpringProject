<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-21
  Time: 오전 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글쓰기</title>


</head>
<link rel="stylesheet" type="text/css" href="/css/write.css"/>

<body>
<form method="post" action="/enroll">
    <table>
        <tr>
            <td>
                제목 <textarea name="btitle" style="width:200px; height:30px; "></textarea>
            </td>
        <tr>
            <td>
                작성자: ${user.name}
            </td>
        <tr>
            <td>
                내용 <textarea name="bcontent" style="width:200px; height:300px;"></textarea>
            </td>
        </tr>
    </table>
    <button type="submit">등록</button>
    <input type="hidden" value="${user.name}" name="bwriter">
    <input type="hidden" value="${user.idx}" name="idx">
</form>
</body>
</html>

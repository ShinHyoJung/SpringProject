<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-22
  Time: 오전 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 수정</title>
</head>
<body>
    <form name="updateForm" method="post" action="/update">
        <table>
            <tr>
                <td style="width:200px; height:30px;"><textarea name="btitle" style="width:200px; height:30px;">${board.btitle}</textarea></td>
            <tr>
                <td style="width:200px; height:30px;">${board.bwriter}</td>
            <tr>
            <td style="width:200px; height:300px;"><textarea name="bcontent" style="width:200px; height:300px;">${board.bcontent}</textarea></td>
            <tr>
                <td style="width:200px; height:30px;">${board.bhit}</td>
        </table>
        <input type="hidden" name="bno" value="${board.bno}">
        <input type="hidden" name="idx" value="${board.idx}">
        <button type="button" onclick="restore()">저장</button>
    </form>
</body>

<script>

    function restore() {
        if(confirm("저장하시겠습니까?")) {
            updateForm.submit();
        } else {

        }
    }

</script>
</html>

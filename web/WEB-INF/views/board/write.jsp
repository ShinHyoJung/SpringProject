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

<body>
<form name= "writeForm" method="post" action="/enroll" enctype="multipart/form-data">
    <table>
        <tr>
            <td>
                제목 <textarea name="btitle" style="width:200px; height:30px; "></textarea>
            </td>
        <tr>
            <td>
                작성자: ${user.nickname}
            </td>
        <tr>
            <td>
                 <textarea name="bcontent" style="width:200px; height:300px;"></textarea>
            </td>
        <tr>
            <td>
                <input type="file" name="file">
            </td>
        </tr>
    </table>
    <button type="button" onclick="enroll()">등록</button>
    <input type="hidden" value="${user.nickname}" name="bwriter">
    <input type="hidden" value="${user.idx}" name="idx">
    <br><br>


    <a href="/list">뒤로가기</a>
</form>

<script>

    function enroll() {
        var form = document.writeForm;

        if(confirm("글을 등록하시겠습니까?")) {
            form.submit();
            alert("등록되었습니다.");
        } else {

        }
    }
</script>
</body>
</html>

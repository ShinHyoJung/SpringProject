<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-21
  Time: 오후 5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>게시글읽기</title>

    <style>
        .read
        {
            border: 1px solid #444444;
            width:300px;
            height:50px;
        }

    </style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <table class="read">
        <tr>
            <td class="read">제목: ${board.btitle}</td>
        <tr>
            <td class="read">작성자: ${board.bwriter}</td>
        <tr>
            <td class="read" style="height:500px;">${board.bcontent}</td>
        <tr>
            <td class="read">조회수: ${board.bhit}</td>
        <tr>
            <td class="read">작성날짜: ${board.bdatetime}</td>
        <tr>
            <td class="read">업데이트날짜: ${board.bupdatetime}</td>
        <tr>
    </table>

    <a href="/list">목록</a>
    <c:if test="${board.idx eq user.idx}">
    <a href="/modifyBoard/${board.bno}">수정</a>

    <form method="post" action="/delete">
        <input type="hidden" value="${board.bno}" name="bno">
        <button type="submit">삭제</button>
    </form>
    </c:if>

    <form method="post" action="/writeComment">
        <textarea id="text" name="ctext"></textarea>
        <input type="hidden" name="cwriter" value="${user.nickname}">
        <input type="hidden" name="bno" value="${board.bno}">
        <input type="hidden" name="idx" value="${board.idx}">
        <button type="submit">등록</button>
    </form>

<c:if test="${not empty comments}">
    <table>
        <thead>
        <th>작성자</th>
        <th>내용</th>
        </thead>
        <tbody>
        <c:forEach items="${comments}" var="comments">
            <tr>
                <td>${comments.cwriter}</td>

                <td id="comment_content" style="display: block;">${comments.ctext}</td>
                <td id= "modify_comment" style="display: none;"><textarea >${comments.ctext}"</textarea></td>
                <td id="delete_comment" style="display: block;">
                    <form method="post" action="/deleteComment">
                        <input type="hidden" name="cno" value="${comments.cno}">
                    <button type="submit">삭제</button>
                    </form>
                </td>
                <td>
                    <button id="select_comment" style="display: block;">수정</button>
                </td>
            <tr>

        </c:forEach>
        </tbody>
    </table>
</c:if>

<script>

    $("#select_comment").on("click", function() {
        $(this).parent().parent().find("#modify_comment").css("display", "block");
        $(this).parent().parent().find("#comment_content").css("display", "none");
        $(this).parent().parent().find("#delete_comment").css("display", "none");
    });

</script>
</body>
</html>

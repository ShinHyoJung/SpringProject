<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-28
  Time: 오후 1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach items="${comments}" var="comments">
    <tr>
        <td>${comments.cwriter}</td>

        <td class="comment_content" style="display: block;">${comments.ctext}</td>
        <td class="modify_comment" style="display: none;"><textarea >${comments.ctext}</textarea></td>
        <td>
            <button class="select_comment" style="display: block;">수정</button>
            <button class="update_comment" value = "${comments.cno}" style="display: none;">등록</button>
        </td>
        <td>
            <button class="delete_comment" value="${comments.cno}" style="display: block;">삭제</button>
        </td>
    <tr>
</c:forEach>
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
<svg id="fill_heart" style="display: none;" idx = "${user.idx}" board_no = "${board.bno}" check="${heart.hcheck}" xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 512 512">
    <path d="M0 190.9V185.1C0 115.2 50.52 55.58 119.4 44.1C164.1 36.51 211.4 51.37 244 84.02L256 96L267.1
    84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1
    464.4 300.4L283.7 469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1
    .0003 232.4 .0003 190.9L0 190.9z"/></svg>

<svg id ="empty_heart" style="display: block;" idx="${user.idx}" board_no="${board.bno}" check="${heart.hcheck}" xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 512 512">
    <path d="M244 84L255.1 96L267.1 84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1 464.4 300.4L283.7
    469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1 0 232.4 0 190.9V185.1C0 115.2 50.52 55.58 119.4
    44.1C164.1 36.51 211.4 51.37 244 84C243.1 84 244 84.01 244 84L244 84zM255.1 163.9L210.1 117.1C188.4 96.28 157.6 86.4
    127.3 91.44C81.55 99.07 48 138.7 48 185.1V190.9C48 219.1 59.71 246.1 80.34 265.3L256
    429.3L431.7 265.3C452.3 246.1 464 219.1 464 190.9V185.1C464 138.7
430.4 99.07 384.7 91.44C354.4 86.4 323.6 96.28 301.9 117.1L255.1 163.9z"/></svg>
    <div id="heart">${board.bheart}</div>

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
        <input type="hidden" name="idx" value="${user.idx}">
        <button type="submit">등록</button>
    </form>

<c:if test="${not empty comments}">
    <table>
        <thead>
        <th>작성자</th>
        <th>내용</th>
        </thead>
        <tbody id="tbody_comment">
        <c:forEach items="${comments}" var="comments">
            <tr>
                <td>${comments.cwriter}</td>

                <td class="comment_content" user_idx="${user.idx}" comments_idx = "${comments.idx}" style="display: block;">${comments.ctext}</td>
                <td class="modify_comment" style="display: none;"><textarea >${comments.ctext}</textarea></td>
                <c:if test="${user.idx eq comments.idx}">
                <td>
                    <button class="select_comment" comment_idx = "${comments.idx}" style="display: block;">수정</button>
                    <button class="update_comment" comment_cno = "${comments.cno}" comment_bno="${comments.bno}" style="display: none;">등록</button>
                </td>
                <td>
                    <button class="delete_comment" comment_idx="${comments.idx}" value="${comments.cno}" style="display: block;">삭제</button>
                </td>
                </c:if>
            <tr>

        </c:forEach>
        </tbody>
    </table>
</c:if>


<script>
    let check = $("#empty_heart").attr("check");

    $(".delete_comment").on("click", function () { // 댓글 삭제
        let comment_no = $(this).val();

        $.ajax({

            method: "post",
            url: "/deleteComment",
            data: {cno: comment_no}
        })
        .done (data => {
            $(this).parent().parent().remove();
            location.reload();
        });
    });

    $(".select_comment").on("click", function() { // 수정할 내용 불러오기, 등록버튼활성화
        $(this).parent().parent().find(".modify_comment").css("display", "block");
        $(this).parent().parent().find(".comment_content").css("display", "none");
        $(this).parent().parent().find(".delete_comment").css("display", "none");
        $(this).parent().parent().find(".select_comment").css("display", "none");
        $(this).parent().parent().find(".update_comment").css("display", "block");
    });

    $(".update_comment").on("click", function () { // 수정
        let comment_cno = $(this).parent().parent().find('.update_comment').attr("comment_cno");
        let comment_content = $(this).parent().parent().find('td > textarea').val();
        let comment_bno = $(this).parent().parent().find('.update_comment').attr("comment_bno");

        $.ajax({
            method: "post",
            url: "/updateComment",
            data: {cno: comment_cno, ctext: comment_content, bno: comment_bno}
        })
        .done (data=> {
            $('#tbody_comment').html(html); // 선택 요소 안의 내용을 가져오거나 바꿈
        });
    });

    $(".update_comment").on("click", function () { // 댓글 수정후, 새로고침
       location.reload();
    });


    $("#empty_heart").on("click", function () {

        let board_no = $(this).attr("board_no");
        let idx = $(this).attr("idx");

        alert("좋아요 반영되었습니다.");

        $.ajax({
            method:"post",
            url: "/insertHeart",
            data: {bno: board_no, idx: idx}
        })
        .done (data => {
            $("#empty_heart").css("display", "none");
            $("#fill_heart").css("display", "block");
            location.reload();
        });

        $.ajax({
            method: "post",
            url:"/upBoard",
            data: {bno: board_no}
        })
        .done(data=> {
            location.reload();
        });
    });

    $("#fill_heart").on("click", function () {

        let board_no = $(this).attr("board_no");
        let idx = $(this).attr("idx");

        alert("좋아요 취소하시겠습니까?");

        $.ajax({
            method: "post",
            url:"/deleteHeart",
            data: {bno:board_no, idx: idx}
        })
        .done( data=> {
            $("#empty_heart").css("display", "block");
            $("#fill_heart").css("display", "none");
           location.reload();
        });


        $.ajax({
            method: "post",
            url:"/downBoard",
            data: {bno: board_no}
        })
        .done(data=> {
            location.reload();
        });
    });

    if(check == 1) {
        $("#empty_heart").css("display", "none");
        $("#fill_heart").css("display", "block");
    }
    else {
        $("#empty_heart").css("display", "block");
        $("#fill_heart").css("display", "none");
    }


</script>
</body>
</html>

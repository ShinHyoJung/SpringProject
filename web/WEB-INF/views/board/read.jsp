<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-21
  Time: 오후 5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>게시글읽기</title>

    <link rel="stylesheet" href="<c:url value="/css/background.css"/>" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

</head>
<body class="background">

<nav class="navbar navbar-default"  style="background-color: ghostwhite; border: 0; max-width: 800px; margin: 25px auto;">
    <a class="navbar-brand" style="color: thistle">Board</a>

    <div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav" style="float:right;">
            <li class="active"><a class = "nav-menu" href="/" >홈</a></li>
            <sec:authorize access="isAuthenticated()">
                <li class="active"><a class = "nav-menu" href="/list"> 게시판 </a></li>
                <div class="nav-underline"></div>
            </sec:authorize>
        </ul>
    </div>
    </div>
</nav>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <table class="table table-bordered" style="width: 50%; margin-left: 450px;">
        <tr>
            <td class="read">
                <c:if test="${board.bpin ==1}">
                    [공지]
                </c:if>
                <c:out value="${board.btitle}" escapeXml="true"/></td>
        <tr>
            <td class="read">작성자: ${board.bwriter}</td>
        <tr>
        <td class="read" style="height:500px;"><c:out value="${board.bcontent}" escapeXml="true"/></td>
        <tr>
            <td class="read">조회수: ${board.bhit}</td>
        <tr>
            <td class="read">작성날짜: ${board.bdatetime}</td>
        <tr>
            <td class="read">업데이트날짜: ${board.bupdatetime}</td>
        <c:if test="${not empty file}">
        <c:forEach var="file" items="${file}">
            <tr>
            <td class="read">파일
                <a href="#" onclick="downFile(${file.fno}); return false;">${file.org_fname}</a>(${file.fsize}kb)

            </td>
            </c:forEach>
        </c:if>
    </tr>
    </table>

    <form name="downForm" method="post" >
        <input type="hidden" id ="fno" name="fno" value=""/>
    </form>

<div style="margin-left: 450px;">
<svg class="heart" id="fill_heart" style="display: none;" heart_no = "${heart.hno}" idx = "${user.idx}" heart_idx = "${heart.idx}" board_no = "${board.bno}" check="${heart.hcheck}" xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 512 512">
    <path d="M0 190.9V185.1C0 115.2 50.52 55.58 119.4 44.1C164.1 36.51 211.4 51.37 244 84.02L256 96L267.1
    84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1
    464.4 300.4L283.7 469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1
    .0003 232.4 .0003 190.9L0 190.9z"/></svg>


<svg class="heart" id ="empty_heart" style="display: block;" heart_no = "${heart.hno}" idx="${user.idx}" heart_idx = "${heart.idx}" board_no="${board.bno}" check="${heart.hcheck}" xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 512 512">
    <path d="M244 84L255.1 96L267.1 84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1 464.4 300.4L283.7
    469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1 0 232.4 0 190.9V185.1C0 115.2 50.52 55.58 119.4
    44.1C164.1 36.51 211.4 51.37 244 84C243.1 84 244 84.01 244 84L244 84zM255.1 163.9L210.1 117.1C188.4 96.28 157.6 86.4
    127.3 91.44C81.55 99.07 48 138.7 48 185.1V190.9C48 219.1 59.71 246.1 80.34 265.3L256
    429.3L431.7 265.3C452.3 246.1 464 219.1 464 190.9V185.1C464 138.7
430.4 99.07 384.7 91.44C354.4 86.4 323.6 96.28 301.9 117.1L255.1 163.9z"/>   </svg>

    <div style="display: inline-block; margin-left: 40px; margin-top: -20px;" id="heart">${board.bheart}</div> </div> <br>

    <c:if test="${board.idx eq user.idx}">
     <div style="margin-left: 450px;">
         <div style="display: inline-block">
        <button class="btn btn-default"  onclick="location.href='/modify/${board.bno}'">수정</button>
         </div>
        <div style="display: inline-block">
        <form name = "removeForm" method="post" action="/delete">
            <input type="hidden" value="${board.bno}" name="bno">
            <button class="btn btn-default" type="button" onclick="remove()">삭제</button>
        </form>
        </div>
     </div>
    </c:if>

    <a href="/list" class= "btn btn-primary" style="margin-left: 1300px; margin-top: -55px; display: inline-block;">목록</a> <br>

    <form name="commentForm" style="margin-left:450px; margin-top: 20px;"  method="post" action="/writeComment">
        <textarea class="form-control" style="width: 40%; display: inline-block;" id="text" name="ctext" onkeyup="enterComment()"></textarea>
        <input type="hidden" name="cwriter" value="${user.nickname}">
        <input type="hidden" name="bno" value="${board.bno}">
        <input type="hidden" name="idx" value="${user.idx}">
        <button class= "btn btn-default" type="button" style="margin-bottom: 40px; margin-left: 5px;" onclick="enroll()">등록</button>
    </form>

<c:if test="${not empty comments}">
    <table class="table" style="width: 50%; margin-left: 470px;">
        <thead>
        <th>작성자</th>
        <th>내용</th>
        </thead>
        <tbody id="tbody_comment">
        <c:forEach items="${comments}" var="comments">
            <tr>
                <td style="width:10%;">${comments.cwriter}</td>

                <td class="comment_content" user_idx="${user.idx}" comments_idx = "${comments.idx}" style="display: block;"><c:out value="${comments.ctext}" escapeXml="true"/></td>
                <td class="modify_comment" style="display: none;"><textarea id="texts" class="form-control" style="width: 90%;">${comments.ctext}</textarea></td>
                <c:if test="${user.idx eq comments.idx}">
                <td style="width:10%;">
                    <button class="btn btn-default select_comment" comment_idx = "${comments.idx}" style="display: block;">수정</button>
                    <button class="btn btn-default update_comment" id = "update" type="button" onclick="update()" comment_cno = "${comments.cno}" comment_bno="${comments.bno}" style="display: none;">등록</button>

                    <button class="btn btn-default delete_comment" comment_idx="${comments.idx}" value="${comments.cno}" style="display: block;">삭제</button>
                </td>
                </c:if>
            <tr>

        </c:forEach>
        </tbody>
    </table>
</c:if>


<script>
    let check = $(".heart").attr("check");
    let heart_no = $(".heart").attr("heart_no");
    let board_no = $(".heart").attr("board_no");


    function remove() { // 게시글 삭제
        if(confirm("정말 삭제하시겠습니까?")) {
            removeForm.submit();
            alert("삭제되었습니다.");
        } else {
        }
    }

    function downFile(file_no) { // 파일 다운
        var form = $("form[name='downForm']");
        $("#fno").attr("value", file_no);
        form.attr("action", "/downFile");
        form.submit();
    }

    function enterComment() { // 엔터키 누르면 등록되도록
        if(window.event.keyCode == 13) {
            enroll();
        }
    }

    function enroll() { // 댓글 등록

        commentForm.text.value = commentForm.text.value.trim();

        if(!commentForm.text.value) {
            alert("내용을 입력해주세요.");
        }else if(commentForm.text.value) {

            commentForm.submit();
        }
    }

    $(".delete_comment").on("click", function () { // 댓글 삭제

        if(confirm("정말 삭제하시겠습니까?")) {
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

        } else {

        }

    });

    $(".select_comment").on("click", function() { // 수정할 내용 불러오기, 등록버튼활성화
        $(this).parent().parent().find(".modify_comment").css("display", "block");
        $(this).parent().parent().find(".comment_content").css("display", "none");
        $(this).parent().parent().find(".delete_comment").css("display", "none");
        $(this).parent().parent().find(".select_comment").css("display", "none");
        $(this).parent().parent().find(".update_comment").css("display", "block");
    });

    $(".update_comment").on("click", function () { // 댓글 수정

        document.getElementById("texts").value = document.getElementById("texts").value.trim();

        if(!document.getElementById("texts").value) {
            alert("수정할 내용을 입력해주세요.");
        } else {

            let comment_cno = $(this).parent().parent().find('.update_comment').attr("comment_cno");
            let comment_content = $(this).parent().parent().find('td > textarea').val();
            let comment_bno = $(this).parent().parent().find('.update_comment').attr("comment_bno");

            $.ajax({
                method: "post",
                url: "/updateComment",
                data: {cno: comment_cno, ctext: comment_content, bno: comment_bno}
            })
                .done(data => {
                    $('#tbody_comment').html(html); // 선택 요소 안의 내용을 가져오거나 바꿈
                });


            //   $(".update_comment").on("click", function () { // 댓글 수정후, 새로고침
            location.reload();
        }
          //  });
       });

    $("#empty_heart").on("click", function () { // 좋아요

        let board_no = $(this).attr("board_no");
        let idx = $(this).attr("idx");
        let heart_idx = $(this).attr("heart_idx");

        alert("좋아요 반영되었습니다.");

        $.ajax({
            method: "post",
            url: "/upBoard",
            data: {bno: board_no}
        })
            .done(data => {
                location.reload();
            });

        if(idx == heart_idx) { // 좋아요를 다시할때, idx값 대조

            $.ajax({
                method: "post",
                url: "/updateHeart",
                data: {hno: heart_no}
            })
                .done(data => {
                    $("#empty_heart").css("display", "none");
                    $("#fill_heart").css("display", "block");
                    location.reload();
                });
        } else { // 좋아요를 처음하는 경우,

            $.ajax({
                method: "post",
                url: "/insertHeart",
                data: {bno: board_no, idx: idx}
            })
                .done(data => {
                    $("#empty_heart").css("display", "none");
                    $("#fill_heart").css("display", "block");
                    location.reload();
                });
        }
    });

    $("#fill_heart").on("click", function () { // 좋아요 취소


        if(confirm("좋아요를 취소하시겠습니까?")) {
            $.ajax({
                method: "post",
                url: "/deleteHeart",
                data: {hno: heart_no}
            })
                .done(data => {
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
        } else {

        }

    });

    if(check == 1) { // check값이 1일때, 하트 채우기
        $("#empty_heart").css("display", "none");
        $("#fill_heart").css("display", "block");
    }
    else { // check값이 0일때, 하트 비우기
        $("#empty_heart").css("display", "block");
        $("#fill_heart").css("display", "none");
    }


</script>
</body>
</html>

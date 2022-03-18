<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-21
  Time: 오전 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>게시글쓰기</title>
    <link rel="stylesheet" href="<c:url value="/css/background.css"/>" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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

<form class="form-group" style="margin-left: 450px;width:50%;" name= "writeForm" method="post" action="/enroll" enctype="multipart/form-data">
    <table class="table table-bordered">
        <tr>
            <td>
                <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                <input type="checkbox" id="bpin" name="bpin" value="1">
                <label for="bpin">공지글 <span></span></label> <br>
                </sec:authorize>
                제목 <textarea class="form-control" rows="1" name="btitle" id="btitle" style="height:30px; "></textarea>
            </td>
        <tr>
            <td>
                작성자: ${user.nickname}
            </td>
        <tr>
            <td>
                 <textarea class="form-control" rows="20" name="bcontent" style="height:300px;"></textarea>
            </td>
        <tr>
            <td>
                <input type="file" name="file" placeholder="파일선택" multiple/>
            </td>
        </tr>
    </table>
    <button class="btn btn-default" type="button" onclick="enroll()">등록</button>
    <input type="hidden" value="${user.nickname}" name="bwriter">
    <input type="hidden" value="${user.idx}" name="idx">
    <a href="/list">뒤로가기</a>
</form>

<script>

    function enroll() {
        var form = document.writeForm;

        form.btitle.value = form.btitle.value.trim();

        if(!form.btitle.value) { // 제목 유효성 검사
            alert("제목을 입력해주세요.");
        }
        else if(!form.bcontent.value){
            alert("내용을 입력해주세요.");
        }
        else if (form.btitle.value && form.bcontent.value){
            if (confirm("글을 등록하시겠습니까?")) {
                form.submit();
                alert("등록되었습니다.");
            } else {
            }
        }
    }
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-22
  Time: 오전 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>게시글 수정</title>
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

    <form class="form-group" style="margin-left: 450px;width:50%;" name="updateForm" method="post" action="/update">
        <table class="table table-bordered">
            <tr>
                <td style="width:200px; height:30px;"><textarea class="form-control" rows="20" name="btitle" style="height:30px; ">${board.btitle}</textarea></td>
            <tr>
                <td style="width:200px; height:30px;">${board.bwriter}</td>
            <tr>
            <td style="width:200px; height:300px;"><textarea class="form-control" rows="20" name="bcontent" style="height:300px;">${board.bcontent}</textarea></td>
            <tr>
                <td style="width:200px; height:30px;">${board.bhit}</td>
        </table>
        <input type="hidden" name="bno" value="${board.bno}">
        <input type="hidden" name="idx" value="${board.idx}">
        <button class="btn btn-default" type="button" onclick="restore()">저장</button>
    </form>
</body>

<script>

    var update_check = 0;

    function check() {

        updateForm.btitle.value = updateForm.btitle.value.trim();
        updateForm.bcontent.value = updateForm.bcontent.value.trim();

        if(updateForm.btitle.value && updateForm.bcontent.value) {
            update_check = 1;
        }else if(!updateForm.btitle.value && !updateForm.bcontent.value){
            alert("제목과 내용을 입력해주세요.");
        }else if(!updateForm.bcontent.value) {
            alert("내용을 입력해주세요.");
        }else if(!updateForm.btitle.value) {
            alert("제목을 입력해주세요.");
        }
    }

    function restore() {
        if(confirm("저장하시겠습니까?")) {
            check();
                if(update_check ==0) {
                    location.reload();
                } else if(update_check==1) {
                    updateForm.submit();
                    alert("저장이 완료되었습니다.");
                }
            } else {

            }
    }

</script>
</html>

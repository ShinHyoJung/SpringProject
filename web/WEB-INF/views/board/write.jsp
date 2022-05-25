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
<jsp:include page="/static/header.jsp"/>

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
                  <div id="smarteditor">
                 <textarea class="form-control" rows="20" id= "bcontent" name="bcontent" style="height:300px;"></textarea>
                  </div>
            </td>
        <tr>
    </table>

    <div id="fileDiv">
        <p>
        </p>
    </div>

    <button type="button" class="btn btn-primary" onclick="addFile()">파일추가</button>
    <button class="btn btn-default" type="button" onclick="enroll()">등록</button>
    <input type="hidden" value="${user.nickname}" name="bwriter">
    <input type="hidden" value="${user.idx}" name="idx">

</form>
<a href="/list" style="margin-left: 1350px;">뒤로가기</a>
<script>


    var count = 1;

    function enroll() {
        var form = document.writeForm;

        form.btitle.value = form.btitle.value.trim();
        form.bcontent.value = form.bcontent.value.trim();


        if(!form.btitle.value) { // 제목 유효성 검사
            alert("제목을 입력해주세요.");
        }
        else if(!form.bcontent.value) {
            alert("내용을 입력해주세요.");
        }
        else  {
            if (confirm("글을 등록하시겠습니까?")) {
                form.submit();
                alert("등록되었습니다.");
            } else {
            }
        }
    }

    function addFile() {

        var str = "<p><input type='file' name='file_"+(count++)+"'/><a href='#this' name='delete' class='btn'>삭제</a></p> ";
        $("#fileDiv").append(str);

        $("a[name='delete']").on("click",function(){
            removeFile($(this));
        })

    }

    function removeFile(obj) {
        obj.parent().remove();
    }



</script>
</body>
</html>

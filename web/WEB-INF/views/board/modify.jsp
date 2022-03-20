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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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

    <form class="form-group" style="margin-left: 450px;width:50%;" name="updateForm" method="post" action="/update" enctype="multipart/form-data">
        <table class="table table-bordered">
            <tr>
                <td style="width:200px; height:30px;"><textarea class="form-control" rows="20" name="btitle" style="height:30px; ">${board.btitle}</textarea></td>
            <tr>
                <td style="width:200px; height:30px;">${board.bwriter}</td>
            <tr>
            <td style="width:200px; height:300px;"><textarea class="form-control" rows="20" name="bcontent" style="height:300px;">${board.bcontent}</textarea></td>
            <tr>
                <td style="width:200px; height:30px;">${board.bhit}</td>

            <c:if test="${not empty file}">
                <c:forEach var="file" items="${file}" varStatus="var">
            <tr>
                <td>
                    <input type="hidden" id="file_no" name="file_no_${var.index}" value="${file.fno}">
                    <input type="hidden" id="file_name" name="file_name" value="file_no_${var.index}">
                    ${file.org_fname} ${file.fsize}.kb
                    <button type="button" class="removeFile" onclick="file_del('${file.fno}','FILE_NO_${var.index}')">삭제</button>
                </td>
                </c:forEach>
            <tr>
                </c:if>
        </table>
        <div id="fileDiv">
            <p>
            </p>
        </div>

        <input type="hidden" name="bno" value="${board.bno}">
        <input type="hidden" name="idx" value="${board.idx}">
        <input type="hidden" id="fileNoDel" name = "fileNoDel[]" value="">
        <input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
        <button class="btn btn-primary" type="button" onclick="addFile()">파일추가</button>
        <button class="btn btn-default" type="button" onclick="restore()">저장</button>
    </form>
</body>

<script>

    var update_check = 0;
    var count = 1;

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

  $(".removeFile").on("click", function () {

     $(this).parent().remove();

     file_del();
  });

    var fileNoArry = new Array();
    var fileNameArry = new Array();

  function file_del(value, name) {

      fileNoArry.push(value);
      fileNameArry.push(name);
      $("#fileNoDel").attr("value", fileNoArry);
      $("#fileNameDel").attr("value", fileNameArry);
  }
</script>
</html>

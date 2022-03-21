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
    <script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
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
                  <div id="smarteditor">
                 <textarea class="form-control" rows="20" id= "editorTxt" name="editorTxt" style="height:300px;"></textarea>
                  </div>
                <input type="hidden" id = "bcontent" name="bcontent" />
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

    let oEditors = []

    smartEditor = function() {
        console.log("Naver SmartEditor")
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "editorTxt",
            sSkinURI: "/smarteditor/SmartEditor2Skin.html",
            fCreator: "createSEditor2",
            htParams: {
                bUseModeChanger:false
            }
        })
    }

    $(document).ready(function() {
        smartEditor()
    })

    function enroll() {
        var form = document.writeForm;

        oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", [])
        let content = document.getElementById("editorTxt").value

        if(content == '' || content==null || content=='&nbsp;' || content == '<br>' || content=='</br>' || content=='<p>&nbsp;</p>') {
            alert("내용을 입력해주세요.")
            oEditors.getById["editorTxt"].exec("FOCUS")
            return
        } else {
            console.log(content)
            document.getElementById("bcontent").value = content;
        }

        if(!form.btitle.value) { // 제목 유효성 검사
            alert("제목을 입력해주세요.");
        }
        else {
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

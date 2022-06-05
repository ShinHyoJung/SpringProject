<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-02-23
  Time: 오후 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>작성자가 쓴글</title>

    <link rel="stylesheet" href="<c:url value="/css/background.css"/>" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body class="background" onload="pringpage();">

<jsp:include page="/static/header.jsp"/>

<table class="table table-hover" style="width:50%; margin-left: 450px; margin-top: 70px;" >
    <h2 style="margin-left: 600px; margin-top: 50px; display: inline-block;">${writer}</h2>
    <tr>
        <th>글번호</th>
        <th>제목</th>
        <th>작성날짜</th>
        <th>조회수</th>
    </tr>

    <c:forEach items="${result}" var="result">
        <tr>
            <td>${result.bno}</td>
            <td><a href="/read/${result.bno}" name="result.btitle"/>${result.btitle}</td>
            <td>${result.bupdatetime}</td>
            <td>${result.bhit}</td>
        </tr>
    </c:forEach>
</table>

<a href="/list" class="btn btn-primary" style="margin-left: 1300px;">목록</a>

<script>

    function pringpage() {
        var page;
        $.ajax({
            method: "GET",
            dataType: "json",
            data:{page: page},
            success: function (data) {
                console.log(data);
                var pagehtml = "";
                var next = data.next;
                var prev = data.prev;
                var startPage = data.startPage;
                var endPage = data.endPage;
                pageNum = data.cri.pageNum;

                if(prev) {
                    pagehtml += "<li class='paging_btn prev'><a class='page'> < </a></li>";
                }

                for(var i = startPage-1; i<endPage; i++)
                {
                    num = pageNum + i;

                    pagehtml += "<li class='paging_btn'><a class= 'page'  onclick=nextlist(" +  num + ")>" +  num + "</a></li>";
                }

                if(next) {
                    pagehtml += "<li class='paging_btn next'><a class='page'> > </a></li>";
                }
                $("#paging").html(pagehtml);
            }
        });
    }
</script>
</body>
</html>

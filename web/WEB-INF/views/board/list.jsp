<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-21
  Time: 오전 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>게시판 목록</title>

    <style>

        .paging li {
            float: left;
            font-size: 15px;
            margin-left: 50px;
            padding: 7px;
            font-weight: 200;

        }

        .paging_btn a {
            text-decoration-line: none;
        }

        .active {
            background-color: #cdd5ec;
        }

        .read {
            text-decoration-line: none;
        }

        .search_wrap {
            margin-left: 100px;
        }
    </style>
    <link rel="stylesheet" href="<c:url value="/css/background.css"/>">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script>
        var pageNum;

        function printpage() {
            var page;
            $.ajax({
                method:"GET",
                dataType:"json",
                url:"/paging",
                data: {page : page},
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

        function printlist() {
            var list;
            $.ajax ({
                method:"GET",
                dataType:"json",
                contentType: 'application/json; charset=utf-8',
                url:"/printlist",
                data: {list: list},
                success: function(data) {
                    var listhtml = "";
                    $.each(data, function(i) {
                        var string1 = "/read/" + data[i].bno;
                        var string2 = "/search/" + data[i].bwriter;
                        listhtml += "<tr>";
                        listhtml += "<td>" +data[i].bno + "</td>";
                        listhtml += "<td> <a href=" + string1 + ">" + data[i].btitle + "</a></td>";
                        listhtml += "<td> <a href=" + string2 + ">" + data[i].bwriter + "</a></td>";
                        listhtml += "<td>" + data[i].bupdatetime + "</td>";
                        listhtml += "<td>" + data[i].bhit + "</td>";
                        listhtml += "</tr>";
                    });
                    $("#tbody").html(listhtml);
                }
            })
        }

        function nextlist(num) {

            var obj = {"num":num};
            $.ajax ({
                method:"POST",
                dataType:"json",
                contentType: 'application/json; charset=utf-8',
                url:"/nextlist",
                data: JSON.stringify(obj),
                success: function(data) {
                    console.log(data);
                    var listhtml = "";
                    $.each(data.list, function(i, list) {
                        var string1 = "/read/" + list.bno;
                        var string2 = "/search/" + list.bwriter;
                        listhtml += "<tr>";
                        listhtml += "<td>" + list.bno + "</td>";
                        listhtml += "<td> <a href=" + string1 + ">" + list.btitle + "</a></td>";
                        listhtml += "<td> <a href=" + string2 + ">" + list.bwriter + "</a></td>";
                        listhtml += "<td>" + list.bupdatetime + "</td>";
                        listhtml += "<td>" + list.bhit + "</td>";
                        listhtml += "</tr>";
                    });
                    $("#tbody").html(listhtml);
                }
            })
        }


    </script>

</head>
<body style="background-color: ghostwhite;" onload="printpage(); printlist();">
<script src="https://code.jquery.com/jquery-3.4.1.min.js">
</script>

<jsp:include page="/static/header.jsp"/>

<table class="table table-hover" style="width:50%;  margin-top: 100px; margin-left: 460px;">
    <thead>
    <tr>
        <div style="margin-top:50px; margin-left: 450px; font-size: 25px;">
            <c:if test="${not empty page.cri.keyword}">

                검색결과 : '${page.cri.keyword}'
                <c:if test="${empty list}">
                    <br>검색결과없음
                </c:if>
                <br>
                <a href="/list">이전</a>
            </c:if>
        </div>
        <th>글번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성날짜</th>
        <th>조회수</th>
    </tr>
    </thead>
    <tbody id="tbody">

    </tbody>
</table>

<div class="paging_wrap" style="margin-left: 200px;">
    <div class="paging_area">
        <ul id="paging" class="pagination" style="margin-left: 700px;">
            <!--이전 페이지 버튼-->

            <c:if test= "${page.prev}"> <li class= 'paging_btn prev'><a class='page'
                 href="/list?pageNum=${page.startPage-1}&keyword=${page.cri.keyword}&type=${page.cri.type}"> < </a></li> </c:if>
            <!--각 번호 페이지 버튼-->
            <c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
                <li class="paging_btn ${page.cri.pageNum == num ? "active":""}">
                    <a class="page"
                       href="/list?pageNum=${num}&keyword=${page.cri.keyword}&type=${page.cri.type}">${num}</a>

                </li>

            </c:forEach>

            <!--다음 페이지 버튼-->
            <c:if test="${page.next}">
                <li class="paging_btn next"><a class="page"
                                               href="/list?pageNum=${page.endPage + 1}&keyword=${page.cri.keyword}&type=${page.cri.type}">
                    > </a></li>
            </c:if>
        </ul>
    </div>
</div>

<form id="moveForm" action="/printlist" method="get">
    <input type="hidden" name="pageNum" value="${page.cri.pageNum}">
    <input type="hidden" name="amount" value="${page.cri.amount}">
    <input type="hidden" name="keyword" value="${page.cri.keyword}">
    <input type="hidden" name="type" value="${page.cri.type}">
</form>

<form class="navbar-form navbar-left" style="margin-left: 700px;" role="search">
    <div class="form-group search_area">
        <select class="form-control" style="width:30%;" id="type" name="type">
            <option value="T" <c:out value="${page.cri.type eq 'T'?'selected':''}"/> >제목</option>
            <option value="C" <c:out value="${page.cri.type eq 'C'?'selected':''}"/> >내용</option>
            <option value="TC" <c:out value="${page.cri.type eq 'TC'?'selected':''}"/>>제목 + 내용</option>
        </select>
        <input class="form-control" style="width:65%;" id="keyword" type="text" name="keyword" onkeyup="enterSearch()"
               value="${page.cri.keyword}">
    </div>
    <button class="btn btn-default" type="button" onclick="Search()">검색</button>
</form>


<br><br>

<sec:authorize access="isAuthenticated()">
    <button class="btn btn-default" style="margin-left: -660px;" type="button" onclick="location.href='/write'">글쓰기
    </button>
    <br> <br>
</sec:authorize>

<jsp:include page="/static/footer.jsp"/>
<script>

    function Logout() {

        if (confirm("로그아웃하시겠습니까?")) {
            logout.click();
        } else {
        }
    }

    let moveForm = $("#moveForm");

    function enterSearch() {
        if (window.event.keyCode == 13) {
            Search();
        }
    }

    function Search() {

        let type = $("#type").val();
        let keyword = $("#keyword").val();

        var obj = {"type": type, "keyword":keyword};

        $.ajax({
            method: "POST",
            dataType: "json",
            url:"/searchlist",
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(obj),
            success: function (data) {
             console.log(data);
                var listhtml = "";
                $.each(data.list, function(i, list) {
                    var string1 = "/read/" + list.bno;
                    var string2 = "/search/" + list.bwriter;
                    listhtml += "<tr>";
                    listhtml += "<td>" + list.bno + "</td>";
                    listhtml += "<td> <a href=" + string1 + ">" + list.btitle + "</a></td>";
                    listhtml += "<td> <a href=" + string2 + ">" + list.bwriter + "</a></td>";
                    listhtml += "<td>" + list.bupdatetime + "</td>";
                    listhtml += "<td>" + list.bhit + "</td>";
                    listhtml += "</tr>";
                });
                $("#tbody").html(listhtml);

                var pagehtml ="";

                if(data.page.prev) {
                    pagehtml += "<li class='paging_btn prev'><a class='page'> < </a></li>";
                }

                for(var i = data.page.startPage-1; i<data.page.endPage; i++)
                {
                    var num = data.page.cri.pageNum + i;

                    pagehtml += "<li class='paging_btn'><a class= 'page'  onclick=nextlist(" +  num + ")>" +  num + "</a></li>";
                }

                if(data.page.next) {
                    pagehtml += "<li class='paging_btn next'><a class='page'> > </a></li>";
                }
                $("#paging").html(pagehtml);
            }
        });
    }


</script>


</body>
</html>

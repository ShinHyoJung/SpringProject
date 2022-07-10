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
    <script>
        function print(pageNum) {
            var keyword, typeOption, type;

            keyword = document.getElementById("keyword").value;
            typeOption = document.getElementById("type");
            type = typeOption.options[typeOption.selectedIndex].value;

            if(document.getElementById("keyword").value == "") {
                keyword = "";
            }

            var postObj = {"keyword":keyword, "type":type, "pageNum": pageNum};

            $.ajax ({
                method:"POST",
                dataType:"json",
                contentType: 'application/json; charset=utf-8',
                url:"/printlist",
                data: JSON.stringify(postObj),
                success: function(SearchResponse) {
                    console.log(SearchResponse);
                    var pagehtml ="";
                    var listhtml = "";

                    if(SearchResponse.paging.prev) {
                        pagehtml += "<li class='paging_btn prev'><a class='page'> < </a></li>";
                    }

                    for(var i = SearchResponse.paging.startPage; i<= SearchResponse.paging.endPage; i++)
                    {
                        if(pageNum == i) {
                            pagehtml += "<li class='paging_btn active'><a class= 'page' onclick=print(" +  i + ")>" +  i + "</a></li>";
                        }
                        else {
                            pagehtml += "<li class='paging_btn'><a class= 'page' onclick=print(" +  i + ")>" +  i + "</a></li>";
                        }

                    }

                    if(SearchResponse.paging.next) {
                        pagehtml += "<li class='paging_btn next'><a class='page'> > </a></li>";
                    }

                    if(SearchResponse.searchResponseList == "") {
                        listhtml += "검색결과가 없습니다.";
                    }

                    $.each(SearchResponse.searchResponseList, function(i, searchResponse) {
                        var string1 = "/read/" + searchResponse.bno;
                        var string2 = "/search/" + searchResponse.bwriter;
                        listhtml += "<tr>";
                        listhtml += "<td>" + searchResponse.bno + "</td>";
                        listhtml += "<td> <a href=" + string1 + ">" + searchResponse.btitle + "</a></td>";
                        listhtml += "<td> <a href=" + string2 + ">" + searchResponse.bwriter + "</a></td>";
                        listhtml += "<td>" + searchResponse.bupdatetime + "</td>";
                        listhtml += "<td>" + searchResponse.bhit + "</td>";
                        listhtml += "</tr>";
                    });

                    $("#paging").html(pagehtml);
                    $("#tbody").html(listhtml);

                }
            })
        }

    </script>

</head>
<body style="background-color: ghostwhite;" onload="print();">
<script src="https://code.jquery.com/jquery-3.4.1.min.js">
</script>

<jsp:include page="/static/header.jsp"/>

<table class="table table-hover" style="width:50%;  margin-top: 100px; margin-left: 460px;">
    <thead>
    <tr>
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
        </ul>
    </div>
</div>

<form id="moveForm">
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
    <button class="btn btn-default" type="button" onclick="print();">검색</button>
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

</script>


</body>
</html>

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
            font-size:15px;
            margin-left: 50px;
            padding: 7px;
            font-weight: 200;

        }

        .paging_btn a{
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
    <link rel="stylesheet" href="\resources\css\background.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body style="background-color: ghostwhite;">
<script src="https://code.jquery.com/jquery-3.4.1.min.js">
</script>

<nav class="navbar navbar-default"  style="background-color: ghostwhite; border: 0; max-width: 800px; margin: 25px auto;">
    <a class="navbar-brand" style="color: thistle">Board</a>

    <div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav" style="float:right;">
            <li class="active"><a class = "nav-menu" href="/" >홈</a></li>
            <c:if test="${not empty sessionScope.idx}">
                <li class="active"><a class = "nav-menu" href="/list" style=""> 게시판 </a></li>
                <div class="nav-underline"></div>
            </c:if>
        </ul>
    </div>
    </div>
</nav>

    <table class="table table-hover" style="width:50%;  margin-top: 100px; margin-left: 300px;">
        <tr>
            <div style="margin-left: 300px;">
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
        <tr>
            <c:forEach items="${list}" var="list">
            <td>${list.bno}</td>
            <td><a class = "read" href="/read/${list.bno}" name="list.btitle"/>
                <c:if test="${list.bpin ==1}">
                    [공지]
                </c:if> ${list.btitle}</td>
            <td><a class="read" href="/search/${list.bwriter}" name="list.bwriter"/>${list.bwriter}</td>
            <td>${list.bupdatetime}</td>
            <td>${list.bhit}</td>
        </tr>
        </c:forEach>
    </table>

<div class="paging_wrap">
    <div class="paging_area">
        <ul id="paging" class="pagination" style="margin-left: 500px;">
            <!--이전 페이지 버튼-->
            <c:if test="${page.prev}">
                <li class="paging_btn prev"><a class="page" href="/list?pageNum=${page.startPage-1}&keyword=${page.cri.keyword}&type=${page.cri.type}" > < </a></li>
            </c:if>

            <!--각 번호 페이지 버튼-->
            <c:forEach var ="num" begin = "${page.startPage}" end="${page.endPage}">
                <li class = "paging_btn ${page.cri.pageNum == num ? "active":""}">
                    <a class="page" href="/list?pageNum=${num}&keyword=${page.cri.keyword}&type=${page.cri.type}">${num}</a>

                </li>

            </c:forEach>

            <!--다음 페이지 버튼-->
            <c:if test="${page.next}">
                <li class="paging_btn next"><a class="page" href="/list?pageNum=${page.endPage + 1}&keyword=${page.cri.keyword}&type=${page.cri.type}"> > </a></li>
            </c:if>
        </ul>
    </div>
</div>

    <form id="moveForm" action="/list" method="get">
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
            <input class="form-control" style="width:65%;" id="keyword" type="text" name="keyword" onkeyup="enterSearch()" value="${page.cri.keyword}">
        </div>
            <button class="btn btn-default" type="button" onclick="Search()">검색</button>
    </form>


<br><br>

<c:if test="${not empty sessionScope.idx}">
<button class="btn btn-default" style="margin-left: -790px;" type="button" onclick="location.href='/write'">글쓰기</button> <br> <br>
</c:if>

    <form class="navbar-form navbar-right" style="width: 101%;">
        <div style="margin-left: 1600px;">
            <c:choose>
            <c:when test="${not empty sessionScope.idx}">
            <button class = "btn btn-default navbar-btn" type="button" onclick="Logout()">로그아웃</button>
            <a id="logout" href="/Logout"></a>
            <a class= "btn btn-default" href="/info">회원정보</a>
            </c:when>
            <c:otherwise>
                <a class="btn btn-default navbar-btn" href="/Login">로그인</a>
                <a class="btn btn-default navbar-btn" href="/beforeSignup">회원가입</a>
            </c:otherwise>
            </c:choose>
        </div>
    </form>
<script>

        function Logout() {

            if(confirm("로그아웃하시겠습니까?")) {
                logout.click();
            } else {
            }
        }

        let moveForm = $("#moveForm");

        function enterSearch() {
            if(window.event.keyCode == 13) {
                Search();
            }
        }

        function Search() {

            let type = $("#type").val();
            let keyword = $("#keyword").val();
            moveForm.find("input[name='type']").val(type);
            moveForm.find("input[name='keyword']").val(keyword);
            moveForm.find("input[name='pageNum']").val(1);
            moveForm.submit();
        }


</script>


</body>
</html>

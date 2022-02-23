<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-21
  Time: 오전 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>게시판 목록</title>
    <style>
        table {
            margin-left: 120px;
        }
        .paging {
            list-style: none;
            display: inline-block;
            margin: 0px 0 0 25px;

        }

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
    </style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<h1>게시판</h1>
    <table>
        <tr>
          <th>글번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>작성날짜</th>
          <th>조회수</th>
        </tr>
        <c:forEach items="${list}" var="list">
        <tr>
            <td>${list.bno}</td>
            <td><a href="/read/${list.bno}" name="list.btitle"/>${list.btitle}</td>
            <td><a href="/search/${list.bwriter}" name="list.bwriter"/>${list.bwriter}</td>
            <td>${list.bupdatetime}</td>
            <td>${list.bhit}</td>
        </tr>
        </c:forEach>
    </table>

<div class="paging_wrap">
    <div class="paging_area">
        <ul id="paging" class="paging">
            <!--이전 페이지 버튼-->
            <c:if test="${page.prev}">
                <li class="paging_btn previous"><a href="/list?pageNum=${page.startPage-1}"> < </a></li>
            </c:if>

            <!--각 번호 페이지 버튼-->
            <c:forEach var ="num" begin = "${page.startPage}" end="${page.endPage}">
                <li class = "paging_btn ${page.cri.pageNum == num ? "active":""}"><a href="/list?pageNum=${num}">${num}</a></li>
            </c:forEach>

            <!--다음 페이지 버튼-->
            <c:if test="${page.next}">
                <li class="paging_btn next"><a href="/list?pageNum=${page.endPage + 1}"> > </a></li>
            </c:if>
        </ul>
    </div>
</div>

    <div class="search_wrap">
        <div class="search_area">
            <input id="keyword" type="text" name="keyword" value="${page.cri.keyword}">
            <button id="search">검색</button>
        </div>
    </div>

<a id="search_result" href=""></a>

<br><br>

    <a href="/info">회원정보</a>
    <a href="/write">글쓰기</a>

<script>

        $("#search").click(function () {

            let keyword = $("#keyword").val();
            $("#search_result").attr("href","/list?keyword="+keyword);
            $("#search_result").get(0).click();
        });

</script>


</body>
</html>

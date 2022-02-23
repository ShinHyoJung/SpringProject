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
        .pageInfo {
            list-style: none;
            display: inline-block;
            margin: 0px 0 0 25px;

        }

        .pageInfo li {
            float: left;
            font-size:15px;
            margin-left: 18px;
            padding: 7px;
            font-weight: 200;

        }

        .pageInfo_btn a{
            text-decoration-line: none;
        }

        .active {
            background-color: #cdd5ec;
        }
    </style>
</head>
<body>
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
            <td>${list.bwriter}</td>
            <td>${list.bupdatetime}</td>
            <td>${list.bhit}</td>
        </tr>
        </c:forEach>
    </table>

<div class="pageInfo_wrap">
    <div class="pageInfo_area">
        <ul id="pageInfo" class="pageInfo">
            <!--이전 페이지 버튼-->
            <c:if test="${page.prev}">
                <li class="pageInfo_btn previous"><a href="/list?pageNum=${page.startPage-1}"> < </a></li>
            </c:if>

            <!--각 번호 페이지 버튼-->
            <c:forEach var ="num" begin = "${page.startPage}" end="${page.endPage}">
                <li class = "pageInfo_btn ${page.cri.pageNum == num ? "active":""}"><a href="/list?pageNum=${num}">${num}</a></li>
            </c:forEach>

            <!--다음 페이지 버튼-->
            <c:if test="${page.next}">
                <li class="pageInfo_btn next"><a href="/list?pageNum=${page.endPage + 1}"> > </a></li>
            </c:if>
        </ul>
    </div>
</div>

    <form id="moveForm" method="get">
        <input type="hidden" name="pageNum" value="${page.cri.pageNum}">
        <input type="hidden" name="amount" value = "${page.cri.amount}">
    </form>

    <a href="/info">회원정보</a>
    <a href="/write">글쓰기</a>

<script>


</script>


</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: nandsoft
  Date: 2022-02-21
  Time: 오전 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

        .read {
            text-decoration-line: none;
        }

        .search_wrap {
            margin-left: 100px;
        }
    </style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<h1>게시판</h1>
    <table>
        <tr>
            <c:if test="${not empty page.cri.keyword}">
                검색결과 : ${page.cri.keyword} <br>
                <a href="/list">이전</a>
            </c:if>
          <th>글번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>작성날짜</th>
          <th>조회수</th>
        </tr>
        <c:forEach items="${list}" var="list">
        <tr>
            <td>${list.bno}</td>
            <td><a class = "read" href="/read/${list.bno}" name="list.btitle"/>${list.btitle}</td>
            <td><a class="read" href="/search/${list.bwriter}" name="list.bwriter"/>${list.bwriter}</td>
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

    <div class="search_wrap">
        <div class="search_area">
            <select id="type" name="type">
                <option value="" <c:out value="${page.cri.type == null?'selected':''}"/> >--</option>
                <option value="T" <c:out value="${page.cri.type eq 'T'?'selected':''}"/> >제목</option>
                <option value="C" <c:out value="${page.cri.type eq 'C'?'selected':''}"/> >내용</option>
                <option value="TC" <c:out value="${page.cri.type eq 'TC'?'selected':''}"/>>제목 + 내용</option>
            </select>
            <input id="keyword" type="text" name="keyword" value="${page.cri.keyword}">
            <button id="search">검색</button>
        </div>
    </div>

<br><br>

    <a href="/info">회원정보</a>
    <a href="/write">글쓰기</a>

<script>

        let moveForm = $("#moveForm");

        $("#search").on("click", function () {

            let type= $("#type").val();
            let keyword = $("#keyword").val();
            moveForm.find("input[name='type']").val(type);
            moveForm.find("input[name='keyword']").val(keyword);
            moveForm.find("input[name='pageNum']").val(1);
            moveForm.submit();
        });


</script>


</body>
</html>

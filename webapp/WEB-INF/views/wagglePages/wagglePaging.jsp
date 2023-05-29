<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-04-28
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>🥬 배추마켓 : 와글와글 </title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <style>
        #section {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh; /* 섹션의 전체 높이를 화면 높이로 설정 */
        }
    </style>

</head>
<body>
<%@include file="../component/nav.jsp" %>

<div id="section">

    <%--  제목을 기준으로 검색 기능 --%>
    <div class="container" id="search-area">
        <form action="/waggle/paging" method="get">
            <select name="type" style="margin-top: 30px">

                <option value="boardTitle">제목</option>
                <option value="boardWriter">작성자</option>

            </select>

            <i class="bi bi-search"></i> <input type="text" name="q" placeholder="검색어를 입력하세요">
            <input type="submit" value="검색">
        </form>
    </div>

    <button onclick="trade_write()" style="float: right; margin-bottom: 15px;margin-right: 30%"><i class="bi bi-pencil-square"></i> 글 쓰기</button><br>



    <div class="container" id="list">
        <table class="table table-striped table-hover text-center">
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>

            </tr>
            <c:forEach items="${boardList}" var="board">
                <tr>
                    <td>${board.id}</td>
                    <td>
                        <a href="/waggle?id=${board.id}&page=${paging.page}&q=${q}&type=${type}">${board.boardTitle}</a>
                    </td>
                    <td>${board.boardWriter}</td>
                    <td>
                        <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                    </td>
                    <td>${board.boardHits}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="container">
        <ul class="pagination justify-content-center">
            <c:choose>
                <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌  > choose 내 내용 --%>
                <c:when test="${paging.page<=1}">
                    <li class="page-item disabled">
                        <a class="page-link">[이전]</a>
                    </li>
                </c:when>
                <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/waggle/paging?page=${paging.page-1}&q=${q}&type=${type}">[이전]</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <%--  for(int i=startPage; i<=endPage; i++)      --%>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 [이전] --%>
                    <%--          eq 같다--%>
                    <c:when test="${i eq paging.page}">
                        <li class="page-item active">
                            <a class="page-link">${i}</a>
                        </li>
                    </c:when>

                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/waggle/paging?page=${i}&q=${q}&type=${type}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <%--      요청한 페이지 의 경우에 대해 [다음] 메뉴 비활성화 설정 --%>
            <c:choose>
                <c:when test="${paging.page>=paging.maxPage}">
                    <li class="page-item disabled">
                        <a class="page-link">[다음]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/waggle/paging?page=${paging.page+1}&q=${q}&type=${type}">[다음]</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>

    </div>
</div>
<%@include file="../component/footer.jsp" %>
</body>

<script>
    const trade_write = () => {
        location.href = "/waggle/save";
    }

</script>
</html>
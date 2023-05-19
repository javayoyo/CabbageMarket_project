<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-11
  Time: 오후 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<html>
<head>
    <title>글목록</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script src="../js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">


</head>
<body>
<%@include file="../component/nav.jsp"%>

<div id = "section">
    <table>
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성시간</th>
            <th>조회수</th>
        </tr>

        <button onclick="trade_write()"><i class="bi bi-pencil-square"></i> 글 쓰기</button>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.id}</td>
                <td><a href="/board?id=${board.id}">${board.boardTitle}</a></td>
                <td>${board.boardWriter}</td>
                <td><fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                </td>
                <td>${board.boardHits}</td>
            </tr>
        </c:forEach>
    </table>


</div>

<%@include file="../component/footer.jsp"%>


</body>

<script>
    const trade_write = () => {
        location.href = "/board/save";
    }

</script>
</html>

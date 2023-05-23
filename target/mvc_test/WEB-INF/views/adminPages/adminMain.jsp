<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-09
  Time: 오전 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title> 🥬 배추마켓 : 관리자페이지 </title>
  <link rel="stylesheet" href="/resources/css/main.css">
  <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

  <style>
    #section {

      justify-content: center;
      align-items: center;
      text-align: center;
      font-size: 50px;
    }
  </style>

</head>
<body>
<%@include file="../component/nav.jsp"%>

<div id="section">
  ${sessionScope.loginEmail} 님 마이페이지입니다. <br>

  <button onclick="update()">관리자 정보 수정</button> <br> <br>

  <button onclick="member_list()">회원목록 조회</button>

</div>

<%@include file="../component/footer.jsp"%>
</body>
<script>

  const update = () => {
    location.href = "/member/update";
  }

  const member_list = () => {
    location.href = "/member/list";

  }


</script>
</html>

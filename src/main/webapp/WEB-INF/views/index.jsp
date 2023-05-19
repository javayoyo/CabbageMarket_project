<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-18
  Time: 오전 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> 🥬 배려와 나눔을 추구하는 배추마켓  </title>
    <link rel="stylesheet" href="./resources/css/main.css">
<style>
    .container {
        overflow: hidden;
    }
    img {
        display: inline-block;
        text-align: center;
    }
    hi {
        text-align: center;
        margin-left: 20px;
        font-size: 50px;
    }
</style>
</head>
<body>
<%@include file="./component/nav.jsp"%>


<div id = "section">

   <div class="container">

    <h1>
        <br>
배려를 추구하는 <br>
배추마켓
        <img src="/resources/img/거래거래.jpg">
    </h1>


   </div>


</div>


<%@include file="./component/footer.jsp"%>

</body>
</html>

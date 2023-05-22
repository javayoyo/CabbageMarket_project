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
            margin-left: 30px;
            height: 300px;
            width: 500px;
        }
        h2, p{
            text-align: left;
            margin-left: 5px;
        }
    </style>
</head>
<body>
<%@include file="./component/nav.jsp"%>


<div id = "section">

    <div class="container">
        <img src="/resources/img/거래거래.jpg">
        <h2>배려를 추구하는 <br>
        배추마켓</h2>
        <p>중고 거래부터 동네 정보까지, 이웃과 함께해<br>
        가깝고 따뜻한 배려를 추구하는 마음을 만들어요.</p>
    </div>


    <div class="container">
        <img src="/resources/img/채팅화면.png">
        <h2>우리 동네<br>
            중고 직거래 마켓</h2>
        <p>동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요.</p>

    </div>

    <div class="container">
        <img src="/resources/img/채팅화면.png">
        <h2>이웃과 함께 하는<br>
            동네 생활</h2>
        <p>우리 동네의 다양한 이야기를 이웃과 함께 나누어요.</p>

    </div>


</div>


<%@include file="./component/footer.jsp"%>

</body>
</html>

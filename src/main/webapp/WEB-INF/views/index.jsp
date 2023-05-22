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

        div {
            overflow: hidden;
        }

        #img1, #img3 {
            height: 500px;
            width: 500px;
            float: right;
            margin-right: 10px;

        }

        #img2 {
            height: 500px;
            width: 500px;
            float: left;
            margin-left: 10px;

        }


        h2, p{

        }
    </style>
</head>
<body>
<%@include file="./component/nav.jsp"%>


<div id = "section">

    <div class="container1">


        <img src="/resources/img/거래거래.jpg" id="img1">
    </div>



    <div class="container2">
        <img src="/resources/img/채팅화면.png" id="img2">


    </div>

    <div class="container3">
        <img src="/resources/img/채팅화면.png" id="img3">


    </div>


</div>


<%@include file="./component/footer.jsp"%>

</body>
</html>

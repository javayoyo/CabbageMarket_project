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

        * {
            cursor: url("/resources/img/배추추.jpeg") 20 30, url("/resources/img/배추추.jpeg") 20 30, auto;
        }

        div {
            overflow: hidden;
        }

        #img1,#img3 {
            height: 1000px;
            width: 1200px;
            text-align: center;
            display: block;
            margin-left: 200px;


        }
        #img2 {
            height: 1000px;
            width: 1200px;
            text-align: center;
            display: block;
            margin-right: 200px;


        }

        #section1, #section2, #section3 {
            height: 1500px;
            padding: 200px;

        }



        h2{ font-size: 60px;

        }

        p { font-size: 50px;

        }
        .container1, .container2, .container3 {
         display: flex;
            justify-content: center;
        }


    </style>
</head>
<body>
<%@include file="./component/nav.jsp"%>


<div id = "section1" style="background-color: #efeadd; ">

    <div class="container1">

    <div style="margin-left: 30px; float: left;" >
        <h2>배려를 추구하는 <br>
            배추마켓</h2> <br>
        <p>중고 거래부터 동네 정보까지, 이웃과 함께해<br>
            가깝고 따뜻한 배려를 추구하는 마음을 만들어요.</p>
    </div>


        <img src="/resources/img/거래거래.jpg" id="img1">
    </div>

</div>


<div id = "section2" style="background-color: #dfeac9 ; ">

    <div class="container2">
        <img src="/resources/img/채팅화면.png" id="img2">
        <div style="margin-right: 30px; float: right;" >

            <h2>우리 동네<br>
                중고 직거래 마켓</h2> <br>
            <p>동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요.</p>
        </div>

    </div>


</div>



<div id = "section3" style="background-color: #e7e8e5 ;">

    <div class="container3">
        <div style="margin-left: 30px; float: left;" >

            <h2>이웃과 함께 하는<br>
                동네 생활</h2> <br>
            <p>우리 동네의 다양한 이야기를 이웃과 함께 나누어요.</p>

        </div>
        <img src="/resources/img/이웃2.png" id="img3">
    </div>


</div>


<%@include file="./component/footer.jsp"%>

</body>
</html>

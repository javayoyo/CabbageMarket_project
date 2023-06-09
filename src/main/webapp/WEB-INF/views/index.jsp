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



<%--    <style type="text/css">* {cursor: url(https://cur.cursors-4u.net/nature/nat-10/nat976.ani), url(https://cur.cursors-4u.net/nature/nat-10/nat976.gif), auto !important;}</style><a href="https://www.cursors-4u.com/cursor/2011/12/15/corgi-tail-wagging.html" target="_blank" title="Corgi Tail Wagging"><img src="https://cur.cursors-4u.net/cursor.png" border="0" alt="Corgi Tail Wagging" style="position:absolute; top: 0px; right: 0px;" /></a>--%>

    <style>

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

        button {
            display: block;
            margin: 0 auto;
        }


    </style>
</head>
<body>
<%@include file="./component/nav.jsp"%>

<button onclick="dark_mode()">다크모드</button>


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

<script>
    const dark_mode = () => {

        const section1 = document.getElementById("section1");
        const section2= document.getElementById("section2");
        const section3= document.getElementById("section3");


        section1.style.color = "white";
        section1.style.background = "black";
        section2.style.color = "white";
        section2.style.background = "black";
        section3.style.color = "white";
        section3.style.background = "black";

    }
</script>


</html>

<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-17
  Time: 오후 2:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title> 🥬 배추마켓 : 거래하기 </title>
  <link rel="stylesheet" href="/resources/css/main.css">
  <style>
    iframe {
      display: block;
      margin: auto;
    }
  </style>

</head>
<body>

<%@include file="../component/nav.jsp"%>

<div id="section">

<h2 style="text-align: center;font-size: 30px"> " 실시간으로 거래를 진행해보세요 " </h2>
<p style="text-align: center;font-size: 20px"> * 대화명은 본인의 계정으로 입장하셔야 거래가 가능합니다. * </p> <br>
  <p style="text-align: center;font-size: 20px"> * 거래하려는 해당 글 번호를 통해, 원활한 거래가 가능합니다. * </p> <br>


<iframe src="https://service.dongledongle.com/market" frameborder="0" width="70%" height="800"></iframe> <br>

<input type="button" onclick="index()" style="text-align: center; display: block; margin: 0 auto" value="처음으로"> <br>

</div>


<%@include file="../component/footer.jsp"%>
</body>



<script>
  const index = () => {
    location.href = "/";
  }
</script>
</html>

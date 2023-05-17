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
    <title>Title</title>
</head>
<body>
<h2>실시간으로 거래를 진행해보세요</h2>

<iframe src="https://service.dongledongle.com/market" frameborder="0" width="100%" height="300"></iframe>

<input type="button" value="처음으로">
<button onclick="gogle_login()">구글로그인</button>


</body>


<%--해당 로그인 버튼 누르면 로그인 화면으로 실행안돼 확인요망--%>
<script>
    const gogle_login = () => {
      location.href = "/memberPages/gogleLogin";
    }
</script>
</html>

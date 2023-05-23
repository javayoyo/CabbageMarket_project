<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-18
  Time: 오전 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    a {
        font-size: 50px;
    }
</style>


<div id="nav">

    <ul>
        <li>
            <a href="/" style="color: #6ad959"> 🥬 배추마켓 </a>
        </li>
        <li>
            <a href="/member/trade">거래하기</a>
        </li>
        <li>
            <a href="/board/paging">거래목록</a>
        </li>

        <li>
            <a href="/board/board">와글와글</a>
        </li>


        <li class="admin-name" id="admin-area">

        </li>


        <li class="login-name" id="login-area" style="padding: 20px">

        </li>

    </ul>


</div>
<script>
const loginArea = document.getElementById("login-area");

const loginEmail = '${sessionScope.loginEmail}';
console.log(loginEmail.length);

if(loginEmail.length != 0 ) {

    loginArea.innerHTML = "<a href='/member/mypage' style='color:black;'>"+loginEmail + "님 마이페이지</a>"+
        "<a href='/member/logout'>logout</a>";

} else {
    loginArea.innerHTML = "<a href='/member/login'>login</a>";
}


</script>
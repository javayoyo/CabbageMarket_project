<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-09
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    a {
        margin-right: 20px;
    }
</style>


<div id="footer">
    <div style="margin-top: 20px">
        <sapn>
    <b>대표</b>
    김배추, 이열무
    </sapn> <br>
    <sapn>
        <b>사업자등록번호</b>
        123-45678678-94549434
    </sapn> <br>
    <sapn>
        <b>주소</b>
        서울특별시 배추구 무도사30길 10, 404호 (배추서비스)
    </sapn> <br>
    <sapn>
        <b>대표전화</b>
        1234-5678
    </sapn>


    <div><br><br><a href="/member/terms">이용약관</a><a href="/member/privacy">개인정보처리방침</a><a href="/member/location">위치기반서비스 이용약관</a></div>

</div>

</div>

<script>
  const date = new Date();
  console.log(date);
  console.log(date.getFullYear());
  const footer = document.getElementById("footer");
  footer.innerHTML = <p>&copy; " + date.getFullYear() + "&nbsp; HRDKOREA  All rights reserved.</p>
      ;





</script>

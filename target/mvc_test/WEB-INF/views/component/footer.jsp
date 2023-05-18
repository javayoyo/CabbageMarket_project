<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-09
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="footer">

</div>

<script>
  const date = new Date();
  console.log(date);
  console.log(date.getFullYear());
  const footer = document.getElementById("footer");
  footer.innerHTML = "<p>&copy; " + date.getFullYear() + "&nbsp; HRDKOREA  All rights reserved.</p>" +
      "<br><br><a>이용약관</a><a>개인정보처리방침</a>";







</script>

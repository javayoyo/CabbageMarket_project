<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-10
  Time: 오전 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> 🥬 배추마켓 : 회원정보수정</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>


</head>
<body>

<%@include file="../component/nav.jsp"%>


<div id = "section">

    <form action="/member/update" method="post"  name="updateForm" >
        <input type="text" name="id" value="${member.id}" readonly> <br>
        <input type="text" name="memberEmail" value="${member.memberEmail}" placeholder="이메일"> <br>
        <input type="text" name="memberPassword" id="memberPassword" placeholder="비밀번호"> <br>
        <input type="text" name="memberName" value="${member.memberName}" placeholder="이름"> <br>
        <input type="text" name="memberMobile"  value="${member.memberMobile}" placeholder="전화번호"> <br>
        <input type="button" onclick="update_check()" value="수정">
    </form> <br>

    <button onclick="member_delete()">회원 탈퇴</button><br>

</div>


<%@include file="../component/footer.jsp"%>
</body>
<script>
    const update_check = () => {
        const inputPass = document.getElementById("memberPassword").value;
        const DBPass  = '${member.memberPassword}';
        if(inputPass == DBPass) {
            document.updateForm.submit();
        }else {
            alert("비밀번호가 일치하지 않습니다!");
        }
    }

    const member_delete = () => {
        const id  = '${member.id}';
        location.href = "/member/delete?id=" + id;
        alert(" 탈퇴처리 되었습니다. ")


    }

</script>
</html>
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
        <input type="text" name="memberName" value="${member.memberName}" placeholder="이름"> <br>
        <input type="text" name="memberMobile"  value="${member.memberMobile}" placeholder="전화번호"> <br> <br>
        <input type="text" name="memberPassword" id="memberPassword" placeholder="비밀번호"> <br>
        <p> * 내용 수정 및 비밀번호 입력 후, 수정 버튼을 눌러주세요 * </p> <br>
        <p>* 이름과 전화번호만 수정 가능합니다 *</p> <br>
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
            alert("수정완료");
        }else {
            alert("비밀번호가 일치하지 않습니다!");
        }
    }

    const member_delete = () => {
        const result = confirm("정말로 탈퇴하시겠습니까?");
        if(result) {
        const id  = '${member.id}';
        location.href = "/member/delete?id=" + id;
        alert(" 탈퇴완료! 이용해주셔서 감사합니다 :) ") }
        else {
            alert("탈퇴 취소! 다시 돌아와서 기뻐요 :) ")
            location.href = "/";
        }


    }

</script>
</html>
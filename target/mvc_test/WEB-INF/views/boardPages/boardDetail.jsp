<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-04-28
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
  <title>🥬 배추마켓 : 거래목록 </title>
  <link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<%@include file="../component/nav.jsp" %>

<div id="section">
  <table>


    <tr>
      <th>id</th>
      <td>${board.id}</td>
    <tr>
      <th>writer</th>
      <td>${board.boardWriter}</td>
    </tr>
    <tr>
      <th>date</th>
      <td>
        <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
      </td>
    </tr>
    <tr>
      <th>hits</th>
      <td>${board.boardHits}</td>
    </tr>
    <tr>
      <th>title</th>
      <td>${board.boardTitle}</td>
    </tr>
    <tr>
      <th>contents</th>
      <td>${board.boardContents}</td>
    </tr>


    <c:if test="${board.fileAttached == 1}">
      <tr>
        <th>image</th>
        <td>
          <c:forEach items="${boardFileList}" var="boardFile">
            <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                 alt="" width="100" height="100">
          </c:forEach>
        </td>
      </tr>


    </c:if>




  </table>
  <button onclick="board_list()">목록</button>
  <button onclick="board_update()">수정</button>
  <button onclick="board_delete()">삭제</button> <br>



<%--  // 좋아요 버튼을 생성하는 코드--%>
<%--  // 좋아요 이미지는 부트스트랩 아이콘의 heart.svg, heart-fill.svg 저장해서 사용--%>
<%--  // heart : 좋아요O, heart-fill : 좋아요X--%>
<%--  // 경로는 resouces폴더의 icon폴더안에 저장--%>
<%--  // 이미지 경로는 맥 기준이므로 윈도우사용자는 윈도우에 맞게 변경할 것--%>
<%--  <div>--%>
<%--    <a class="text-dark heart">--%>
<%--      <img id="heart" height="30px" width="30px" src="/resources/img/heart.svg">--%>
<%--      좋아요${heart.heart}--%>
<%--    </a>--%>
<%--  </div>--%>



  <div id="comment-write-area">
    <input type="text" id="comment-writer" value="${sessionScope.loginEmail}" placeholder="작성자">
    <input type="text" id="comment-contents" placeholder="댓글 내용">
    <button onclick="comment_write()">댓글작성</button>
  </div>
  <div id="comment-list">
    <c:choose>
      <c:when test="${commentList == null}">
        <h2>작성된 댓글이 없습니다.</h2>
      </c:when>
      <c:otherwise>


        <table>

          <tr>
            <th>id</th>
            <th>작성자</th>
            <th>내용</th>
            <th>작성시간</th>

          </tr>
          <c:forEach items="${commentList}" var="comment">
            <tr>
              <td>${comment.id}</td>
              <td>${comment.commentWriter}</td>
              <td>${comment.commentContents}</td>
              <td>
                <fmt:formatDate value="${comment.commentCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
              </td>
              <td>
                <button onclick="delete_comment(${comment.id})">댓글 삭제</button>
              </td>


            </tr>
          </c:forEach>
        </table>
      </c:otherwise>
    </c:choose>
  </div>

</div>
<%@include file="../component/footer.jsp" %>
</body>
<script>
  const comment_write = () => {
    const commentWriter = document.getElementById("comment-writer").value;
    const commentContents = document.getElementById("comment-contents").value;
    const boardId = '${board.id}';
    const result = document.getElementById("comment-list");
    $.ajax({
      type: "post",
      url: "/comment/save",
      data: {
        "commentWriter": commentWriter,
        "commentContents": commentContents,
        "boardId": boardId
      },
      success: function (res) {
        console.log(res);
        updateCommentList(res);
        let output = "<table>";
        output += "<tr>";
        output += "<th>id</th>";
        output += "<th>작성자</th>";
        output += "<th>내용</th>";
        output += "<th>작성시간</th>";

        output += "</tr>";
        for(let i in res) {
          output += "<tr>";
          output += "<td>" + res[i].id + "</td>";
          output += "<td>" + res[i].commentWriter + "</td>";
          output += "<td>" + res[i].commentContents + "</td>";
          output += "<td>" + moment(res[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";

          output += "</tr>";
        }
        output += "</table>";
        result.innerHTML = output;


        document.getElementById("comment-writer").value = "${sessionScope.loginEmail}";
        document.getElementById("comment-contents").value = "";


      }
      ,
      error: function () {
        console.log("실패");
      }
    });
  }
  // 검색 > 1이외의 페이지 숫자 선택 > 상세 후 목록 조회 > 해당 선택한 페이징 그대로 유지
  const board_list = () => {
    const type = '${type}';
    const q = '${q}';
    const page = '${page}';
    location.href = "/board/paging?page=" + page + "&type=" +


            type +  "&q=" + q;
  }

  // 본인이 아니면 수정, 삭제 버튼 기능 비활성화로 클릭해도 미실행(수정,삭제확인완)
  const board_update = () => {
    <c:if test="${board.boardWriter == sessionScope.loginEmail}">
    const id = '${board.id}';
    location.href = "/board/update?id=" + id;

    </c:if>

  }

  const board_delete = () => {
    <c:if test="${board.boardWriter == sessionScope.loginEmail or sessionScope.loginEmail == 'admin'}">
    const id = '${board.id}';
    location.href = "/board/delete?id=" + id;

    </c:if>

  }

  <%--// 좋아요 만들기 테스트중--%>
  <%--$(function () {--%>

  <%--  // 좋아요가 있는지 확인한 값을 heartval에 저장--%>

  <%--  var heartval = '${heart.heart}';--%>
  <%--  // heartval이 1이면 좋아요가 이미 되있는것이므로 heart-fill.svg를 출력하는 코드--%>
  <%--  if(heartval>0) {--%>
  <%--    console.log(heartval);--%>
  <%--    $("#heart").prop("src", "/resources/img/heart-fill.svg");--%>
  <%--    $(".heart").prop('name',heartval)--%>
  <%--  }--%>
  <%--  else {--%>
  <%--    console.log(heartval);--%>
  <%--    $("#heart").prop("src", "/resources/img/heart.svg");--%>
  <%--    $(".heart").prop('name',heartval)--%>
  <%--  }--%>

  <%--  // 좋아요 버튼을 클릭 시 실행되는 코드--%>
  <%--  $(".heart").on("click", function () {--%>
  <%--    var that = $(".heart");--%>
  <%--    $.ajax({--%>
  <%--      url :'/board/heart',--%>
  <%--      type :'POST',--%>
  <%--      data : {'boardId':${board.id}, 'memberId':${sessionScope.memberId}},--%>
  <%--      success : function(data){--%>
  <%--        that.prop('name',data);--%>
  <%--        if(data==1) {--%>
  <%--          $('#heart').prop("src","/resources/img/heart-fill.svg");--%>
  <%--        } else {--%>
  <%--          $('#heart').prop("src","/resources/img/heart.svg");--%>
  <%--        }--%>
  <%--      }--%>
  <%--    });--%>
  <%--  });--%>


  <%--});--%>

  const delete_comment = (commentId) => {
    $.ajax({
      type: "POST",
      url: "/comment/delete",
      data: {
        "commentId": commentId
      },
      success: function (res) {




        console.log(res);
        // 댓글 삭제 후 업데이트된 댓글 목록을 가져와서 화면에 출력
        updateCommentList(res);
      },
      error: function () {
        console.log("댓글 삭제 실패");
      }
    });
  }

  const updateCommentList = (comments) => {
    const result = document.getElementById("comment-list");
    let output = "<table>";
    output += "<tr>";
    output += "<th>id</th>";
    output += "<th>작성자</th>";
    output += "<th>내용</th>";
    output += "<th>작성시간</th>";
    output += "</tr>";
    for (let i in comments) {
      output += "<tr>";
      output += "<td>" + comments[i].id + "</td>";
      output += "<td>" + comments[i].commentWriter + "</td>";
      output += "<td>" + comments[i].commentContents + "</td>";
      output += "<td>" + moment(comments[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";
      output += "<td><button onclick='delete_comment(" + comments[i].id + ")'>댓글 삭제</button></td>";
      output += "</tr>";
    }
    output += "</table>";
    result.innerHTML = output;
  }





</script>
</html>
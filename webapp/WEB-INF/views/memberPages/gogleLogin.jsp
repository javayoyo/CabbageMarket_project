<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: user--%>
<%--  Date: 2023-05-17--%>
<%--  Time: 오후 4:28--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title> 🥬 배추마켓 : 구글로그인  </title>--%>
<%--    <link rel="stylesheet" href="/resources/css/main.css">--%>
<%--  <!-- content에 자신의 OAuth2.0 클라이언트ID를 넣습니다. -->--%>
<%--  <meta name ="google-signin-client_id" content="877385374864-uoqr55bv64a8dh5t9jo5pv8lgs75m6e7.apps.googleusercontent.com">--%>
<%--</head>--%>
<%--<body>--%>

<%--<ul style="list-style-type: none">--%>
<%--  <li id="GgCustomLogin">--%>
<%--    <a href="javascript:void(0)">--%>
<%--       <button style="background-color: #3684dc;"><span> 구글 계정 로그인 </span></button>--%>
<%--    </a>--%>
<%--  </li>--%>
<%--</ul>--%>






<%--<script>--%>

<%--  //처음 실행하는 함수--%>
<%--  function init() {--%>
<%--    gapi.load('auth2', function() {--%>
<%--      gapi.auth2.init();--%>
<%--      options = new gapi.auth2.SigninOptionsBuilder();--%>
<%--      options.setPrompt('select_account');--%>
<%--      // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가--%>
<%--      options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');--%>
<%--      // 인스턴스의 함수 호출 - element에 로그인 기능 추가--%>
<%--      // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들--%>
<%--      gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);--%>
<%--    })--%>
<%--  }--%>

<%--  function onSignIn(googleUser) {--%>
<%--    var access_token = googleUser.getAuthResponse().access_token--%>
<%--    $.ajax({--%>
<%--      // people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.--%>
<%--      url: 'https://people.googleapis.com/v1/people/me'--%>
<%--      // key에 자신의 API 키를 넣습니다.--%>
<%--      , data: {personFields:'birthdays', key:'AIzaSyAq_wcxCe96Plyha1IhfT2eG8TYBgkowW0', 'access_token': access_token}--%>
<%--      , method:'GET'--%>
<%--    })--%>
<%--            .done(function(e){--%>
<%--              //프로필을 가져온다.--%>
<%--              var profile = googleUser.getBasicProfile();--%>
<%--              console.log(profile)--%>
<%--            })--%>
<%--            .fail(function(e){--%>
<%--              console.log(e);--%>
<%--            })--%>
<%--  }--%>
<%--  function onSignInFailure(t){--%>
<%--    console.log(t);--%>
<%--  }--%>
<%--</script>--%>
<%--&lt;%&ndash;//구글 api 사용을 위한 스크립트&ndash;%&gt;--%>
<%--<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>--%>

<%--</body>--%>
<%--</html>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <style>
   #login{
      float:right;
      margin-right:100px;
   }
  </style>
  <body class="p-3 m-0 border-0 bd-example">

    <!-- Example Code -->
    
    <header class="navbar bg-light">
      <div>
        <a href="home">
          <img src="resources/img/logo.png" alt="Logo" width="100" height="50" >
        </a>
      </div>
      <c:if test="${login != null}">
         <div id="logininfo">
         <c:choose>
         	<c:when test = "${login eq 'admin'}">
         		<a href="adminPage">관리자페이지</a>
         	</c:when>
         	<c:otherwise>
         		<a href="myPage?id=${login}">${login}</a>님 환영합니다!
         	</c:otherwise>
         </c:choose>        	
            <c:if test="${login != null}">
               <a href="logout">[로그아웃]</a>
            </c:if>
           </div>
        </c:if>
        <c:if test="${login == null}">
         <div id="login">
            <a href="login">로그인</a>/<a href="joinForm">회원가입</a>
         </div>
      </c:if>
    </header>
    <%-- <c:if test="${login != null}">
    	<div id="ViewTimer"></div>
    </c:if> --%>
    
    <!-- End Example Code -->
  </body>
  <!-- <script language="JavaScript">
		var SetTime = 1800;		// 최초 설정 시간(기본 : 초)
		function msg_time() {	// 1초씩 카운트
			m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";	// 남은 시간 계산
			var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";
			document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 	
			SetTime--;					// 1초씩 감소
			if (SetTime < 0) {			// 시간이 종료 되었으면..
				clearInterval(tid);		// 타이머 해제
			}
		}
		window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
	</script> -->
</html>
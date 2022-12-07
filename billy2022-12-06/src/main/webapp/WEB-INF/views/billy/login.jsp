<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <style>
  	.form-floating{
  		width:300px;
  		margin-left:80px;
  	}
  	#header{
  		float:left;
  	}
  	h4{
  		margin-top:10px;
  	}
  	button{
  		margin-left:85px;
  	}
  </style>
  <body class="p-3 m-0 border-0 bd-example">

    <!-- Example Code -->
	<div id="header">
        <a href="#">
          <img src="resources/img/logo.png" alt="Logo" width="100" height="50" >
        </a>
    </div>
	<h4>로그인</h4>
	<br>
	<br>
	<br>
	<form action="loginAction" method="post">
    <div class="form-floating">
      <input type="text" class="form-control" placeholder="아이디" name="id">
      <label for="floatingInput">
      <font style="vertical-align: inherit;">
      	<font style="vertical-align: inherit;">아이디</font>
      </font>
      </label>
    </div>
    <br>
    <div class="form-floating">
      <input type="password" class="form-control" placeholder="비밀번호" name="pwd">
      <label for="floatingPassword">
      <font style="vertical-align: inherit;">
      	<font style="vertical-align: inherit;">비밀번호</font>
      </font>
      </label>
    </div>
    <br>
    <button class="btn btn-primary" type="button">비밀번호 찾기</button>
    <button type="submit" class="btn btn-primary" onclick='window.opener.location.reload();'>로그인</button>
    </form>
    <%@ include file="../bbs/footer.jsp"%>

  </body>
</html>
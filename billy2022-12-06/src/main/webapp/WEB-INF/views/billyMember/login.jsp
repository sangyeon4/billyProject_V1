<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
	rel="stylesheet">
<title>Bootstrap Example</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<style>
#loginArea {
	width: 400px;
	height: 300px;
	margin: 0 auto;
}

.form-floating {
	width: 300px;
	margin: 0 auto;
}

h4 {
	text-align: center;
}

#findPwd {
	margin-left: 80px;
}
</style>
<body class="p-3 m-0 border-0 bd-example">
	<%@ include file="../bbs/bootstrap.jsp" %>
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<div id="loginArea">
		<h4>로그인</h4>
		<br>
		<form name="loginForm" action="loginAction" method="post">
			<div class="form-floating">
				<input type="text" class="form-control" placeholder="아이디" name="id"
					id="id"> <label for="floatingInput"> <font
					style="vertical-align: inherit;"> <font
						style="vertical-align: inherit;">아이디</font>
				</font>
				</label>
			</div>
			<br>
			<div class="form-floating">
				<input type="password" class="form-control" placeholder="비밀번호"
					name="pwd" id="pwd"> <label for="floatingPassword">
					<font style="vertical-align: inherit;"> <font
						style="vertical-align: inherit;">비밀번호</font>
				</font>
				</label>
			</div>
			<br> <input type="button" value="비밀번호 찾기"
				class="btn btn-primary" id="findPwd"> <input type="button"
				value="로그인" onclick="loginChk()" class="btn btn-primary" id="login">

		</form>
	</div>
	<%@ include file="../bbs/footer.jsp"%>

</body>
<script>
	var idChkFlag = false;
	function loginChk() {
		var id = $('#id').val();
		var data = {
			id : id
		}
		$.ajax({
			type : "post",
			url : "chkId",
			data : data,
			success : function(result) {
				if (result != 'fail') { //아이디가 없다면            	
					alert('해당ID로 가입된 정보가 없습니다');
					idChkFlag = false;
				} else { //아이디가 있다면
					idChkFlag = true;
				}
				if (idChkFlag == true) { // 아이디가 있다면
					var pwd = $('#pwd').val();
					var data2 = {
						pwd : pwd,
						id : id
					}
					$.ajax({
						type : "post",
						url : "loginChk",
						data : data2,
						success : function(result) {
							if (result != 'fail') { //회원정보가 없다면 없다면            	
								alert('비밀번호가 틀렸습니다');
							}else{
								document.loginForm.submit();
							}
						}
					}); // ajax 종료				
				}// success 종료
			}
		}); // ajax 종료
	}// function 종료
</script>
</html>
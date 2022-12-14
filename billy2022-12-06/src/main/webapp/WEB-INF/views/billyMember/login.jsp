<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 구글 소셜 로그인 용 content에 자신의 OAuth2.0 클라이언트ID를 넣습니다. -->
<meta name="google-signin-client_id"
	content="378818113019-7uccmjbpl5u30aue596r5vh9dteh2lp8.apps.googleusercontent.com">
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
<!-- 구글 api 사용을 위한 스크립트 -->
<script src="https://apis.google.com/js/platform.js?onload=init" async
	defer></script>
</head>
<style>
#loginArea {
	width: 400px;
	height: 400px;
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

#googleLogin {
	width: 300px;
	margin-left: 20px;
}
</style>
<body class="p-3 m-0 border-0 bd-example">
	<%@ include file="../bbs/bootstrap.jsp"%>
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
			<ul>
				<li id="GgCustomLogin" style="display: inline"><a
					href="javascript:void(0)"> <img
						src="resources/img/googleLogin.png" id="googleLogin"> <!-- <span>Login with Google(공사중)</span> -->
				</a></li>
			</ul>
			<br> <input type="button" value="비밀번호 찾기" onclick="pwdQuizChk()"
				class="btn btn-primary" id="findPwd"> <input type="button"
				value="로그인" onclick="loginChk()" class="btn btn-primary" id="login">

		</form>

		<script>
			//처음 실행하는 함수
			function init() {
				gapi
						.load(
								'auth2',
								function() {
									gapi.auth2.init();
									options = new gapi.auth2.SigninOptionsBuilder();
									options.setPrompt('select_account');
									// 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
									options
											.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
									// 인스턴스의 함수 호출 - element에 로그인 기능 추가
									// GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
									gapi.auth2.getAuthInstance()
											.attachClickHandler(
													'GgCustomLogin', options,
													onSignIn, onSignInFailure);
								})
			}

			function onSignIn(googleUser) {
				var access_token = googleUser.getAuthResponse().access_token
				$.ajax({
					// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
					url : 'https://people.googleapis.com/v1/people/me'
					// key에 자신의 API 키를 넣습니다.
					,
					data : {
						personFields : 'birthdays',
						key : 'AIzaSyCzq5mYqg_VVGqfbdTR34tBUoR_fEtQYuA',
						'access_token' : access_token
					},
					method : 'GET'
				}).done(function(e) {
					//프로필을 가져온다.
					var profile = googleUser.getBasicProfile();
					console.log(profile)
				}).fail(function(e) {
					console.log(e);
				})
			}
			function onSignInFailure(t) {
				console.log(t);
			}
		</script>
	</div>
	<%@ include file="../bbs/footer.jsp"%>


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
								} else {
									document.loginForm.submit();
								}
							}
						}); // ajax 종료				
					}// success 종료
				}
			}); // ajax 종료
		}// function 종료
		function pwdQuizChk(){
			location.href="pwdSearch";
		}
	</script>
</body>
</html>
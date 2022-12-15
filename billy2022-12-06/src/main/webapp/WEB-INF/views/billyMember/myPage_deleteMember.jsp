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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
.list-group {
	width: 200px;
	float: left;
}

.list-group a {
	font-size: 15px;
}
#myInfo {
	width: 1200px;
	height: 800px;
}

#loginArea {
	width: 250px;
	float: left;
}

#myInfo img {
	width: 500px;
	float: left;
	margin-left: 160px;
}

.form-control {
	margin-left: 50px;
	margin-top: 15px;
}

.form-text {
	margin-left: 50px;
}

.form-select {
	margin-left: 50px;
	margin-top: 15px;
}

#deleteMemberChkArea {
	width: 400px;
	height: 300px;
	margin: 0 auto;
}
</style>
<body>
	<%@ include file="../bbs/bootstrap.jsp" %>
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<form name="deleteForm" action="deleteMemberAction" method="POST" encType="multipart/form-data">
		<section id="myInfo">
			<div class="list-group">
				<a href="myPage?id=${login}" class="list-group-item list-group-item-action"aria-current="true">내 정보</a> 
				<a href="myBookmarkList?id=${login}" class="list-group-item list-group-item-action">찜 목록</a> 
				<a href="myBillyGoodsList?id=${login}" class="list-group-item list-group-item-action">등록한 물품</a> 
				<a href="myBillyTransactionList?id=${login}" class="list-group-item list-group-item-action">대여한 물품</a>
				<a href="#" class="list-group-item list-group-item-action">빌리 내역</a>
				<a href="deleteMemberPage?id=${login}" class="list-group-item list-group-item-action active">회원탈퇴</a>
			</div>		
			<img src="resources/img/delImg.png">
			<div id="deleteMemberChkArea">
				
					<table class="form-floating">
						<tr align=center>
							<th colspan="2">비밀번호를 한번 더 입력해주세요</th>
						</tr>
						<tr>
							<td align=center>아이디</td>
							<td><input type="text" name="id" id="id"
								class="form-control" value="${id}" readonly
								maxlength="20"></td>
						</tr>
						<tr>
							<td align=center>비밀번호</td>
							<td><input type="password" name="pwd" id="pwd"
								class="form-control" 
								maxlength="20"></td>
						</tr>
						<tr>
							<td colspan="2" align=center>
								<input type="button" class="btn btn-primary" onclick="deleteChk()" value="확인">
							</td>
						</tr>
					</table>
				</form>
			</div>


		</section>

		<%@ include file="../bbs/footer.jsp"%>
</body>
<script>
	function deleteChk(){
		var id = $('#id').val();
		var pwd = $('#pwd').val();
		var data = {
				id : id,
				pwd : pwd
		}
		$.ajax({
			type : "post",
			url : "loginChk",
			data : data,
			success : function(result){
				if(result != 'fail'){
					alert('비밀번호가 틀렸습니다');
				}else{
					document.deleteForm.submit();					
				}
				
			}
		});	
	}


</script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#pwdSerachArea {
	width: 500px;
	height: 400px;
	margin: 0 auto;
}

h4 {
	text-align: center;
}

#pwdChk {
	margin-left: 150px;
}

#emailChk {
	margin-left: 150px;
}
</style>
<body>
	<%@ include file="../bbs/bootstrap.jsp"%>
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<section id="pwdSerachArea">
		<h5>비밀번호를 찾고자 하는 아이디를 입력하세요</h5>
		<div id="pwdChk">
			<input type="text" class="form-control" name="id" id="id"> <br>
			<input type="button" onclick="pwdSearchId()" class="btn btn-primary" value="다음">
		</div>
		<div id="emailChk" >
			<br>
			<input type="text" class="form-control" name="email" id="email" disabled> <br>
			<input type="button" onclick="pwdSearchEmail()" class="btn btn-primary" id="emailChkBtn" value="이메일인증하기" disabled>
		</div>
		<div>
			<br>
			<input type="text" class="form-control" style="display:none" id="mailKey"> 
			<input type="button" class="btn btn-primary" style="display:none" id="mailKeyBtn" value="인증" onclick ="authKeyClick()">
			
		</div>
	</section>




	<%@ include file="../bbs/footer.jsp"%>

</body>
<script>
	function pwdSearchId() {	//비밀번호찾기 아이디부터 검사
		var id = $('#id').val();
		var data = {
			id : id
		}
		$.ajax({
			type : "post",
			url : "chkId",
			data : data,
			success : function(result) {
				if (result != 'fail') {
					alert('해당ID로 가입된 정보가 없습니다');
				} else {
					alert('해당 ID로 가입한 이메일 정보를 입력하세요');
					 $('#id').attr("readonly",true);
					 $('#email').removeAttr("disabled");
					 $('#emailChkBtn').removeAttr("disabled");
				}
			}
		});
	}
	function pwdSearchEmail(){	//비밀번호 찾기 이메일 검사
		var id = $('#id').val();
		var email = $('#email').val();
		var data ={
				id : id,
				email : email
		}
		$.ajax({
			type : "post",
			url : "pwdSearchEmailChk",
			data : data,
			success : function(result){
				if(result == 'fail'){
					alert('이메일 정보가 일치하지 않습니다');
				}else{
					alert('가입하신 이메일로 비밀번호 인증키를 보냈습니다 \n 인증키를 입력해주세요');
					$('#mailKey').show();
					$('#mailKeyBtn').show();
				}
			}
		});
	}
	function authKeyClick(){	//인증확인 누르면 ~ 비번바꾸기로 갑니다잉
		var id = $('#id').val();
		var email = $('#email').val();
		var mailKey = $('#mailKey').val();
		var data ={
				id : id,
				email : email,
				mailKey : mailKey
		}
		$.ajax({
			type : "post",
			url : "mailKeyChk",
			data : data,
			success : function(result){
				if(result == 'fail'){
					alert('일치하지 않습니다');
				}else{
					var id = $('#id').val();
					location.href="memberPwdChange?id="+id;
				}
			}
		});
	}
</script>
</html>
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
	.list-group{
		width:150px;
		float:left;
		margin-right:400px;
	}
</style>
<body>
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<h4>마이페이지</h4>
	<div class="list-group">
	<a href="#" class="list-group-item list-group-item-action active" aria-current="true">내 정보</a>
  	<a href="#" class="list-group-item list-group-item-action">찜 목록</a>
  	<a href="#" class="list-group-item list-group-item-action">등록한 물품</a>
  	<a href="#" class="list-group-item list-group-item-action">대여한 물품</a>
  	<a href="#" class="list-group-item list-group-item-action">빌리 내역</a>
  	<a href="#" class="list-group-item list-group-item-action">회원탈퇴</a>
	</div>
	<table border="1" id="info">
		<tr>
			<td colspan="2"><h5>내정보</h5></td>
		</tr>
		<tr>
			<td>아이디 : </td>
			<td>msy12</td>
		</tr>
		<tr>
			<td>비밀번호 : </td>
			<td>0000</td>
		</tr>
		<tr>
			<td>전화번호 : </td>
			<td>010-5039-8075</td>
		</tr>
		<tr>
			<td>이름 : </td>
			<td>문상연</td>
		</tr>
		<tr>
			<td>지역 : </td>
			<td>용인</td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<%@ include file="../bbs/footer.jsp"%>
</body>
</html>
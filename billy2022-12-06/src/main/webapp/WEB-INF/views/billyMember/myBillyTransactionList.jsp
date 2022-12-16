<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
	rel="stylesheet">

<title>Bootstrap Example</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.list-group {
	width: 200px;
	float:left;
	margin-right:10px;
}

.list-group a {
	font-size: 15px;
}

</style>
</head>
<body class="p-3 m-0 border-0 bd-example">
	<%@ include file="../bbs/bootstrap.jsp" %>
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<%@ include file="../bbs/notice.jsp"%>
	<br>
	<div id ="aa" style="height:800px;">
		<div class="list-group">
			<a href="myPage?id=${login}" class="list-group-item list-group-item-action"aria-current="true">내 정보</a> 
			<a href="myBookmarkList?id=${login}" class="list-group-item list-group-item-action">찜 목록</a> 
			<a href="myBillyGoodsList?id=${login}" class="list-group-item list-group-item-action">등록한 물품</a> 
			<a href="myBillyTransactionList?id=${login}" class="list-group-item list-group-item-action active">대여한 물품</a>
			<a href="deleteMemberPage?id=${login}" class="list-group-item list-group-item-action">회원탈퇴</a>
		</div>
		<div id="myBookmarkArea">
			<h3>내가 대여한 빌리</h3>
			<table class="table table-sm" style="width: 900px">
			<tr>
				<th>대여제품</th>
				<th>대여날짜</th>
				<th>총 대여금액</th>
			</tr>
			<c:if test="${bmList.size()!=0}">
			<c:forEach items="${bmList}" var="bmList">
				<tr class='record'>
					<td><a href="billyViewOne?vno=${bmList.gNum}&vid=${login}">${bmList.gName}</a></td>
					<td>${bmList.tIndate.substring(0,10)}-</td>
					<td>${bmList.tPrice}</td>
				</tr>
			</c:forEach>
			</c:if>
			</table>
		</div>
	</div>
	<%@ include file="../bbs/footer.jsp"%>
</body>
</html>
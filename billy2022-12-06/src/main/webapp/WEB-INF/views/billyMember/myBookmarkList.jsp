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
	float: left;
}

.list-group a {
	font-size: 15px;
}
#myBookmarkArea{
	width : 1000px;
}

</style>
</head>
<body class="p-3 m-0 border-0 bd-example">
	<%@ include file="../bbs/bootstrap.jsp" %>
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<%@ include file="../bbs/notice.jsp"%>
	<section>
	<div class="list-group">
		<a href="myPage?id=${login}" class="list-group-item list-group-item-action"aria-current="true">내 정보</a> 
		<a href="myBookmarkList?id=${login}" class="list-group-item list-group-item-action active">찜 목록</a> 
		<a href="myBillyGoodsList?id=${login}" class="list-group-item list-group-item-action">등록한 물품</a> 
		<a href="myBillyTransactionList?id=${login}" class="list-group-item list-group-item-action">대여한 물품</a>
		<a href="#" class="list-group-item list-group-item-action">빌리 내역</a>
		<a href="deleteMemberPage?id=${login}" class="list-group-item list-group-item-action">회원탈퇴</a>
	</div>
	<div id="myBookmarkArea">

	<c:forEach items="${bmList}" var="bvo">

		<a href='billyViewOne?vno=${bvo.getgNum()}&vid=${login}' style="float: left; margin: 50px;  ">
			<div class="card" style="width: 18rem; height: 18rem;">
		
			<!-- 사진 파일유무 파악 -->			
				<c:choose>
					<c:when test="${bvo.getFiles()[0] ne null}">
						<img src="download1?filename=${bvo.getFiles()[0]}"
							class="card-img-top" alt="..." style="width:300px; height:200px;">
					</c:when>
					<c:otherwise>					
						  <img src="resources/img/no_img.jpg" class="card-img-top" alt="..." >
					</c:otherwise>
				</c:choose>
				<div class="card-body">
					<h5 class="card-title">${bvo.getgName()}</h5>
					<p class="card-text"></p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">시작일: ${bvo.getgStrDate()}</li>
					<li class="list-group-item">종료일: ${bvo.getgEndDate()}</li>
					<li class="list-group-item">하루 당 가격: ${bvo.getgPrice()}</li>
				</ul>
			</div>
		</a>
	

	</c:forEach>
	</div>
	</section>

	<%@ include file="../bbs/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.list-group {
	width: 200px;
	float: left;
	height: 2000px;
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
	<div class="list-group">
		<a href="myPage?id=${login}" class="list-group-item list-group-item-action" aria-current="true">내 정보</a> 
		<a href="myBookmarkList?id=${login}" class="list-group-item list-group-item-action">찜 목록</a> 
		<a href="myBillyGoodsList?id=${login}" class="list-group-item list-group-item-action active">등록한 물품</a> 
		<a href="myBillyTransactionList?id=${login}" class="list-group-item list-group-item-action">대여한 물품</a>
		<a href="deleteMemberPage?id=${login}" class="list-group-item list-group-item-action">회원탈퇴</a>
	</div>
	<div>		
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

	<%@ include file="../bbs/footer.jsp"%>
	
</body>
</html>
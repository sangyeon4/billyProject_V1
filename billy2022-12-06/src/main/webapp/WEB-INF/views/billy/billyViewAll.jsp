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
</head>
<body class="p-3 m-0 border-0 bd-example">
	<%@ include file="../bbs/bootstrap.jsp" %>
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<%@ include file="../bbs/notice.jsp"%>
	<section>
		<c:forEach items="${bList}" var="bvo" >
			<a href='billyViewOne?vno=${bvo.getgNum()}&vid=${login}' style="float: left; margin: 50px;">
				<div class="card" style="width: 18rem; height: 21rem;">
					<!-- 사진 파일유무 파악 -->
					<c:choose>
						<c:when test="${bvo.getFiles()[0] ne null}">
							<img src="download1?filename=${bvo.getFiles()[0]}" class="card-img-top" style="width: 286px; height: 100px;">
						</c:when>
						<c:otherwise>
							<img src="resources/img/no_img.jpg" class="card-img-top" style="width: 286px; height: 100px;">
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
						<c:choose>
							<c:when test="${bvo.getgLike_cnt() == 0}">
								<li class="list-group-item"><img id="likeImg" src="resources/img/star.svg" width="25" height="25"></li>
							</c:when>
							<c:otherwise>
								<li class="list-group-item"><img id="likeImg" src="resources/img/star-fill.svg" width="25" height="25">${bvo.getgLike_cnt()}</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</a>
		</c:forEach>
	</section>
	<%@ include file="../bbs/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>빌리지 게시판</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
	table{
		margin-left:200px;
	}
	h3{
		margin-left:200px;
	}
	#page{
		margin-left:550px;
	}
</style>


<body>
	<%@ page import="java.util.*"%>
	<%@ page import="com.billy.VO.*"%>
	<%@ include file="../bbs/bootstrap.jsp" %>
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<%@ include file="../bbs/notice.jsp"%>
	<br>
	<h3>빌리지 게시판</h3>
	<table class="table table-sm" style="width: 900px">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th><a href="villageForm">글작성</a></th>
		</tr>
		<c:forEach items="${vList}" var="vvo">
			<tr class='record'>
				<td>${vvo.vNum}</td>
				<td><a href="villageView?vNum=${vvo.vNum}">${vvo.vTitle}</a> (${vvo.reply})</td>
				<td>${vvo.name}</td>
				<td>${vvo.vIndate.substring(0,10)}</td>
				<td>${vvo.vCnt}</td>
			</tr>
		</c:forEach>
	</table>

	<form action="selectVillageSearch" method="get">
		<div class="mainSelect" style="margin-left: 450px">
			<select id="mainS" name="searchOption">
				<option value="title">제목</option>
				<option value="titleText">제목+내용</option>
				<option value="writer">작성자</option>
			</select> 
			<input type="text" name="searchWord"> 
			<input class="btn btn-primary" type="submit" value="검색">
		</div>
	</form>
	<br>
	<div id="page">
		<nav aria-label="...">
			<ul class="pagination">
			
				<li class="page-item">
					<c:if test="${pageVO.prev}">
						<a class="page-link" href="villageBoard?page=${pageVO.startPage - 1}">[이전페이지그룹]</a>
					</c:if>
				</li>
				
				<c:choose>
					<c:when test="${pageVO.page != 1}">
						<li class="page-item">
							<a class="page-link" href='villageBoard?page=${pageVO.page-1}'>이전</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href='villageBoard?page=${pageVO.page}'>이전</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="idx">
					<c:choose>
						<c:when test="${pageVO.page == idx}">
							<li class="page-item active">
								<a class="page-link" href="villageBoard?page=${idx}">${idx}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="villageBoard?page=${idx}">${idx}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${pageVO.endPage == pageVO.page}">
						<li class="page-item disabled">
							<a class="page-link" href='villageBoard?page=${pageVO.page}'>다음</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href='villageBoard?page=${pageVO.page+1}'>다음</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:if test="${pageVO.next}">
					<a class="page-link" href="villageBoard?page=${pageVO.endPage + 1}">[다음페이지그룹]</a>
				</c:if>
				
			</ul>
		</nav>
	</div>
	<%@ include file="../bbs/footer.jsp"%>
</body>
</html>
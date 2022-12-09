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
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<%@ include file="../bbs/notice.jsp"%>
	<h3>빌리지 게시판</h3>
	<table class="table table-sm" style="width:900px">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>아이디</th>
			<th>작성일</th>
			<th>조회수</th>
			<th><a href="villageForm">글작성</a></th>
		</tr>
		<c:forEach items="${vList}" var="vvo">         
               <tr class='record'>
	               <td>${vvo.vNum}</td>   
	               <td><a href="villageView?vNum=${vvo.vNum}">${vvo.vTitle}</a></td>
	               <td>${vvo.vId}</td>
	               <td>${vvo.vIndate.substring(0,10)}</td>
	               <td>${vvo.vCnt}</td>
               </tr>      
         </c:forEach>
		
			
	</table>
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
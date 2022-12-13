<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#adminArea{
		weight : 1200px;
		height : 800px;
	}
	.list-group{
		width:200px;
		float:left;
	}
	.list-group a{
		font-size : 15px;
	}
	
	#billyNotice{
		width : 1000px;
   		float:left;
   		margin-left:15px;
	}

	#billyNotice h3{
		text-align : center;
	}
	#billyNotice #page{
		margin-left : 400px;
	}

	
</style>
</head>

<body>
	<%@ page import="java.util.*"%>
	<%@ page import="com.billy.VO.*"%>
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<%@ include file="../bbs/notice.jsp"%>
	<section id="adminArea">
	<div class="list-group">
  	<a href="#" class="list-group-item list-group-item-action active" aria-current="true">빌리 공지사항 관리</a>
  	<a href="#" class="list-group-item list-group-item-action">공사중</a>
  	<a href="#" class="list-group-item list-group-item-action">공사중</a>
  	<a href="#" class="list-group-item list-group-item-action">공사중</a>
	</div>
	<div id="billyNotice">
	<h3>빌리 공지사항 관리</h3>
	<table class="table table-sm">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
			<th><a href="billyNoticeForm">공지사항 등록</a></th>
		</tr>
		<c:forEach items="${bnList}" var="bnvo">         
               <tr class='record'>
	               <td>${bnvo.bnNum}</td>   
	               <td><a href="billyNoticeView?bnNum=${bnvo.bnNum}">${bnvo.bnTitle}</a></td>
	               <td>${bnvo.bnIndate.substring(0,10)}</td>
	               <td>${bnvo.bnCnt}</td>
               </tr>      
         </c:forEach>		
	</table>
	
	<div id="page">
		<nav aria-label="...">
			<ul class="pagination">
			
				<li class="page-item">
					<c:if test="${pageVO.prev}">
						<a class="page-link" href="adminPage?page=${pageVO.startPage - 1}">[이전페이지그룹]</a>
					</c:if>
				</li>
				
				<c:choose>
					<c:when test="${pageVO.page != 1}">
						<li class="page-item">
							<a class="page-link" href='adminPage?page=${pageVO.page-1}'>이전</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href='adminPage?page=${pageVO.page}'>이전</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="idx">
					<c:choose>
						<c:when test="${pageVO.page == idx}">
							<li class="page-item active">
								<a class="page-link" href="adminPage?page=${idx}">${idx}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="adminPage?page=${idx}">${idx}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${pageVO.endPage == pageVO.page}">
						<li class="page-item disabled">
							<a class="page-link" href='adminPage?page=${pageVO.page}'>다음</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href='adminPage?page=${pageVO.page+1}'>다음</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:if test="${pageVO.next}">
					<a class="page-link" href="adminPage?page=${pageVO.endPage + 1}">[다음페이지그룹]</a>
				</c:if>				
			</ul>
		</nav>
	</div>
	</div>
	</section>


	
	<%@ include file="../bbs/footer.jsp"%>
</body>

</html>
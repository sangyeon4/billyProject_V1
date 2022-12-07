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
<body>
	<%@ page import="java.util.*"%>
	<%@ page import="com.billy.VO.*"%>
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<h3>빌리지 게시판</h3>
	<table class="table table-sm">
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
	               <td><a href="#" onclick='window.open("villageView?vNum=${vvo.vNum}","width=600,height=600")'>${vvo.vTitle}</a></td>
	               <td>${vvo.vId}</td>
	               <td>${vvo.vIndate}</td>
	               <td>${vvo.vCnt}</td>
               </tr>      
         </c:forEach>
		
			
	</table>
	<%@ include file="../bbs/footer.jsp"%>
</body>
</html>
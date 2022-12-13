<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
		width : 1024px;
		height : 800px;
	}
	
	section .developer{
		margin-left : 200px;
		padding-top : 100px;
		width:800px;
	}
</style>
</head>
<body>
	<%@ include file="../bbs/bootstrap.jsp" %>
   <%@ include file="../bbs/header.jsp"%>
   <%@ include file="../bbs/nav.jsp"%>
   <%@ include file="../bbs/notice.jsp"%>
   <section>
   		<img src=resources/img/개발자.jpg class="developer">
   		<img src=resources/img/developer.png class="developer">
   </section>
   
   <%@ include file="../bbs/footer.jsp"%>
</body>
</html>
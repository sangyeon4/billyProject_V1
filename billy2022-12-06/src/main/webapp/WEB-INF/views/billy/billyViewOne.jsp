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
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<%@ include file="../bbs/notice.jsp"%>
	<div align="center">
		<table>
			<tr>
				<th>글번호</th>
				<td class="form-control">${bvo.getgNum()}</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td class="form-control">${bvo.getId()}</td>
			</tr>
			<tr>
				<th>상품</th>
				<td class="form-control">${bvo.getgName()}</td>
			</tr>
			<tr>
				<th>지역</th>
				<td class="form-control">${bvo.getgLoca()}</td>
			</tr>

			<tr>
				<th>내용</th>
				<td class="form-control">${bvo.getgText()}<br> <c:forEach
						items="${bvo.getFiles()}" var="fname">
						<img src="download1?filename=${fname}">
						<br>
					</c:forEach>
				</td>
			</tr>
		</table>
		<br> <br> 
		<input type="button" class="btn btn-primary" value="뒤로가기" onclick="history.go(-1)"> 
		<input type="button" class="btn btn-primary" value="찜하기" onclick="history.go(-1)">
		<c:if test="${bvo.getId()==login}">
		<input type="button" class="btn btn-primary" value="수정하기" onclick="location.href='billyModForm?vno=${bvo.getgNum()}'">
	
		</c:if>
	</div>





	<%@ include file="../bbs/footer.jsp"%>
</body>
</html>
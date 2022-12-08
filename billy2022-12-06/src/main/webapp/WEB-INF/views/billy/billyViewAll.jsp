<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body class="p-3 m-0 border-0 bd-example">
    <%@ include file="../bbs/header.jsp"%>
   <%@ include file="../bbs/nav.jsp"%>
   <%@ include file="../bbs/notice.jsp"%>
	<div class="row row-cols-1 row-cols-md-3 g-4"> 
		<c:forEach items="${bList}" var="bvo">
			<div class="col">
				<div class="card">
					<img src="download?filename=${bvo.getFiles()[0]}"
						class="card-img-top" alt="..."
						style="width: 300px; height: 300px;">
					<div class="card-body">
						<h5 class="card-title">${bvo.getgName()}</h5>
						<p class="card-text">${bvo.getgStrDate()}</p>
						<p class="card-text">${bvo.getgEndDate()}</p>

					</div>
				</div>
		</c:forEach>
	</div>

	<%@ include file="../bbs/footer.jsp"%>
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
#join {
	font-size: 30px;
}

#joinTop {
	margin-left: 250px;
}

</style>

<body>
<%@ page import="java.util.*"%>
<%@ page import="com.billy.VO.*"%>
<%@ include file="../bbs/header.jsp"%>
<%@ include file="../bbs/nav.jsp"%>
<br>
	<div id="joinTop">
			<img src="resources/img/logo.png" alt="Logo" width="100" height="50">
			<span id="join">빌리 공지사항</span>
	</div>
	<br>
   <div align="center">								
         <table>
         	<tr>
         		<th>글번호</th>
         		<td><input type="text" class="form-control" name="vNum" value="${bnvo.bnNum}" readonly></td>
         	</tr>
            <tr>
               <th>제목</th>
               <td><input type="text" size="70" name="vTitle" class="form-control" value="${bnvo.bnTitle}" readonly></td>
            </tr>
            <tr>
               <th>내용</th>
               <td class="form-control">
                ${bnvo.bnText}       
               </td>
            </tr>
				<%-- <tr style="text-align:center">
					<td colspan="2">
						<br> 
						<form action="villageBoardDelAction" method="get" style="float: right; padding-left:10px">
							<input type="hidden" name="vNum" value="${vvo.vNum}">
							<input type="submit" class="btn btn-primary" value="삭제"> 
						</form>
						<form action="villageBoardModBtn" method="get" style="float: right">
							<input type="hidden" name="vNum" value="${vvo.vNum}">
							<input type="hidden" name="vTitle" value="${vvo.vTitle}">
							<input type="hidden" name="vText" value="${vvo.vText}">
							<input type="submit" class="btn btn-primary" value="수정">
						</form>
					</td>
				</tr> --%>
		</table>
         
   <%@ include file="../bbs/footer.jsp"%>
</body>
</html>
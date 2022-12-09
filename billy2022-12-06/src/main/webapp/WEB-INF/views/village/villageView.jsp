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
			<span id="join">빌리지 내용</span>
	</div>
	<br>
   <div align="center">								
         <table>
         	<tr>
         		<th>글번호</th>
         		<td><input type="text" class="form-control" name="vNum" value="${vvo.vNum}" readonly></td>
         	</tr>
         	<tr>
         		<th>아이디</th>
         		<td><input type="text" class="form-control" name="vId" value="${vvo.vId}" readonly></td>
         	</tr>
            <tr>
               <th>제목</th>
               <td><input type="text" size="70" name="vTitle" class="form-control" value="${vvo.vTitle}" readonly></td>
            </tr>
            <tr>
               <th>내용</th>
               <td class="form-control">
                ${vvo.vText}
                <br>
                <c:forEach items="${attach}" var="fname">
               		<img src="download2?filename=${fname}">
               		<br>
               	</c:forEach>
               </td>
            </tr>
			<c:if test="${login.equals(vvo.vId)}">
				<tr style="text-align:center">
					<td colspan="2">
						<br> 
						<form action="villageBoardDelAction" method="get" style="float: right; padding-left:10px">
							<input type="hidden" name="vNum" value="${vvo.vNum}">
							<input type="submit" class="btn btn-primary" value="삭제"> 
						</form>
						<form action="villageBoardModBtn" method="get" style="float: right">
							<input type="hidden" name="vNum" value="${vvo.vNum}">
							<input type="submit" class="btn btn-primary" value="수정">
						</form>
					</td>
				</tr>
			</c:if>
		</table>
         <hr>
         ${replyNum-1}개의 댓글<br>
         <form action="villageReply_1Action" method="post">
         <input type="text" class="form-control" name="r1Text" placeholder="댓글을 남겨보세요!" style="width:550px;float:left;margin-left:310px;">
         <input type="submit" value="작성" class="btn btn-primary" style="float:left">
         <input type="hidden" value="${vvo.vNum}" name="vNum">
         <input type="hidden" value="${login}" name="r1Id">
         <input type="hidden" value="${replyNum}" name="r1Num">
         </form>
         <br><br><hr>
         <c:forEach items="${replyList}" var="rList">
         <table class="form-control" style="width:600px">
         	<c:if test="${rList.r1Id.equals(vvo.vId)}">
         	<tr>
         		<td>
         		${rList.r1Id}(작성자)
         		</td>
         	</tr>
         	</c:if>
         	<c:if test="${rList.r1Id != vvo.vId}">
         	<tr>
         		<td>
         		${rList.r1Id}
         		</td>
         	</tr>
         	</c:if>
         	<tr>
         		<td>
         		${rList.r1Indate}
         		</td>
         	</tr>
         	<tr>
         		<td>
         		${rList.r1Text}
         		</td>
         	</tr>
         </table>
         <br>
         </c:forEach>
         <input type="button" class="btn btn-primary" value="목록" onclick='location.href="villageBoard"'/>
   </div>
   <br>
   <%@ include file="../bbs/footer.jsp"%>
</body>
</html>
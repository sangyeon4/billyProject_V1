<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	margin-left: 500px;
}

</style>

<body>
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
               <td><input type="text" name="vText" class="form-control" value="${vvo.vText}" readonly></td>
            </tr>
         </table>
         <br>
         <br>
         <input type="button" class="btn btn-primary" value="창닫기" onclick="location.href='villageBoard'">
   </div>
</body>
</html>
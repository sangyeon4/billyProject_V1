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
    <div align="center">								
         <table>
         	<tr>
         		<th>글번호</th>
         		<td><input type="text" class="form-control" name="vNum"  readonly></td>
         	</tr>
         	<tr>
         		<th>아이디</th>
         		<td><input type="text" class="form-control" name="vId"  readonly></td>
         	</tr>
            <tr>
               <th>제목</th>
               <td><input type="text" size="70" name="vTitle" class="form-control"  readonly></td>
            </tr>
            <tr>
               <th>내용</th>
               <td class="form-control">
          
                <br>
     <!--         <c:forEach items="${attach}" var="fname">
               		<img src="download2?filename=${fname}">
               		<br>
               	</c:forEach>  -->  
               </td>
            </tr>
         </table>
         <br>
         <br>
         <input type="button" class="btn btn-primary" value="뒤로가기" onclick="history.go(-1)">
   </div>
   
   
   
   

	<%@ include file="../bbs/footer.jsp"%>
  </body>
</html>
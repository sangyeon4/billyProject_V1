<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
</head>
<style>
	#header{
  		float:left;
  	}
  	h4{
  		padding-top:15px;
  	}
  	#joinTop {
		margin-left: 500px;
	}
	#join {
		font-size: 30px;
	}
	#modBtn{
		
	}
</style>
  	
<body>
	<%@ include file="../bbs/bootstrap.jsp" %>
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<div id="joinTop">
			<img src="resources/img/logo.png" alt="Logo" width="100" height="50">
			<span id="join">빌리지 수정</span>
	</div>
	
   <div id="wrap" align="center">								
      <form  method="post" action="updateVillageBoardAction" encType="multipart/form-data" id="send_form">
         <table>
         	<tr>
         		<th>글번호</th>
         		<td><input type="text" class="form-control" name="vNum" value="${vvo.vNum}" readonly></td>
         	</tr>
         	<tr>
         		<th>아이디</th>
         		<td><input type="text" class="form-control" name="vId" value="${login}" readonly></td>
         	</tr>
            <tr>
               <th>제목</th>
               <td><input type="text" size="70" name="vTitle" value="${vvo.vTitle}" class="form-control" placeholder="제목을 입력하세요"></td>
            </tr>
            <tr>
               <th>내용</th>
               <td class="form-control">
               		<input type="text" size="70" name="vText" value="${vvo.vText}" class="form-control" placeholder="내용을 입력하세요">
               		<br>
               		<%
               			ArrayList list = (ArrayList)request.getAttribute("file");
               			for(int i = 0; i<list.size(); i++){
               				out.print("<button id='imgBtn"+i+"' type='button'>");
               				out.print("<img src='download2?filename="+list.get(i)+"' style='width:150px; height:100px;' onclick=delImg"+i+"('"+list.get(i)+"')>");
               				out.print("</button>");
               				out.print("<br>");
               			}
               		%>
         		</td>
            </tr>
            <tr>
            	<td colspan="2">
           	 		*파일은 최대2개 등록 가능합니다
           	 	</td>
            </tr>
            <tr>
            	<td colspan="2">
            		<div class="mb-3">
            		<% 
         				for(int i = 0; i + list.size() < 2; i++){
         					out.print("<input type='file' class='form-control' name='file' accept='image/gif, image/jpeg, image/png'>");
         				}
         			%>
					</div>
					<span id="img0"></span>
					<span id="img1"></span>
					<span id="delImg0"></span>
					<span id="delImg1"></span>
					<input type='hidden' class='form-control' name='file' accept='image/gif, image/jpeg, image/png'>
				</td>
            </tr>
         </table>
         <br>
         <input type="submit" class="btn btn-primary"  value="수정">
         <input type="reset" class="btn btn-primary" value="다시 작성">
         <input type="button" class="btn btn-primary" value="취소" onclick="history.go(-1)">
      </form>
   </div>
   <%@ include file="../bbs/footer.jsp"%>
</body>
<script>
	function delImg0(a){
		$('#imgBtn0').remove();
		document.getElementById('img0').innerHTML="<input type='file' class='form-control' name='file' accept='image/gif, image/jpeg, image/png'>";
		document.getElementById('delImg0').innerHTML="<input type='hidden' name='delFiles' value='"+a+"'>";
	}
	function delImg1(a){
		$('#imgBtn1').remove();
		document.getElementById('img1').innerHTML="<input type='file' class='form-control' name='file' accept='image/gif, image/jpeg, image/png'>";
		document.getElementById('delImg1').innerHTML="<input type='hidden' name='delFiles' value='"+a+"'>";
	}
</script>

</html>
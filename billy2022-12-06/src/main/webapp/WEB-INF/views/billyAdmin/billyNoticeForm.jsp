<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
  	
<body>
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<div id="joinTop">
			<img src="resources/img/logo.png" alt="Logo" width="100" height="50">
			<span id="join">빌리 공지사항 등록</span>
	</div>
	
   <div id="wrap" align="center">								
      <form  method="post" action="billyNoticeAction" id="send_form">
         <table>
         	<tr>
         		<th>글번호</th>
         		<td><input type="text" class="form-control" name="bnNum" value="${bnNum}" readonly></td>
         	</tr>
            <tr>
               <th>제목</th>
               <td><input type="text" size="70" name="bnTitle" class="form-control" placeholder="제목을 입력하세요"></td>
            </tr>
            <tr>
               <th>내용</th>
               <td><textarea cols="71" rows="10" name="bnText" class="form-control" placeholder="내용을 입력하세요"></textarea></td>
            </tr>
         </table>
         <br>
         <br>
         <input type="submit" class="btn btn-primary"  value="등록">
         <input type="reset" class="btn btn-primary" value="다시 작성">
         <input type="button" class="btn btn-primary" value="취소" onclick="location.href='adminPage'">
      </form>
   </div>
   <%@ include file="../bbs/footer.jsp"%>
</body>

</html>
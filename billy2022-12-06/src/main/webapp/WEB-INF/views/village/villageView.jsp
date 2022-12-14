<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bootstrap Example</title>
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
<%@ include file="../bbs/bootstrap.jsp" %>
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
               <th>작성자</th>
               <td><input type="text" class="form-control" name="vId" value="${vvo.name}" readonly></td>
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
                     <img src="download2?filename=${fname}" style="width:600px; height:350px;">
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
                     <input type="hidden" name="vTitle" value="${vvo.vTitle}">
                     <input type="hidden" name="vText" value="${vvo.vText}">
                     <input type="submit" class="btn btn-primary" value="수정">
                  </form>
               </td>
            </tr>
         </c:if>
       </table>
         <hr>
         ${replyNum-1}개의 댓글<br>
         <form action="villageReply_1Action" method="post" name="replyForm">
         <input type="text" class="form-control" id="replyText" name="r1Text" placeholder="댓글을 남겨보세요!(15자 제한)" style="width:550px;float:left;margin-left:310px;">
         <input type="button" value="작성" class="btn btn-primary" onclick="replyAction()" style="float:left">
         <input type="hidden" value="${vvo.vNum}" name="vNum">
         <input type="hidden" value="${login}" name="r1Id">
         <input type="hidden" value="${replyNum}" name="r1Num">
         </form>
         <br><br><hr>
         <c:forEach items="${replyList}" var="rList" varStatus="status">
         
         <div class="modiC${status.index}">
         <table class="form-control" style="width:600px">
         	<c:if test="${rList.r1Id.equals(vvo.vId)}">
         	<tr><td>${rList.r1Id}(작성자)</td></tr>
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
         		<input type="hidden" id="vNum${status.index}" value="${vvo.vNum}">
				<input type="hidden" id="r1Num${status.index}" value="${rList.r1Num}">
         		<span id = "r1Text${status.index}">${rList.r1Text}</span>
         		<span id ="r1TextInput${status.index}"></span>
         		</td>
         		<c:if test="${rList.r1Id eq login}">
         			<td style="padding-left:300px">
						<div class="btn-group">
  							<button  type="button" data-bs-toggle="dropdown" aria-expanded="false" style="border-radius:5px; background-color:rgb(13,110,253); border-style:none; color:white;">
    							≡
  							</button>
  							<ul class="dropdown-menu">
    							<li>
									<input type="button" value="수정" onclick="replyModBtn(${status.index})" style="border-radius:5px; background-color:rgb(13,110,253); border-style:none; color:white;">
    								<br>
    								<form action="villageReplyDelAction" method="get" >
										<input type="hidden" name="vNum" value="${vvo.vNum}">
										<input type="hidden" name="r1Num" value="${rList.r1Num}">
										<input type="submit"  value="삭제" style="border-radius:5px; background-color:rgb(13,110,253); border-style:none; color:white;"> 
									</form>
    							</li>
  							</ul>
						</div>
         			</td>
         		</c:if>
         	</tr>
         </table>
         <br>
         </div>
         </c:forEach>
         <input type="button" class="btn btn-primary" value="목록" onclick='location.href="villageBoard"'/>
   </div>
   <br>
   <%@ include file="../bbs/footer.jsp"%>
</body>

<script>
function replyAction(){
	var text = document.getElementById("replyText").value;
	if(text != ""){
		document.replyForm.submit();
	}else{
		alert("입력하세욧");
	}
}
function replyModBtn(index){
	let msg = "수정하시겠습니까?";
    if(confirm(msg)!=0){ 
		var text = document.getElementById("r1Text"+index+"").innerHTML;
		var modiF = document.getElementById("r1TextInput"+index+"");
		document.getElementById("r1Text"+index+"").remove();
		modiF.innerHTML="<input type='text' id='input' value="+text+">";
		modiF.innerHTML+="<input type='button' id='modBtn' onclick='modAction("+index+")' value='확인' style='border-radius:5px; background-color:rgb(13,110,253); border-style:none; color:white;'>";
		modiF.innerHTML+="<input type='button' id='backBtn' onclick='back()' value='취소' style='border-radius:5px; background-color:rgb(13,110,253); border-style:none; color:white;'>";
    	
		$('html').click(function(e) { //모든 태그를 클릭했을시 함수 실행
            var modForm = document.querySelector('.modiC'+index);
            var click = e.target; //클릭한 곳을 의미합니다..
            var flag = 0; 
            
            while(click != null){ //만약 클릭을 했다면
            	click = click.parentNode; //클릭한 곳의 부모노드를 저장
               	if(modForm == click) { //만약 클릭한 곳의 부모노드가  해당 댓글의 부모노드라면 아무것도 실행하지 않음
               		flag = 1;
                  	break;         
               	} 
            }
            
            if(flag == 0){ //다른 태그를 눌렀을 시
                modiF.innerHTML = "";
                modiF.innerHTML="<span id = 'r1Text"+index+"'>"+text+"</span>";
            }
            
		});   
		
		 back=()=>{ //취소 버튼을 눌렀을 시
        	modiF.innerHTML = "";
        	modiF.innerHTML="<span id = 'r1Text"+index+"'>"+text+"</span>";
        }
    }
}
function modAction(index){
	var modiF = document.getElementById("r1TextInput"+index+"");
	var r1Text = $('#input').val();
	var vNum = $('#vNum'+index).val();
	var r1Num = $('#r1Num'+index).val();
	if(r1Text != ""){
		var data = {
				r1Text : r1Text,
				vNum : vNum,
				r1Num : r1Num
		}
		$.ajax({
			type : "post",
			url : "villageReplyModAction",
			data : data,
			success : function(){
				modiF.innerHTML = "";
	        	modiF.innerHTML="<span id = 'r1Text"+index+"'>"+r1Text+"</span>";
			},
			error : function(){
				alert("error");
			}
		});	
	}else{
		alert("입력하세욧");
	}
}


</script>
</html>
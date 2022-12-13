<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
   <script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
	.list-group{
		width:200px;
		float:left;
	}
	.list-group a{
		font-size : 15px;
	}
	#myInfo{
		width : 1200px;
		height : 800px;
	}
	#profile{
      	width : 250px;
      	float:left;
	}
	#myInfo h2{
		text-align: center;
	}
	#myInfo img{
		width : 200px;
		float : center;
		padding-left:30px;	
	}
	#uploadButton{
      width: 200px;
      float:left;
    }
   
	#joinTable {
   		width : 750px;
   		float:right;
	}
	.form-control {
   		margin-left: 50px;
   		margin-top: 15px;
	}

	.form-text {
   		margin-left: 50px;
	}

	.form-select {
   		margin-left: 50px;
   		margin-top: 15px;
	}
	
</style>
<body>
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<%@ page import="com.billy.VO.*" %>
	<% BillyMemberVO myInfo = (BillyMemberVO)request.getAttribute("myInfo"); %>
	<form name="frm" action="billyMemberModAction" method="POST" encType="multipart/form-data">
	<section id="myInfo">
	<div class="list-group">
	<a href="myPage?id=${login}" class="list-group-item list-group-item-action active" aria-current="true">내 정보</a>
  	<a href="#" class="list-group-item list-group-item-action">찜 목록</a>
  	<a href="#" class="list-group-item list-group-item-action">등록한 물품</a>
  	<a href="#" class="list-group-item list-group-item-action">대여한 물품</a>
  	<a href="#" class="list-group-item list-group-item-action">빌리 내역</a>
  	<a href="deleteMemberPage?id=${myInfo.getId()}" class="list-group-item list-group-item-action">회원탈퇴</a>
	</div>
	
	
	<h2>내 정보</h2>
	<div id="profile">
	

	<c:choose>
		<c:when test="${myInfo.getPhotoName().equals('N')}">
			<button id='imgBtn1' type='button'>
			<img src='resources/img/basic.png' class='rounded mx-auto d-block' onclick="delImg1()">
			</button>
		</c:when>
		<c:otherwise>
		<button id='imgBtn2' type='button'>
		<img src="download3?filename=${myInfo.getPhotoName()}">
		</button>
		</c:otherwise>
	</c:choose>
	<!-- <img src="resources/img/basic.png" class="rounded mx-auto d-block" alt="..."> -->
	<!-- <input type="file" name="file" id ="uploadButton" class="form-control" accept="image/gif, image/jpeg, image/png"> -->
	<span id="fileAttach"></span>
	</div>
	
         <table id="joinTable">
            <tr>
               <td align=center>아이디</td>
               <td><input type="text" name="id" id="id" class="form-control"
                  aria-describedby="idHelpInline" value="${myInfo.getId()}" readonly></td>
            </tr>
            <tr>
               <td align=center>비밀번호</td>
               <td><input type="password" name="pwd" id="pwd"
                  class="form-control" aria-describedby="pwdHelpInline" value="${myInfo.getPwd()}" maxlength="20"> <span
                  id="pwdHelpInline" class="form-text"> 비밀번호는 8-20자
                     영문,숫자,특수문자를 포함하여야 합니다. </span></td>
            </tr>
            <tr>
               <td align=center>비밀번호확인</td>
               <td><input type="password" name="pwdChk" id="pwdChk"
                  class="form-control" aria-describedby="pwdChkHelpInline" value="${myInfo.getPwd()}" maxlength="20">
                  <span id="pwdChkHelpInline" class="form-text"> </span></td>

            </tr>
            <tr>
               <td align=center>전화번호</td>
               <td><input type="text" name="tel" id="tel"
                  class="form-control" aria-describedby="telHelpInline" value="${myInfo.getTel()}" maxlength="11"> <span
                  id="telHelpInline" class="form-text"> 전화번호는 -를 제외하고 숫자만 입력합니다. </span></td>
            </tr>
            <tr>
               <td align=center>별명</td>
               <td><input type="text" name="name" id="name"
                  class="form-control" aria-describedby="nameHelpInline" value="${myInfo.getName()}" maxlength="20"> <span
                  id="nameHelpInline" class="form-text"></span></td>
                  <td><input type="button" class="btn btn-primary" id="nameChk" value="닉네임 중복확인" style="display:none">
            	  </td>
            </tr>
            <tr>
               <td align=center>Email</td>
               <td><input type="email" name="email" id="email" class="form-control" aria-describedby="emailHelpInline"
                  value="${myInfo.getEmail()}"> <span
                  id="emailHelpInline" class="form-text"></span></td>
            </tr>
            <tr>
               <td align=center>비밀번호 찾기용 질문</td>
               <td><select class="form-select" name="pwdQuiz" id="pwdQuiz"
                  aria-label="Default select example">
                  <%
                  if(myInfo.getPwdQuiz().equals("1")){
                	  out.print("<option value='1'selected>기억에 남는 추억의 장소는?</option>");					  
                  }else if(myInfo.getPwdQuiz().equals("2")){
                	  out.print("<option value='2'>자신의 보물 제 1호는?</option>");	
                  }else if(myInfo.getPwdQuiz().equals("3")){
                	  out.print("<option value='3'>인상 깊게 읽은 책 이름은?</option>");	
                  }else if(myInfo.getPwdQuiz().equals("4")){
                	  out.print("<option value='4'>다시 태어나면 되고 싶은 것은?</option>");	
                  }else if(myInfo.getPwdQuiz().equals("5")){
                	  out.print("<option value='5'>내가 좋아하는 캐릭터는?</option>");	
                  }else if(myInfo.getPwdQuiz().equals("6")){
                	  out.print("<option value='6'>유년시절 가장 생각나는 친구이름은?</option>");	
                  }else if(myInfo.getPwdQuiz().equals("7")){
                	  out.print("<option value='7'>가장 기억에 남는 선생님 성함은?</option>");	
                  }else if(myInfo.getPwdQuiz().equals("8")){
                	  out.print("<option value='8'>자신의 인생 좌우명은?</option>");	
                  }else if(myInfo.getPwdQuiz().equals("9")){
                	  out.print("<option value='9'>기억에 남는 내 별명은?</option>");	
                  }else if(myInfo.getPwdQuiz().equals("10")){
                	  out.print("<option value='10'>받았던 선물 중 기억에 남는 독특한 선물은?</option>");	
                  }
                  %>
                     <option value="1">기억에 남는 추억의 장소는?</option>
                     <option value="2">자신의 보물 제 1호는?</option>
                     <option value="3">인상 깊게 읽은 책 이름은?</option>
                     <option value="4">다시 태어나면 되고 싶은 것은?</option>
                     <option value="5">내가 좋아하는 캐릭터는?</option>
                     <option value="6">유년시절 가장 생각나는 친구이름은?</option>
                     <option value="7">가장 기억에 남는 선생님 성함은?</option>
                     <option value="8">자신의 인생 좌우명은?</option>
                     <option value="9">기억에 남는 내 별명은?</option>
                     <option value="10">받았던 선물 중 기억에 남는 독특한 선물은?</option>
               </select>
            </td>
            </tr>
            <tr>
               <td align=center>비밀번호 찾기 질문 답</td>
               <td><input type="text" name="pwdAnswer" id="answer"
                  class="form-control" aria-describedby="answerHelpInline" value="${myInfo.getPwdAnswer()}"><span
                  id="answerHelpInline" class="form-text"></span></td>
            </tr>
            <tr>
               <td align=center>주소</td>
               <td><input type="text" class="form-control"
                  id="sample5_address" placeholder="주소" onclick="sample5_execDaumPostcode()" name="loc" aria-describedby="locHelpInline" value="${myInfo.getLoc()}"><span
                  id="locHelpInline" class="form-text"></span></td>
               <!-- <td><input type="button" class="btn btn-primary" onclick="sample5_execDaumPostcode()"
                  value="주소 검색"></td> -->
            </tr>
            <!-- <tr>
               <td align=center>프로필사진</td>
               <td>
                  <div class="input-group mb-3">
                     <input type="file" name="photoName" class="form-control" id="inputGroupFile02">
                  </div>
               </td>
            </tr> -->
            <tr>
            
            </tr>
         </table>
           <input type="button" class="btn btn-primary" onclick="joinform_check();" value="수정하기">
         </form>   
	</section>

	<%@ include file="../bbs/footer.jsp"%>
</body>
<script type="text/javascript">
//------------------첨부파일수정-------------------
function delImg1(){	
		$('#imgBtn1').remove();
		document.getElementById('fileAttach').innerHTML="<input type='file' name='file' id ='uploadButton' class='form-control' accept='image/gif, image/jpeg, image/png'>";
		//document.getElementById('delImg0').innerHTML="<input type='hidden' name='delFiles' value='"+a+"'>";
	}








function sample5_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.address; // 최종 주소 변수
            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("sample5_address").value = addr;
        }
    }).open();
}
 //-----------------------유효성 검사 완료해야 회원가입되게---------------------------------//
 var idChkFlag = false;
 var nameChkFlag = false;
 var getName="${myInfo.getName()}";
 function joinform_check(){

    //--비밀번호
    var inPwd = document.getElementById('pwd').value;
    if(inPwd==""){   //비밀번호값이 없다면 넘어가지않게
       document.getElementById('pwdHelpInline').innerHTML="<span style='color: red;'>비밀번호를 입력해주세요.</span>";
       return false;
    }
    var chkPwd =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$!@#$%/^&*?<>|+=}{])[A-Za-z\d$!@#$%/^&*?<>|+=}{]{8,20}$/;
    if(!chkPwd.test(inPwd)){   //유효성 어긋나면 넘어가지않게
       document.getElementById('pwdHelpInline').innerHTML="<span style='color: red;'>비밀번호형식이 맞지않습니다.</span>";
       return false;
    }
    
    //--비밀번호확인
    var inPwdChk = document.getElementById('pwdChk').value;
    if(inPwdChk==""){   //비밀번호확인값이 없다면 넘어가지않게
       document.getElementById('pwdChkHelpInline').innerHTML ="<span style='color: red;'>비밀번호를 한번 더 입력해주세요.</span>";
       return false;
    }
    if(inPwd!=inPwd){   //일치하지않는다면 넘어가지않게
       document.getElementById('pwdChkHelpInline').innerHTML ="<span style='color: red;'>비밀번호가 일치하지 않습니다!</span>";
       return false;
    }
    
    //--전화번호
    var inTel = document.getElementById('tel').value;
    if(inTel==""){   //전화번호값이 없다면 넘어가지않게
       document.getElementById('telHelpInline').innerHTML ="<span style='color: red;'>전화번호를 입력해주세요.</span>";
       return false;
    }
  	var chkTel =  /^010([0-9]{8})$/;
    if(!chkTel.test(inTel)){   //전화번호유효성이 안맞다면 넘어가지않게
       document.getElementById('telHelpInline').innerHTML ="<span style='color: red;'>전화번호 형식이 올바르지 않습니다!</span>";
       return false;
    }
    
    //--별명
    var inName = document.getElementById('name').value;
    if(inName==""){   //값이 없다면 넘어가지않게
       document.getElementById('idHelpInline').innerHTML="<span style='color: red;'>닉네임을 입력해주세요.</span>"
       return false;
    }

    if(getName==inName){
    	nameChkFlag = true;
    }
        
    if(nameChkFlag==false){
    	document.getElementById('nameHelpInline').innerHTML="<span style='color: red;'>닉네임 중복확인이 필요합니다</span>";
        return false;
    }
    
    
    //--주소
    var inLoc = document.getElementById('sample5_address').value;
    if(inLoc==""){   //주소값이없다면 넘어가지않게
       document.getElementById('locHelpInline').innerHTML ="<span style='color: red;'>주소를 입력해주세요</span>";
       return false;
    }else{
    	document.getElementById('locHelpInline').innerHTML ="";
    }
    
    //--이메일
    var inEmail = document.getElementById('email').value;
    if(inEmail==""){   //이메일값이 없다면 넘어가지않게
       document.getElementById('emailHelpInline').innerHTML ="<span style='color: red;'>이메일을 입력해주세요</span>";
       return false;
    }
    var chkEmail =  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;;
    if(!chkEmail.test(inEmail)){	//이메일 유효성맞지않으면 넘어가지않게
       document.getElementById('emailHelpInline').innerHTML ="<span style='color: red;'>이메일 형식이 맞지않습니다!</span>";
       return false;
    }else{
       document.getElementById('emailHelpInline').innerHTML ="<span style='color: green;'>사용가능</span>";
    }
    
    //--비밀번호질문
    var inPwdQuiz = document.getElementById('pwdQuiz').value;
    if(inPwdQuiz==""){	//질문을 선택하지않으면 넘어가지않게
       alert('비밀번호 찾기 질문을 선택후 답을 입력해주세요.');
       return false;
    }
    
    //--비밀번호질문 답변
    var inPwdAnswer = document.getElementById('answer').value;
    if(inPwdAnswer==""){	//비밀번호 질문 답변을 입력하지않으면 넘어가지않게
       document.getElementById('answerHelpInline').innerHTML ="<span style='color: red;'>질문의 답을 입력해주세요.</span>";
       return false;
    }else{
       document.getElementById('answerHelpInline').innerHTML ="";
    } 
    
    //--모든게 만족하면 submit해라
    document.frm.submit();
 }


//-----------------------비밀번호 유효성체크 & 비밀번호 확인---------------------------------//
document.getElementById('pwd').onchange = () =>{
  var inPwd = document.getElementById('pwd').value;
  var chkPwd =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$!@#$%/^&*?<>|+=}{])[A-Za-z\d$!@#$%/^&*?<>|+=}{]{8,20}$/;
  if(chkPwd.test(inPwd)){
       document.getElementById('pwdHelpInline').innerHTML ="<span style='color: green;'>사용가능</span>";
    }else{
       document.getElementById('pwdHelpInline').innerHTML="<span style='color: red;'>비밀번호형식이 맞지않습니다.</span>";
    }
}

document.getElementById('pwdChk').onchange = () =>{
  var inPwd = document.getElementById('pwd').value;
  var chkPwd = document.getElementById('pwdChk').value;
  if(inPwd==chkPwd){
     document.getElementById('pwdChkHelpInline').innerHTML ="<span style='color: green;'>비밀번호 확인</span>";
  }else{
     document.getElementById('pwdChkHelpInline').innerHTML ="<span style='color: red;'>비밀번호가 일치하지 않습니다!</span>";
  }
}

//-----------------------전화번호 유효성체크---------------------------------//
document.getElementById('tel').onchange = () =>{
     var inTel = document.getElementById('tel').value;
     var chkTel =  /^010([0-9]{8})$/;
     if(chkTel.test(inTel)){
        document.getElementById('telHelpInline').innerHTML ="<span style='color: green;'>사용가능</span>";
     }else{
        document.getElementById('telHelpInline').innerHTML ="<span style='color: red;'>전화번호 형식이 올바르지 않습니다!</span>";
     } 
}

//-----------------------닉네임 유효성체크---------------------------------//
document.getElementById('name').onchange = () =>{
	$('#nameChk').show();
  var inName = document.getElementById('name').value;
  if(inName!=""){
	  document.getElementById('nameHelpInline').innerHTML ="<span style='color: green;'>닉네임 중복확인을 해주세요</span>"; 
	  $('#nameChk').click(function() {
          var name = $('#name').val();
          var data = {
          	name : name
          } 
          $.ajax({
             type : "post",
             url : "chkName",
             data : data,
             success : function(result) {
                if (result != 'fail') {
                   document.getElementById('nameHelpInline').innerHTML ="<span style='color: green;'>사용가능한 닉네임입니다</span>";
                   document.getElementById('name').readOnly=true;
                   nameChkFlag = true;
                   $('#nameChk').hide();
                }else {
                   document.getElementById('nameHelpInline').innerHTML ="<span style='color: red;'>이미 사용중인 닉네임입니다!</span>";
                }// success 종료
             }
          }); // ajax 종료   

       });// function 종료
  }
	}

//-----------------------Email 유효성체크---------------------------------//
document.getElementById('email').onchange = () =>{
  var inEmail = document.getElementById('email').value;
  var chkEmail =  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;;
  if(chkEmail.test(inEmail)){
     document.getElementById('emailHelpInline').innerHTML ="<span style='color: green;'>사용가능</span>";
  }else{
     document.getElementById('emailHelpInline').innerHTML ="<span style='color: red;'>이메일 형식이 올바르지 않습니다!</span>";
  }  
}  
</script>
</html>
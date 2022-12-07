<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
<style>
#joinForm {
   width: 1200px;
   height: 800px;
}

#joinTable {
   margin: 0px auto;
}

#join {
   font-size: 30px;
}

#joinTop {
   margin-left: 500px;
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
   
   <section id="joinForm">
      <div id="joinTop">
         <img src="resources/img/logo.png" alt="Logo" width="100" height="50">
         <span id="join">회원가입</span>
      </div>
         <form name="frm" action="joinAction" method="POST" encType="multipart/form-data">
         <table id="joinTable">
            <tr>
               <td align=center>아이디</td>
               <td><input type="text" name="id" id="id" class="form-control"
                  aria-describedby="idHelpInline"> <span id="idHelpInline"
                  class="form-text"> ID는 8-20자, 문자와 숫자를 포함하여야 합니다. </span></td>
                  <td>
                  <input type="button" class="btn btn-primary" id="idChk"value="아이디 중복확인">
                  <img src="resources/img/chk.png" id="id_check_sucess" width="30 height="30" style="display: none;">
                  </td>

            </tr>
            <tr>
               <td align=center>비밀번호</td>
               <td><input type="password" name="pwd" id="pwd"
                  class="form-control" aria-describedby="pwdHelpInline"> <span
                  id="pwdHelpInline" class="form-text"> 비밀번호는 8-20자
                     영문,숫자,특수문자를 포함하여야 합니다. </span></td>
            </tr>
            <tr>
               <td align=center>비밀번호확인</td>
               <td><input type="password" name="pwdChk" id="pwdChk"
                  class="form-control" aria-describedby="pwdChkHelpInline">
                  <span id="pwdChkHelpInline" class="form-text"> </span></td>

            </tr>
            <tr>
               <td align=center>전화번호</td>
               <td><input type="text" name="tel" id="tel"
                  class="form-control" aria-describedby="telHelpInline" placeholder="Ex) 01011112222"> <span
                  id="telHelpInline" class="form-text"> 전화번호는 -를 제외하고 숫자만 입력합니다. </span></td>
            </tr>
            <tr>
               <td align=center>별명</td>
               <td><input type="text" name="name" id="name"
                  class="form-control" aria-describedby="nameHelpInline"> <span
                  id="nameHelpInline" class="form-text"></span></td></td>
            </tr>
            <tr>
               <td align=center>Email</td>
               <td><input type="email" name="email" id="email" class="form-control" aria-describedby="emailHelpInline"
                  placeholder="Ex) name@example.com"> <span
                  id="emailHelpInline" class="form-text"></span></td>
            </tr>
            <tr>
               <td align=center>비밀번호 찾기용 질문</td>
               <td><select class="form-select" name="pwdQuiz" id="pwdQuiz"
                  aria-label="Default select example">
                     <option selected="" value="">▶ 질문을 선택하세요</option>
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
                  class="form-control" aria-describedby="answerHelpInline"><span
                  id="answerHelpInline" class="form-text"></span></td>
            </tr>
            <tr>
               <td align=center>지역설정</td>
               <td><input type="text" class="form-control"
                  id="sample5_address" placeholder="주소" onclick="sample5_execDaumPostcode()" name="loc" aria-describedby="locHelpInline"><span
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
         </table>
         <input type="button" class="btn btn-primary" onclick="joinform_check();" value="가입하기">   
         </form>   
   </section>
   
   <%@ include file="../bbs/footer.jsp"%>
</body>
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
    function joinform_check(){
        var inID = document.getElementById('id').value;
        if(inID==""){   //아이디값이 없다면
           document.getElementById('idHelpInline').innerHTML="<span style='color: red;'>ID를 입력해주세요.</span>"
           return false;
        }
        var chkWord = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z0-9]{8,20}$/;
        if(!chkWord.test(inID)){   //유효성이 어긋나면
           document.getElementById('idHelpInline').innerHTML="<span style='color: red;'>ID는 8-20자, 문자와 숫자를 포함하여야 합니다.</span>"
           return false;
        }
        
        var inPwd = document.getElementById('pwd').value;
        if(inPwd==""){   //비밀번호값이 없다면
           document.getElementById('pwdHelpInline').innerHTML="<span style='color: red;'>비밀번호를 입력해주세요.</span>";
           return false;
        }
        var chkPwd =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$!@#$%/^&*?<>|+=}{])[A-Za-z\d$!@#$%/^&*?<>|+=}{]{8,20}$/;
        if(!chkPwd.test(inPwd)){   //유효성 어긋나면
           document.getElementById('pwdHelpInline').innerHTML="<span style='color: red;'>비밀번호형식이 맞지않습니다.</span>";
           return false;
        }
        
        var inPwdChk = document.getElementById('pwdChk').value;
        if(inPwdChk==""){   //비밀번호확인값이 없다면
           document.getElementById('pwdChkHelpInline').innerHTML ="<span style='color: red;'>비밀번호를 한번 더 입력해주세요.</span>";
           return false;
        }
        if(inPwd!=inPwd){   //일치하지않는다면
           document.getElementById('pwdChkHelpInline').innerHTML ="<span style='color: red;'>비밀번호가 일치하지 않습니다!</span>";
           return false;
        }
        
        var inTel = document.getElementById('tel').value;
        if(inTel==""){   //전화번호값이 없다면
           document.getElementById('telHelpInline').innerHTML ="<span style='color: red;'>전화번호를 입력해주세요.</span>";
           return false;
        }
      var chkTel =  /^010([0-9]{8})$/;
        if(!chkTel.test(inTel)){   //전화번호유효성이 안맞다면
           document.getElementById('telHelpInline').innerHTML ="<span style='color: red;'>전화번호 형식이 올바르지 않습니다!</span>";
           return false;
        }
        
        var inName = document.getElementById('name').value;
        if(inName==""){   //닉네임 값이 없다면
           document.getElementById('nameHelpInline').innerHTML ="<span style='color: red;'>닉네임을 입력해주세요</span>";
           return false;
        }else{         //값이 있다면
           document.getElementById('nameHelpInline').innerHTML ="<span style='color: green;'>사용가능</span>";
        }
        
        var inLoc = document.getElementById('sample5_address').value;
        if(inLoc==""){   //지역값이없다면
           document.getElementById('locHelpInline').innerHTML ="<span style='color: red;'>주소를 입력해주세요</span>";
           return false;
        }
              
        var inEmail = document.getElementById('email').value;
        if(inEmail==""){   //이메일값이 없다면
           document.getElementById('emailHelpInline').innerHTML ="<span style='color: red;'>이메일을 입력해주세요</span>";
           return false;
        }
        var chkEmail =  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;;
        if(!chkEmail.test(inEmail)){
           document.getElementById('emailHelpInline').innerHTML ="<span style='color: red;'>이메일 형식이 맞지않습니다!</span>";
           return false;
        }else{
           document.getElementById('emailHelpInline').innerHTML ="<span style='color: green;'>사용가능</span>";
        }
        
        var inPwdQuiz = document.getElementById('pwdQuiz').value;
        if(inPwdQuiz==""){
           alert('비밀번호 찾기 질문을 선택후 답을 입력해주세요.');
           return false;
        }
        var inPwdAnswer = document.getElementById('answer').value;
        if(inPwdAnswer==""){
           document.getElementById('answerHelpInline').innerHTML ="<span style='color: red;'>질문의 답을 입력해주세요.</span>";
           return false;
        }else{
           document.getElementById('answerHelpInline').innerHTML ="";
        } 
        
        document.frm.submit();
     }
     
     
     
     
    //-----------------------id유효성체크---------------------------------//
    document.getElementById('id').onchange = () =>{
        var inID = document.getElementById('id').value;       
        var chkWord = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z0-9]{8,20}$/;
        if(chkWord.test(inID)){         
           document.getElementById('idHelpInline').innerHTML ="<span style='color: green;'>사용가능</span>";
        }else if(inID==''){
           document.getElementById('idHelpInline').innerHTML="<span style='color: red;'>ID는 8-20자, 문자와 숫자를 포함하여야 합니다.</span>";
    
        }else{
           document.getElementById('idHelpInline').innerHTML="<span style='color: red;'>ID형식이 맞지않습니다.</span>";
           inID.value='';
        }
     }
  //-----------------------id중복체크---------------------------------//
      $('#idChk').click(function() {
         console.log("keyup 테스트");
         var id = $('#id').val(); // .id_input에 입력되는 값
         var data = {
            id : id
         } // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
         if ($('#id').val() == '') {
            document.getElementById('idHelpInline').innerHTML ="<span style='color: red;'>이미 존재하는 ID입니다!</span>";
             return;
           }
         $.ajax({
            type : "post",
            url : "idChk",
            data : data,
            success : function(result) {
               if (result != 'fail') {
                  document.getElementById('idHelpInline').innerHTML ="<span style='color: green;'>사용가능한 아이디입니다</span>";
                  document.getElementById('id').readOnly=true;
                  $('#id_check_sucess').show();
                  $('#idChk').hide();
               } else {
                  document.getElementById('idHelpInline').innerHTML ="<span style='color: red;'>ID를 입력하세요!</span>";
               }// success 종료
            }
         }); // ajax 종료   

      });// function 종료

    
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
   
  //-----------------------Email 유효성체크---------------------------------//
   document.getElementById('email').onchange = () =>{
      var inEmail = document.getElementById('email').value;
      var chkEmail =  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;;
      if(chkEmail.test(inEmail)){
         document.getElementById('emialHelpInline').innerHTML ="<span style='color: green;'>사용가능</span>";
      }else{
         document.getElementById('emailHelpInline').innerHTML ="<span style='color: red;'>이메일 형식이 올바르지 않습니다!</span>";
      }  
   }  
</script>
</html>
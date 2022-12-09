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
     function joinform_check(){
    	
    	 //--id
        var inID = document.getElementById('id').value;
        if(inID==""){   //아이디값이 없다면 넘어가지않게
           document.getElementById('idHelpInline').innerHTML="<span style='color: red;'>ID를 입력해주세요.</span>"
           return false;
        }        
        var chkWord = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z0-9]{8,20}$/;
        if(!chkWord.test(inID)){   //유효성이 어긋나면 넘어가지않게
           document.getElementById('idHelpInline').innerHTML="<span style='color: red;'>ID는 8-20자, 문자와 숫자를 포함하여야 합니다.</span>"
           return false;
        }
       	if(idChkFlag==false){	//중복확인을 안하면 넘어가지않게
       		alert('ID중복확인이 필요합니다');
       		return false;
       	}
        
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
        
        //--별명(공사중)
        var inName = document.getElementById('name').value;
        if(inName==""){   //값이 없다면 넘어가지않게
           document.getElementById('idHelpInline').innerHTML="<span style='color: red;'>닉네임을 입력해주세요.</span>"
           return false;
        }
        if(nameChkFlag==false){	//중복확인을 안하면 넘어가지않게
       		alert('닉네임 중복확인이 필요합니다');
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
         
     
    //-----------------------id유효성체크---------------------------------//
    document.getElementById('id').onchange = () =>{
        var inID = document.getElementById('id').value;       
        var chkWord = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z0-9]{8,20}$/;
        if(chkWord.test(inID)){      
           document.getElementById('idHelpInline').innerHTML ="<span style='color: green;'>ID중복검사를 해주세요</span>";
          //--------유효성 검사를 통과하면 id중복체크가 가능하게-------//
           $('#idChk').click(function() {
               var id = $('#id').val(); 
               var data = {
                  id : id
               } 
               $.ajax({
                  type : "post",
                  url : "chkId",
                  data : data,
                  success : function(result) {
                     if (result != 'fail') {
                        document.getElementById('idHelpInline').innerHTML ="<span style='color: green;'>사용가능한 아이디입니다</span>";
                        document.getElementById('id').readOnly=true;
                        idChkFlag = true;
                        $('#idChk').hide();
                     }else {
                        document.getElementById('idHelpInline').innerHTML ="<span style='color: red;'>이미 사용중인 ID입니다!</span>";
                     }// success 종료
                  }
               }); // ajax 종료   

            });// function 종료
            
        }else if(inID==''){
           document.getElementById('idHelpInline').innerHTML="<span style='color: red;'>ID는 8-20자, 문자와 숫자를 포함하여야 합니다.</span>";
    
        }else{
           document.getElementById('idHelpInline').innerHTML="<span style='color: red;'>ID형식이 맞지않습니다.</span>";
           inID.value='';
        }
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
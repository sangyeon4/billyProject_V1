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
      	width : 200px;
      	float:left;
	}
	#myInfo h2{
		text-align: center;
	}
	#myInfo img{
		width : 200px;
		float : left;
		padding-left:30px;	
	}
	 #uploadButton{
      width: 200px;
      display : inline;
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
	<section id="myInfo">
	<div class="list-group">
	<a href="#" class="list-group-item list-group-item-action active" aria-current="true">내 정보</a>
  	<a href="#" class="list-group-item list-group-item-action">찜 목록</a>
  	<a href="#" class="list-group-item list-group-item-action">등록한 물품</a>
  	<a href="#" class="list-group-item list-group-item-action">대여한 물품</a>
  	<a href="#" class="list-group-item list-group-item-action">빌리 내역</a>
  	<a href="#" class="list-group-item list-group-item-action">회원탈퇴</a>
	</div>
	
	
	<h2>내 정보</h2>
	<div id="profile">	
	<img src="resources/img/basic.png" class="rounded mx-auto d-block" alt="...">
	<input type="file" id ="uploadButton" class="form-control" name="file" accept="image/gif, image/jpeg, image/png">
	</div>
	<form name="frm" action="joinAction" method="POST" encType="multipart/form-data">
         <table id="joinTable">
            <tr>
               <td align=center>아이디</td>
               <td><input type="text" name="id" id="id" class="form-control"
                  aria-describedby="idHelpInline" readonly></td>
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
                  id="nameHelpInline" class="form-text"></span></td>
                  <td><input type="button" class="btn btn-primary" id="nameChk" value="닉네임 중복확인">
            	  </td>
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
            
         </form>   
	</section>

	<%@ include file="../bbs/footer.jsp"%>
</body>
</html>
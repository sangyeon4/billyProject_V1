<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
 	
    
    	

<title>Bootstrap Example</title>

</head>
<body class="p-3 m-0 border-0 bd-example">
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<%@ include file="../bbs/notice.jsp"%>
	
	<!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

   <!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Bootstrap Datepicker CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
     
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Bootstrap 4 JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Bootstrap Datepicker JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		
		<div class="mb-3">
			<label for="gNumLB" class="form-label">글번호</label> 
			<input type="text" readonly class="form-control" name="gNum" value="${bvo.getgNum()}">
		</div>		
	   <div class="mb-3">
		 <label for="cateNumLB" class="form-label">카테고리</label>
		 <input type="hidden" value="${bvo.getCateNum()}">
		<c:choose>
			<c:when test="${bvo.getCateNum()==1}">
				<input type="text" class="form-control" readonly value="디지털기기">
			</c:when>
			<c:when test="${bvo.getCateNum()==2}">
				<input type="text" class="form-control" readonly value="생활가전">
			</c:when>
			<c:when test="${bvo.getCateNum()==3}">
				<input type="text" class="form-control" readonly value="가구/인테리어">
			</c:when>
			<c:when test="${bvo.getCateNum()==4}">
				<input type="text" class="form-control" readonly value="생활/주방">
			</c:when>
			<c:when test="${bvo.getCateNum()==5}">
				<input type="text" class="form-control" readonly value="유아동">
				<option value="5">유아동</option>
			</c:when>
			<c:when test="${bvo.getCateNum()==6}">
				<input type="text" class="form-control" readonly value="스포츠/레저">
			</c:when>
			<c:when test="${bvo.getCateNum()==7}">
				<input type="text" class="form-control" readonly value="취미/게임">
			</c:when>
			<c:when test="${bvo.getCateNum()==8}">
				<input type="text" class="form-control" readonly value="기타">
			</c:when>
		</c:choose>
		<div class="mb-3">
			<label for="nameLB" class="form-label">빌리이름</label> 
			<input type="text" readonly class="form-control" name="name" value="${bvo.getName()}">
		</div>	
		<div class="mb-3">
			<label for="gNameLB" class="form-label">상품이름</label> 
			<input type="text" readonly class="form-control" name="gName" value="${bvo.getgName()}">
		</div>	
		<div class="mb-3">
			<label for="gLocaLB" class="form-label">지역</label> 
			<input type="text" readonly class="form-control" name="gLoca" value="${bvo.getgLoca()}">
		</div>
		<div class="mb-3">
			<label for="dateSelect" class="form-label">날짜 선택 </label><br>
			   <input type="text" class="datepicker"  placeholder="${bvo.getgStrDate()} ~ ${bvo.getgEndDate()}" name="date"
			   style="width: 200;">			   
		</div>
		<div class="mb-3">
        	 <label for="gPriceLB" class="form-label" >하루당 가격</label> 
        	 <input type="number" class="form-control" readonly  value="${bvo.getgPrice()}">
      	</div>
      	<div class="mb-3">
        	 <label for="totalGpriceLB" class="form-label">총액</label> 
        	 <input type="number" class="form-control" readonly name="gPrice" id="gPrice" >
      	</div>
      	<div class="mb-3">
         	<label for="gTextLB" class="form-label">내용</label>
         	<textarea class="form-control" readonly name="gText" >${bvo.getgText()}</textarea>
      	</div>
      	<div class="mb-3">			
			<c:forEach
				items="${bvo.getFiles()}" var="fname">
				<img src="download1?filename=${fname}">
				<br>
			</c:forEach>
		</div>	
		<br> <br> <input type="button" class="btn btn-primary" value="뒤로가기"
			onclick="history.go(-1)">
			<!-- 세션아이디체크 --><!-- 세션아이디가 해당글에 좋아요 클릭유무 -->
		<c:if test="${bvo.getId()!=login}"> 
			<input type="button" class="btn btn-primary" value="빌리기">
			<c:choose> 
				<c:when test="${like>0}">
					<button type="button" class="LikeBtn">
						<img id="likeImg" src="resources/img/star-fill.svg" width="25"
							height="25">
					</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="LikeBtn">
						<img id="likeImg" src="resources/img/star.svg" width="25"
							height="25">
					</button>
				</c:otherwise>
			</c:choose>
		</c:if>
		<c:if test="${bvo.getId()==login}">
			<input type="button" class="btn btn-primary" value="수정하기"
				onclick="location.href='billyModForm?vno=${bvo.getgNum()}'">
		</c:if>	  
	</div>
	<%@ include file="../bbs/footer.jsp"%>
  
</body>
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
var today=new Date();
var strDate='${bvo.getgStrDate()}';
var endDate='${bvo.getgEndDate()}';
var tempDate=new Date(); //글에 올려진 날이 지났다면 최소 선택일을 오늘로 변경
if(today<=tempDate){
	strDate=today;
}


var datesForDisable = ["2023-01-10", "2022-12-20","2022-12-21","2023-01-03"];

var likeval = ${like};
var id='${login}';
var gNum = ${bvo.getgNum()};
var likeImg=document.getElementById("likeImg");
var data= {
		id:id,
		gNum:gNum
}
console.log(gNum + "--gNum디버깅");
console.log(id + "--id디버깅");	
$('.LikeBtn').click(function() {
		if (likeval > 0) {
			likeval = 0;
			likeImg.src = "resources/img/star.svg";		
			$.ajax({
				type : 'post',
				url : 'likeDown',
				data : data,
				success : function(data) {
					alert('취소');
				}
			})// 아작스 끝
		} else {
			likeImg.src = "resources/img/star-fill.svg";		
			likeval = 1;
			$.ajax({
				type : 'post',
				url : 'likeUp',
				data : data,
				success : function(data) {
					alert('좋아요');
				}
			})// 아작스 끝
		}
	});



$('.datepicker').datepicker({
    clearBtn: true,
    format: 'yyyy-mm-dd',

    startDate: strDate,
    endDate: endDate,  

    multidate: true,
    multidateSeparator: ",",
    todayHighlight: true,
    templates: {
        leftArrow: '&laquo;',
        rightArrow: '&raquo;',
     }, 
    datesDisabled: datesForDisable, 
    language : "ko"
    
});


 
    </script>
</html>
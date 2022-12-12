<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>Bootstrap Example</title>

</head>
<body class="p-3 m-0 border-0 bd-example">
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<%@ include file="../bbs/notice.jsp"%>
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
				<option value="6">스포츠/레저</option>
			</c:when>
			<c:when test="${bvo.getCateNum()==7}">
			<input type="text" class="form-control" readonly value="취미/게임">	
				<option value="7">취미/게임</option>
			</c:when>
			<c:when test="${bvo.getCateNum()==8}">
			<input type="text" class="form-control" readonly value="기타">	
				<option value="8">기타</option>
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
			<label for="dateSelect" class="form-label">날짜 선택 </label><br> <input
				type="text" name="gStrDate" id="from" autocomplete="off"
				placeholder="${bvo.getgStrDate()}"> <input type="text"
				name="gEndDate" id="to" autocomplete="off"
				placeholder="${bvo.getgEndDate()}">
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
var strDate='${bvo.getgStrDate()}';
var endDate='${bvo.getgEndDate()}';

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
	})
	
	
$(function() {     
    var dateFormat = "yy/mm/dd",
      from = $( "#from" )
        .datepicker({
          showMonthAfterYear: true, //연도,달 순서로 지정
          changeMonth: true,//달 변경 지정
          dateFormat:"yy/mm/dd",//날짜 포맷
          dayNamesMin: ["일", "월", "화", "수", "목", "금", "토" ],//요일 이름 지정
          monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],//월 이름 지정
          minDate:strDate, //오늘 이전 날짜를 선택할 수 없음
          maxDate:endDate
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate(this) );//종료일의 minDate 지정
        }),
      to = $( "#to" ).datepicker({
     showMonthAfterYear: true,  
        changeMonth: true,
        dateFormat:"yy/mm/dd",
        dayNamesMin: ["일", "월", "화", "수", "목", "금", "토" ],
        monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
        minDate:'+1D', //내일부터 선택가능, 지정형식 예(+1D +1M +1Y)
      	maxDate:endDate
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate(this) );//시작일의 maxDate 지정
      });
 
    function getDate(element) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
        if(element.id == 'from'){
        date.setDate(date.getDate()+1);//종료일은 시작보다 하루 이후부터 지정할 수 있도록 설정
        }else{
         date.setDate(date.getDate()-1);//시작일은 종료일보다 하루 전부터 지정할 수 있도록 설정
        }
      } catch( error ) {
        date = null;
      }
      return date;
    }
  } );	
</script>
</html>
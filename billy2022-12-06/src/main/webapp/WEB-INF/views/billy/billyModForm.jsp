<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../bbs/bootstrap.jsp" %>
   <%@ include file="../bbs/header.jsp"%>
   <%@ include file="../bbs/nav.jsp"%>
   <%@ include file="../bbs/notice.jsp"%>
<div style="height:900px">
	<h1>글번호:${bvo.getgNum()} 수정하기</h1>
   <form name="frm" method="POST" action="billeyModAction"
      encType="multipart/form-data">

      <div class="mb-3">
         <label for="cateNumLB" class="form-label">카테고리</label> <select
				name="cateNum" class="form-control">
				<c:choose>
					<c:when test="${bvo.getCateNum()==1}">
						<option value="1">디지털기기</option>
					</c:when>
					<c:when test="${bvo.getCateNum()==2}">
						<option value="2">생활가전</option>
					</c:when>
					<c:when test="${bvo.getCateNum()==2}">
						<option value="2">생활가전</option>
					</c:when>
					<c:when test="${bvo.getCateNum()==3}">
						<option value="3">가구/인테리어</option>
					</c:when>
					<c:when test="${bvo.getCateNum()==4}">
						<option value="4">생활/주방</option>
					</c:when>
					<c:when test="${bvo.getCateNum()==5}">
						<option value="5">유아동</option>
					</c:when>
					<c:when test="${bvo.getCateNum()==6}">
						<option value="6">스포츠/레저</option>
					</c:when>
					<c:when test="${bvo.getCateNum()==7}">
						<option value="7">취미/게임</option>
					</c:when>
					<c:when test="${bvo.getCateNum()==8}">
						<option value="8">기타</option>
					</c:when>
				</c:choose>
				<option value="1">디지털기기</option>
				<option value="2">생활가전</option>
				<option value="3">가구/인테리어</option>
				<option value="4">생활/주방</option>
				<option value="5">유아동</option>
				<option value="6">스포츠/레저</option>
				<option value="7">취미/게임</option>
				<option value="8">기타</option>
			</select>
		</div>
		<div>
			<!-- 글정보 -->
			<input type="hidden" name="gNum" value="${bvo.getgNum()}"> <input
				type="hidden" name="id" value="${bvo.getId()}">
		</div>
		<div class="mb-3">
			<label for="gNameLB" class="form-label">상품이름</label> <input
				type="text" class="form-control" name="gName"
				value="${bvo.getgName()}">
		</div>
		<div class="mb-3">
			<label for="gLocaLB" class="form-label">지역 선택 </label> <input
				type="text" class="form-control" id="sample5_address"
				onclick="sample5_execDaumPostcode()" name="gLoca"
				aria-describedby="locHelpInline" value="${bvo.getgLoca()}"><span
				id="locHelpInline" class="form-text"></span>
		</div>
		<div class="mb-3">
			<label for="dateSelect" class="form-label">날짜 선택 </label><br> <input
				type="text" name="gStrDate" id="from" autocomplete="off" 
				placeholder="${bvo.getgStrDate()}" value="${bvo.getgStrDate()}"> <input type="text"
				name="gEndDate" id="to" autocomplete="off"
				placeholder="${bvo.getgEndDate()}" value="${bvo.getgEndDate()}">
		</div>
		<div class="mb-3">
        	 <label for="gPriceLB" class="form-label">가격</label> <input
            type="number" class="form-control" name="gPrice" value="${bvo.getgPrice()}">
      	</div>
      	<div class="mb-3">
         	<label for="gTextLB" class="form-label">내용</label>
         	<textarea class="form-control" name="gText" >${bvo.getgText()}</textarea>
      	</div>
		
		<div class="mb-3">
         	<label for="goodsFile" class="form-label">사진올리기</label>
         	<br>
			<%
				ArrayList list = (ArrayList) request.getAttribute("attachList");
				for (int i = 0; i < list.size(); i++) {
					out.print("<button id='imgBtn" + i + "' type='button'>");
					out.print("<img src='download1?filename=" + list.get(i)+ "' style='width:150px; height:100px;' onclick=delImg" + i + "('" + list.get(i) + "')>");
					out.print("</button>");
					out.print("<br>");
				}
			%>
			<span id="img0"></span>
			<span id="img1"></span>
			<span id="delImg0"></span>
			<span id="delImg1"></span>
			<input type='hidden' class='form-control' name='file' accept='image/gif, image/jpeg, image/png'>
			<%
				for (int i = 0; i + list.size() < 2; i++) {
					out.print("<input type='file' class='form-control' name='file' accept='image/gif, image/jpeg, image/png'>");
				}
			%>
      	</div>
      <input type="submit" class="btn btn-primary">
   </form>
   </div>
   <%@ include file="../bbs/footer.jsp"%>
</body>
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function sample5_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.address; // 최종 주소 변수
            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("sample5_address").value = addr;
        }
    }).open();
}
     
$(function() {     
    var dateFormat = "yy/mm/dd",
      from = $( "#from" )
        .datepicker({
          showMonthAfterYear: true, //연도,달 순서로 지정
          changeMonth: true,//달 변경 지정
          dateFormat: dateFormat,//날짜 포맷
          dayNamesMin: ["일", "월", "화", "수", "목", "금", "토" ],//요일 이름 지정
          monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],//월 이름 지정
          minDate:0 //오늘 이전 날짜를 선택할 수 없음
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
        minDate:'+1D' //내일부터 선택가능, 지정형식 예(+1D +1M +1Y)
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
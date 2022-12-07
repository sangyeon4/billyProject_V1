<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
   <%@ include file="../bbs/header.jsp"%>
   <%@ include file="../bbs/nav.jsp"%>
   <%@ include file="../bbs/notice.jsp"%>


   <form name="frm" method="POST" action="billeyAction"
      encType="multipart/form-data">
      <div class="mb-3">
         <label for="cateNumLB" class="form-label">카테고리</label> <select
            name="cateNum" class="form-control">
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
         <!-- 아이디정보 -->
         <input type="hidden" name="id" value="${login}"> <input
            type="hidden" name="gNum" value="${billyGnum}">
      </div>
      <div class="mb-3">
         <label for="gNameLB" class="form-label">상품이름</label> <input
            type="text" class="form-control" name="gName">
      </div>
      <div class="mb-3">
         <label for="gLocaLB" class="form-label">지역 선택 </label>
         <div class="search_boxes">
            <span class="search_box"> <select name="sido1" id="sido1"></select>
               <select name="gugun1" id="gugun1"></select>
            </span>
         </div>
      </div>
      <div class="mb-3">
         <label for="dateSelect" class="form-label">날짜 선택 </label><br> <input
            type="text" name="gStrDate" id="from" autocomplete="off"
            placeholder="시작일"> <input type="text" name="gEndDate"
            id="to" autocomplete="off" placeholder="종료일">
      </div>
      <div class="mb-3">
         <label for="gPriceLB" class="form-label">가격</label> <input
            type="number" class="form-control" name="gPrice">
      </div>
      <div class="mb-3">
         <label for="gTextLB" class="form-label">내용</label>
         <textarea class="form-control" name="gText"></textarea>
      </div>
      <div class="mb-3">
         <label for="goodsFile" class="form-label">사진올리기</label> <input
            type="file" class="form-control" name="file"> <input
            type="file" class="form-control" name="file">
      </div>


      <input type="submit" class="btn btn-primary">
   </form>
   <%@ include file="../bbs/footer.jsp"%>
</body>
<script type="text/javascript">
$('document').ready(function() {
    var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
     var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
      var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
      var area3 = ["대덕구","동구","서구","유성구","중구"];
      var area4 = ["광산구","남구","동구",     "북구","서구"];
      var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
      var area6 = ["남구","동구","북구","중구","울주군"];
      var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
      var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
      var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
      var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
      var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진시","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
      var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
      var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
      var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
      var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
      var area16 = ["서귀포시","제주시","남제주군","북제주군"];
      
   // 시/도 선택 박스 초기화

      $("select[name^=sido]").each(function() {
       $selsido = $(this);
       $.each(eval(area0), function() {
        $selsido.append("<option value='"+this+"'>"+this+"</option>");
       });
       $selsido.next().append("<option value=''>구/군 선택</option>");
      });
   // 시/도 선택시 구/군 설정

      $("select[name^=sido]").change(function() {
       var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
       var $gugun = $(this).next(); // 선택영역 군구 객체
       $("option",$gugun).remove(); // 구군 초기화

       if(area == "area0")
        $gugun.append("<option value=''>구/군 선택</option>");
       else {
        $.each(eval(area), function() {
         $gugun.append("<option value='"+this+"'>"+this+"</option>");
        });
       }
      });
     });
     
$(function() {     
    var dateFormat = "yy/mm/dd",
      from = $( "#from" )
        .datepicker({
          showMonthAfterYear: true, //연도,달 순서로 지정
          changeMonth: true,//달 변경 지정
          dateFormat:"yy/mm/dd",//날짜 포맷
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
  </script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>How to Disable Specific Dates in Bootstrap Datepicker
	using jQuery?</title>
	  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	
</head>
<body>
	<%@ include file="../bbs/header.jsp"%>
	<%@ include file="../bbs/nav.jsp"%>
	<%@ include file="../bbs/notice.jsp"%>




	<input type="text" class="datepicker" placeholder="Date" name="date">
	<footer>qwpodjqwpdojqwdjwpojqwpdoqwjdpqowjdqpwodjwpoj</footer>



	<script type="text/javascript">
		var datesForDisable = [ "2023-01-10", "2022-12-20", "2022-12-21",
				"2023-01-03" ]

		$('.datepicker').datepicker({
			clearBtn : true,
			format : 'yyyy-mm-dd',
			startDate : '2022-12-05',
			endDate : '2023-01-15',

			multidate : true,
			multidateSeparator : ",",
			todayHighlight : true,
			datesDisabled : datesForDisable,

			language : "ko"

		});
	</script>
		<%@ include file="../bbs/footer.jsp"%>
</body>
</html>
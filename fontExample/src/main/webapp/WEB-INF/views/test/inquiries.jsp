<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$("#inquiries1").click(function() {
			if ($("#hiddenList1").is(":visible")) {
				$("#hiddenList1").slideUp();
			} else {
				$("#hiddenList1").slideDown();
			}
		});
		$("#inquiries2").click(function() {
			if ($("#hiddenList2").is(":visible")) {
				$("#hiddenList2").slideUp();
			} else {
				$("#hiddenList2").slideDown();
			}
		});
		$("#inquiries3").click(function() {
			if ($("#hiddenList3").is(":visible")) {
				$("#hiddenList3").slideUp();
			} else {
				$("#hiddenList3").slideDown();
			}
		});
		$("#inquiries4").click(function() {
			if ($("#hiddenList4").is(":visible")) {
				$("#hiddenList4").slideUp();
			} else {
				$("#hiddenList4").slideDown();
			}
		});
	});
</script>
<style>
#inquiries_page {
	margin-bottom: 100px;
}

#inquiries1 {
	width: 1070px;
	height: 80px;
	background-color: white;
}
#inquiries2 {
	width: 1070px;
	height: 80px;
	background-color: white;
}
#inquiries3 {
	width: 1070px;
	height: 80px;
	background-color: white;
}
#inquiries4 {
	width: 1070px;
	height: 80px;
	background-color: white;
}
#question_mark {
	float: left;
}

#downarrow {
	float: right;
	margin-top: 5px;
	margin-right: 20px;
}

#questionName1 {
	margin-top: 8px;
	margin-left: 6px;
	float: left;
	font-size: 18px;
}

#questionName2 {
	margin-top: 8px;
	margin-left: 6px;
	float: left;
	font-size: 18px;
}
#questionName3 {
	margin-top: 8px;
	margin-left: 6px;
	float: left;
	font-size: 18px;
}
#questionName4 {
	margin-top: 8px;
	margin-left: 6px;
	float: left;
	font-size: 18px;
}
</style>
</head>

<body>
	<div id="inquiries_page">
		<button id="inquiries1">
			<div>
				<label id="questionName1">리뷰는 못바꿔요 </label> 
				<img id="downarrow" src="resources/downarrow.png">
			</div>
		</button>
		<ul id="hiddenList1" class="example01" style="display: none;">
			<li>내용</li>
		</ul>
		<button id="inquiries2">
			<div>
				<label id="questionName2">거래는 직거래만 하세요 </label> 
				<img id="downarrow" src="resources/downarrow.png">
			</div>
		</button>
		<ul id="hiddenList2" class="example01" style="display: none;">
			<li>내용</li>
		</ul>
		<button id="inquiries3">
			<div>
				<label id="questionName3">리뷰는 못바꿔요 </label> 
				<img id="downarrow" src="resources/downarrow.png">
			</div>
		</button>
		<ul id="hiddenList3" class="example01" style="display: none;">
			<li>내용</li>
		</ul>
		<button id="inquiries4">
			<div>
				<label id="questionName4">리뷰는 못바꿔요 </label> 
				<img id="downarrow" src="resources/downarrow.png">
			</div>
		</button>
		<ul id="hiddenList4" class="example01" style="display: none;">
			<li>내용</li>
		</ul>
	</div>
</body>
</html>
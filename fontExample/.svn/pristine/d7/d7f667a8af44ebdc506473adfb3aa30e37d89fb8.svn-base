<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title> 제품 문의 페이지 </title>
<style>
#a {
	float: right;
	width: 80%;
	height: 100%
}

#b {
	font-family: THE행복열매;
	font-weight: bolder;
	text-align: left;
	font-size: 40px;
}

#c {
	border: 1px solid black;
	text-align: left;
	width: 100%;
	margin: 5px;
}

.li_a {
	color: black;
	font-weight: bold;
	font-size: 15px;
	margin: 5px;
	text-align: left;
}


.table th, #list {
	text-align: center;
	font-weight: bold;
}
#check_delete {
	font-family: THE행복열매;
	font-weight: bolder;
	border: 1px solid #D1B2FF;
	border-radius: 5px;
	background-color: #D1B2FF;
	font-size: 30px;
	padding: 5px;
	margin: 10px;
	float: right;
} 
</style>
<script>
	function printList(result) {
		var $body = $("#list");
		$.each(result, function(idx, mr) {
			var $tr = $("<tr>").appendTo($body);
			$("<td>").text(mr.no).appendTo($tr);
			$("<td>").text(mr.username).appendTo($tr);
			$("<td>").text(mr.type_no).appendTo($tr);
			$("<td>").text(mr.title).appendTo($tr);
			$("<td>").text(mr.content).appendTo($tr);
			$("<td>").text(mr.answer).appendTo($tr);
		});
	}
	$(function() {
		$.ajax({
			url : "/fontExample/api/product_inquiry",
			method : "get",
			success : function(result, status, xhr) {
				printList(result);
				console.log(result);
			},
			error : function(xhr) {
				console.log(xhr.status);
			}
		});
	});
</script>
</head>
<body>
	<div>
		<div>
			<jsp:include page="/WEB-INF/views/management/managementpage.jsp" />
		</div>
		<div id="a">
			<div id="b"> 제품 문의 페이지 </div>
			<div id="c"></div>
			<table class="table table-hover">
				<colgroup>
					<col width="10%">
					<col width="15%">
					<col width="30%">
					<col width="30%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>제품 번호</th>
						<th>작성자</th>
						<th>문의 내용</th>
						<th>답변 내용</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody id="list">
				</tbody>
			</table>

			<button id="check_delete" type="button">삭제</button>
		</div>
	</div>
</body>
</html>

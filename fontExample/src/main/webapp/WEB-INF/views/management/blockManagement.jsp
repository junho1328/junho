<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>신고 누적 게시판</title>
<script type="text/javascript">
$(function(){
	function printList(result){
		var $body = $("#list");
		$.each(result, function(index,mr){
			var $tr = $("<tr>").appendTo($body); 
			var $td = $("<td>").appendTo($tr);
		})
	}
});
</script>
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

.button {
	width: 90px;
	height: 30px;
	border-radius: 5px;
	background-color: #ffb6c1;
	color: white;
	border: none;
}

table td, th {
	text-align: center;
}
</style>

</head>
<body>
	<div>
		<div>
			<jsp:include page="/WEB-INF/views/management/managementpage.jsp" />
		</div>
		<div id="a">
			<div id="b">신고 누적 게시판</div>
			<div id="c"></div>
			<table class="table table">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="25%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<td>이름</td>
						<td>신고횟수</td>
						<td>신고 이유</td>
						<td>정지</td>
						<td>정지풀기</td>
					</tr>
					<tr>
						<td>박준호</td>
						<td>300건</td>
						<td>1번이유</td>
						<td><button id="block" class="button">정지</button></td>
						<td><button id="unblock" class="button">정지풀기</button></td>
					</tr>
					<tr>
						<td>박준호</td>
						<td>300건</td>
						<td>1번이유</td>
						<td><button id="block" class="button">정지</button></td>
						<td><button id="unblock" class="button">정지풀기</button></td>
					</tr>
					<tr>
						<td>박준호</td>
						<td>300건</td>
						<td>2번이유</td>
						<td><button id="block" class="button">정지</button></td>
						<td><button id="unblock" class="button">정지풀기</button></td>
					</tr>
					<tr>
						<td>박준호</td>
						<td>300건</td>
						<td>2번이유</td>
						<td><button id="block" class="button">정지</button></td>
						<td><button id="unblock" class="button">정지풀기</button></td>
					</tr>
					<tr>
						<td>박준호</td>
						<td>300건</td>
						<td>3번이유</td>
						<td><button id="block" class="button">정지</button></td>
						<td><button id="unblock" class="button">정지풀기</button></td>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</body>
</html>
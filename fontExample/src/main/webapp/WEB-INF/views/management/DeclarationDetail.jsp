<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0 auto;
	padding: 0;
}

#main {
	text-align: center;
	width: 700px;
	height: 700px;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	border: 1px solid black;
}

.DeclarationTitle {
	background: #f6f6f6;
	width: 120px;
	height: 100px;
}
.DeclarationReason {
	width: 500px;
}
</style>
<script>
$(function() {
	$(function() {
		var no = location.search.substr(4); // substr () 숫자 항상 잘 테스트
		$.ajax({
			url:'/fontExample/api/declaration/detailView?no=' + no,
			method:'get',
			success:function(mr) {
				$("#no").text(mr.no);
				$("#reporter").text(mr.username);
				$("#declaration_username").text(mr.declaration_username);
				if(mr.reason_no==1){
					$("#reason_no").text("광고(상점홍보,낚시글,도배글)");
				}else if(mr.reason_no==2){
					$("#reason_no").text("물품정보 부정확");
				}else if(mr.reason_no==3){
					$("#reason_no").text("거래 금지 품목");
				}else if(mr.reason_no==4){
					$("#reason_no").text("언어폭력");
				}else if(mr.reason_no==5){
					$("#reason_no").text("기타사유");
				}
				$("#content").text(mr.content);
			}
		})
	})
})
</script>
</head>

<body>

	<div id="DeclarationDetailMain">
		<h3>신고내용</h3>
		<Br>
		<br>
		<table>
			<tr>
				<td class="DeclarationTitle">신고 번호</td>
				<Td class="DeclarationReason" id="no"></Td>
			</tr>
			<tr>
				<td class="DeclarationTitle">신고자</td>
				<td class="DeclarationReason" id="reporter"></td>
			</tr>
			<tr>
				<Td class="DeclarationTitle">신고 받은 사람</Td>
				<Td class="DeclarationReason" id="declaration_username"></Td>
			</tr>
			<tr>
				<td class="DeclarationTitle">신고 사유번호</td>
				<td class="DeclarationReason" id="reason_no"></td>
			</tr>
			<Tr>
				<td class="DeclarationTitle">신고 내용</td>
				<td class="DeclarationReason" id="content"></td>
			</Tr>

		</table>
	</div>
</body>
</html>
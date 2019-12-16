<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회원탈퇴</title>
<script>
$(document).ready(function(){
	$("#Withdrawal_button").click(function(){
		var params ={
				username : location.search.substr(1),
				reason : $("#Withdrawal_menu").text(),
				reason_detail : $("#Withdrawal_reason").val(),
				_method : "delete"
		}
		$.ajax({
			url: "/fontExample/api/withdrawals",
			method: 'post',
			data: params,
			success:function(result) {
				alert("회원탈퇴가 완료되었습니다");
				location.href = "/fontExample/";
			},error:function(xhr) {
				alert("오류 발생");
			}
		})
	})
})
</script>
<style>
* {
	margin: 0 auto;
	padding: 0;
}

#Withdrawal_menu {
	width: 635px;
	height: 45px;
}

#Withdrawal_reason {
	width: 635px;
	height: 80px;
}

#Withdrawal_button {
	background-color: #3498DB;
	width: 635px;
	color: white;
	height: 45px;
}

#Withdrawal_div {
	text-align: center;
	height:100%;
	width: 80%;
    margin-left: 240px;
	
	
}
#ea {
	border: 1px solid black;
	text-align: right;
	width: 100%;
	margin: 5px;
}

#cph {
	font-weight: bolder;
	text-align: left;
	font-size: 40px;
}
</style>
</head>
<body>
<div>
	<div>
			<jsp:include page="myPageMenu.jsp" />
	</div>
	
	<div id="Withdrawal_div">
		<div id="cph">회원 탈퇴</div>
			<div id="ea"></div>
		<br> <br>
		<h3>
			서비스에 만족을 드리지 못해 대단히 죄송합니다.<br>보다 좋은 서비스로 다음에 다시 뵐수 있더록 최선을
			다하겠습니다.
		</h3>

	<br>

		<table>
			<tr>
				<td><select id="Withdrawal_menu">
						<option name="Withdrawal_bokjab" value="Withdrawal_bokjab">복잡,불편</option>
						<option name="Withdrawal_saseng" value="Withdrawal_saseng">사생활
							침해</option>
						<option name="Withdrawal_saki" value="Withdrawal_saki">사기를
							당함</option>
						<option name="Withdrawal_bunjeng" value="Withdrawal_bunjeng">분쟁이
							발생함</option>
						<option name="Withdrawal_bujin" value="Withdrawal_bujin">판매가
							부진</option>
						<option name="Withdrawal_gyohwan" value="Withdrawal_gyohwan">교환
							신청이 많음</option>
						<option name="Withdrawal_find" value="Withdrawal_find">찾는
							물품이 없음</option>
						<option name="Withdrawal_gita" value="gita">기타</option>
				</select></td>

			</tr>
			<tr>
				<td><Br>
				<input id="Withdrawal_reason" type="text" name="Withdrawal_"
					placeholder="탈퇴사유를 적어주세요."></td>
			</tr>
			<tr>
				<td><Br>
					<button id="Withdrawal_button">탈퇴</button></td>
			</tr>
		</table>

	<br>
	<br>
	<br>
	<br>
	</div>
	</div>
</body>
</html>
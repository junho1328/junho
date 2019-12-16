<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style>
* {
	margin: 0 auto;
	padding: 0;
}

#exchangeDiv {
	float: right;
	width: 80%;
	height: 100%
}

#e {
	font-family: THE행복열매;
	font-weight: bolder;
	text-align: left;
	font-size: 40px;
}

#ea {
	border: 1px solid black;
	text-align: right;
	width: 100%;
	margin: 5px;
}

a {
	color: black;
}

td {
	padding: 5px;
}

#expage {
	font-size: 20px;
}

#warning {
	width: 100%;
	height: 100%;
	padding: 10px;
	overflow: hidden;
}

#exchangebutton {
	width: 120px;
	height: 30px;
	border-radius: 4px;
	background-color: #ffb6c1;
	font-weight: bold;
	color: white;
	border: none;
	display: inline-block;
	margin-top : 8px;
	margin-bottom : 8px;
}
#exchange {
	width : 100%;
}
#exchangeTitle {
	text-align: left;
	font-size : 25px;
}
.cautionDetail {
	text-align: left;
	font-size : 16px;
}
.exchangepageTd {
	border-right : 1px solid #DDDDDD;
	background-color : #FFFAFA;
	text-align: left;
	width : 150px;
}
table,
tr,
td {
	border-top : 1px solid #DDDDDD;
	border-bottom : 1px solid #DDDDDD;
}
.exchangepageDiv {
	display: inline-block;
	padding-left : 20px;
	font-size : 13px;
	padding-top : 8px;
	padding-bottom : 8px;
}
#exchangeBtn {
	text-align: center;
}
#name,
#bank,
#account,
#amount {
	width: 300px;
	height: 25px;
	padding : 0;
	font-size : 13px;
	margin-left : 73px;
	margin-top : 8px;
	margin-bottom : 8px;
}
#titleExchangeForm {
	margin-top : 10px;
	margin-bottom : 10px;
	margin-left : 5px;
	text-align: left;
	font-size : 20px;
	font-weight: bold;
}
</style>
<script>
/*
$(function({
function exchange (){
		var exChangeData = new ExchangeData("exchangeForm");
		console.log("exchangejsp" + exChangeData);
		}
			$ajax({
				url: "/fontExample/api/exchange",
				method: "post",
				date: exChangeData,
				success: function(){
					location.href = response.getResponseHeader('location');
				}
			})
	})
*/

$(function(){
	$("#name").on("blur", checkName);
	$("#account").on("blur",checkbanknumber);
	$("#amount").on("blur",checkamount);
	$("#exchangebutton").on("click",function(){
		var param = {
				name : $("#name").val(),
				amount : $("#amount").val(),
				bank : $("#bank").val(),
				account : $("#account").val()
		}
		$.ajax({
			url:"/fontExample/api/exchange",
			method: "post",
			data:param,
 			success:function(){
 				alert("성공");
 			}
		})
	})
})
function checkName() {
		var patt = /^[가-힣]{2,10}$/
		var name = $("#name").val();
		if (name.length == 0) {
			$("#name_msg").text("필수입력입니다").css("color", "red");
			return false;
		}
		if (patt.test(name) == false) {
			$("#name_msg").text("이름은 한글 2~10자입니다").css("color", "red");
			return false;
		}
		$("#name_msg").text("");
		return true;
	}
	function checkbanknumber(){
		var patt = /^[0-9]{6,15}$/
		var account = $("#account").val();
		if(account.length==0){
			$("#account_msg").text("필수 입력입니다").css("color","red");
			return false;
		}
		if(patt.test(account)==false){
			$("#account_msg").text("숫자는 6~15자 입니다.").css("color","red");
			return false;
		}
		$("#account_msg").text("");
		return true;
	}
	function checkamount(){
		var patt = /^[0-9]{1,15}$/
		var amount = $("#amount").val();
		if(amount.length==0){
			$("#amount_msg").text("필수 입력입니다").css("color","red");
			return false;
		}
		if(patt.test(amount)==false){
			$("#amount_msg").text("숫자는 1~15자 입니다.").css("color","red");
			return false;
		}
		$("#amount_msg").text("");
		return true;
	}

</script>
</head>
<body>
	<div>
		<div>
			<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" />
		</div>

		<div id="exchangeDiv">
			<div id="e">환전신청</div>
			<div id="ea"></div>
			<div id="warning">
				<h1 id="exchangeTitle">※ 환전 시 유의사항</h1>
				<div class="cautionDetail">1. 환전신청시 이름과 계좌번호와 금액을 다시한번 확인해주세요.</div>
				<div class="cautionDetail">2. 환전신청 후 통장입금은 매주 목요일에 이루어집니다.</div>
				<div class="cautionDetail">3. 목요일의 환전은 다음주 목요일 이루어집니다.</div>
				<div class="cautionDetail">4. 이외 문의사항은 사이트 문의에 남겨주세요.</div>
				<div id="titleExchangeForm">- 판매자 환전정보 입력 -</div>
				<form id="exchangeForm" method="post">
				<table id="exchange">
					<tr>
						<td class="exchangepageTd">
							<div class="exchangepageDiv">이름</div>
						</td>
						<td>
							<input type="text" id="name" name="name" placeholder="이름을 입력해주세요.">
							<span id="name_msg"></span>
						</td>
					</tr>
					<tr>
						<td class="exchangepageTd">
							<div class="exchangepageDiv">환전은행</div>
						</td>
						<td>
							<select id="bank">
									<option>신한</option>
									<option>국민</option>
									<option>기업</option>
									<option>농협</option>
									<option>새마을</option>
									<option>신협</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="exchangepageTd">
							<div class="exchangepageDiv">환전계좌</div>
						</td>
						<td>
							<input type="text" id="account" name="account" placeholder="계좌번호를 입력해주세요.">
							<span id="account_msg"></span>
						</td>
					</tr>
					<tr>
						<td class="exchangepageTd">
							<div class="exchangepageDiv">환전금액</div>
						</td>
						<td>
							<input type="text" id="amount" name="amount" placeholder="환전할 금액을 입력해주세요.">
							<span id="amount_msg"></span>
						</td>
					</tr>
					<tr>
						<td id="exchangeBtn" colspan="2">
							<button id="exchangebutton" type="button">환전하기</button>
						</td>
					</tr>
				</table>
				</form>	
			</div>
		</div>
	</div>
</body>
</html>
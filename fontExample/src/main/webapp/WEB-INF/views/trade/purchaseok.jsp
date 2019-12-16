<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<script>
var productno = location.search.substring(4);
$(document).ready(function(){
	var param = {
		no : productno
	}
	$.ajax({
		url: "/fontExample/findsellerbyno",
		method: 'get',
		data : param,
		success : function(result) {
			console.log(result);
			findSellerInfo(result);
		}
	})
	$("#buyBtn").on("click", function(){
		location.href="/fontExample/buy_waiting"
	})
})

function findSellerInfo(username){
	var param = {
			username : username
		}
	$.ajax({
		url: "/fontExample/findseller",
		method: 'get',
		data : param,
		success : function(result) {
			console.log(result);
			$("#storeName").text(result.name);
			$("#tel").text(result.tel);
			$("#sns").text(result.sns);
		}
	})
}
</script>
<style>
* {
	margin: 0 auto;
	padding: 0;
}
#paymentMain{
	margin-top: 30px;
	width: 820px;
	height: 1000px;
}
.subtitle{
	box-sizing: border-box;
    position: relative;
    min-height: 30px;
    margin-top: 15px;
    padding: 11px 0 8px;
    color: #2f2f2f;
    font-size: 15px;
    font-weight: 700;
    text-align: left;
}
#paymentTable{
	table-layout: fixed;
    width: 100%;
    border-spacing: 0;
    border-collapse: collapse;
    border-top: 2px solid #e1e1e1;
    color: #1d1d1d;
}

#paymentTable tr td{
	box-sizing: border-box;
    position: relative;
    padding: 7px 0 7px 10px;
    border-bottom: 1px solid #e1e1e1;
    text-align: left;
}

#paymentTable tr th{
	box-sizing: border-box;
    padding: 7px 0;
    height: 40px;
    border-bottom: 1px solid #e1e1e1;
    background-color: #f0f0f0;
    text-align: center;
}
#paymentTitle{
	position: relative;
    padding-bottom: 3px;
    margin-bottom: 20px;
    font-size: 20px;
    font-weight: 700;
    letter-spacing: -2px;
}
.btnGroup{
    margin: 45px 0;
    text-align: center;
}
.paymentButton{
	width: 137px;
    height: 46px;
}
#buyBtn{
	margin-right: 15px;
}
#paymentQuantity{
	width: 210px;
}
</style>
<body>

	<div id="paymentMain">
		<div id="paymentTitle">
			구매 완료<br>
		</div>
		다음과 같은 방법으로 판매자와 연락할 수 있습니다.
		<div id="ProductInfo">
			<div class="subtitle">판매자 정보</div>
			<table id="paymentTable">
				<tr>
					<th>스토어 명</th>
					<td colspan="3"><span id="storeName"></span></td>
				</tr>
				<tr>	
					<th>연락처</th>
					<td colspan="3"><span id="tel"></span></td>
				</tr>
				<tr>	
					<th>SNS</th>
					<td colspan="3"><span id="sns"></span></td>
				</tr>
			</table>
		</div>
		<div class="btnGroup">
			<button class="paymentButton" id="buyBtn">구매대기로</button>
		</div>
	</div>
</body>
</html>
<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> -->

<!DOCTYPE html>
<html>
<head>
<title>거래내역</title>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	text-align: left;
}

#transactionPage h2 {
	margin-top: 10px;
	margin-bottom: 50px;
	border-bottom: 2px solid gray;
	padding-bottom: 20px;
	font-weight: bold;
}

#categoryBtnMenu {
	width: 100%;
	height: 50px;
	margin-bottom: 50px;
}

#categoryBtnMenu ul li {
	width: 49%;
	float: left;
	list-style: none;
	margin: 1px;
}

#categoryBtnMenu ul li a {
	font-weight: bold;
	display: block;
	width: 100%;
	height: 40px;
	background: rgb(240, 240, 240);
	color: black;
	font-size: 12px;
	font-family: "돋움";
	text-align: center;
	padding-top: 10px;
	text-decoration: none;
}

#buyInformation {
	width: 900px;
	height: 339px;
	border: 1px solid black;
	margin: auto;
}

#buyDate {
	width: 898px;
	height: 60px;
	background-color: rgb(240, 240, 240);
}

#buyDate p {
	padding: 20px;
	margin: 0px;
}

#tradeDate {
	font-weight: bold;
}

#orderImage {
	float: left;
	padding: 64px;
	padding-right: 32px;
}

#buyOrderInfomation {
	width: 650px;
	float: left;
}

#orderText {
	padding: 64px;
}

#orderTotalStatus {
	width: 198px;
	height: 278px;
	padding: 30px;
	float: left;
	border: 1px solid black;
	text-align: center;
}

#orderTotalStatus button {
	width: 100%;
}

#buyOrderCheckbox {
	float: left;
	height: 278px;
	line-height: 278px;
	position: relative;
	padding: 18.5px;
}

#buyOrderCheckbox input {
	position: relative;
	margin-top: 0px;
	top: 45%;
}

#orderStatusMessage {
	text-align: center;
	height: 92.6px;
}

#orderButton {
	height: 154px;
}

#orderButton button {
	margin-bottom: 20px;
	width: 100%;
}

#orderStatus {
	padding-top: 10px;
	padding-bottom: 70px;
}

#orderStatus p {
	text-align: center;
}

.orderBtn {
	margin-top: 0px;
}

.orderBtn button {
	margin-bottom: 20px;
}

#orderTextTitle {
	font-weight: bold;
}

#buyList_item {
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<div id="transactionPage">
		<h2>거래내역</h2>
		<div id="categoryBtnMenu">
			<ul>
				<li><a href="#"><span>구매내역</span></a></li>
				<li><a href="#"><span>판매내역</span></a></li>
			</ul>
		</div>

		<div id="buyList_item">
			<div id="buyInformation">
				<div id="buyDate">
					<p>
						거래날짜 : <span id="tradeDate">XXXX/XX/XX</span>
					</p>
				</div>
				<div id="buyOrderCheckbox">
					<input type="checkbox" class="checkbox">
				</div>
				<div id="buyOrderInfomation">
					<div id="orderImage">
						<img src="capture.jpg" width="150px" alt="gabungi">
					</div>
					<div id="orderText">
						<p id="orderTextTitle">가렌이 3초 동안 검을 들고 빠르게 회전하여 지속 시간 동안 근처
							적에게 물리 피해를 입힙니다. 가장 가까운 적에게는 피해량이 25% 증가합니다. (공격 횟수는 아이템과 레벨의 공격
							속도에 비례합니다.)</p>
						<p>
							<span id="orderPrice">100000000원</span><span> / </span><span>판매자
								: </span><span id="sellerName">가붕이</span>
						</p>
					</div>
				</div>
				<div id="orderTotalStatus">
					<div id="orderStatus">
						<p>눈도 깜짝 안합니다</p>
					</div>
					<div class="orderBtn">
						<button class="btn btn-primary">판매자와 연락</button>
						<button class="btn btn-default">리뷰 쓰기</button>
					</div>
				</div>
			</div>
		</div>

		<div id="buylist_item">
			<div id="buyInformation">
				<div id="buyDate">
					<p>
						거래날짜 : <span id="tradeDate">XXXX/XX/XX</span>
					</p>
				</div>
				<div id="buyOrderCheckbox">
					<input type="checkbox" class="checkbox">
				</div>
				<div id="buyOrderInfomation">
					<div id="orderImage">
						<img src="capture.jpg" width="150px" alt="gabungi">
					</div>
					<div id="orderText">
						<p id="orderTextTitle">가렌이 3초 동안 검을 들고 빠르게 회전하여 지속 시간 동안 근처
							적에게 물리 피해를 입힙니다. 가장 가까운 적에게는 피해량이 25% 증가합니다. (공격 횟수는 아이템과 레벨의 공격
							속도에 비례합니다.)</p>
						<p>
							<span id="orderPrice">100000000원</span><span> / </span><span>구매자
								: </span><span id="sellerName">가붕이</span>
						</p>
					</div>
				</div>
				<div id="orderTotalStatus">
					<div id="orderStatus">
						<p>눈도 깜짝 안합니다</p>
					</div>
					<div class="orderBtn">
						<button class="btn btn-primary">구매자와 연락</button>
						<button class="btn btn-default">리뷰 쓰기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
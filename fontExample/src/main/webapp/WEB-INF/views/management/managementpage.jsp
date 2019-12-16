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
<title> 관리자 페이지 </title>
<style>
.li_a {
	font-weight: bold;
	font-size: 15px;
	margin: 5px;
	text-align: left;
}
.li_a a {
	color: black;
}
#manager {
	float: left;
	height: 200px;
	width: 20%;
}
#managerpage {
	font-family: THE행복열매;
	font-weight: bolder;
	text-align: left;
	font-size: 30px;
}
#line {
	border: 1px solid black;
	text-align: left;
	width: 70%;
	margin: 5px;
}
</style>
</head>
<body>
	<div id="manager">
			<div id="managerpage"> 관리자 페이지 </div>
			<div id="line"></div>
			<ul>
				<li class="li_a"><a href="/fontExample/payment">★ 결제 내역</a></li>
				<li class="li_a"><a href="/fontExample/exchangemanager">★ 환전 신청 내역</a></li>
				<li class="li_a"><a href="/fontExample/inquiry">★ 사이트 문의 내역 </a></li>
				<!-- <li class="li_a"><a href="/fontExample/product_inquiry">★ 제품 문의 내역</a></li> -->
				<li class="li_a"><a href="/fontExample/sellManagement2">★ 판매글 관리 페이지</a></li>
				<li class="li_a"><a href="/fontExample/declarationList">★ 신고 접수 내역</a></li>
				<li class="li_a"><a href="/fontExample/blockManagement">★ 신고 누적 게시판 </a></li>
				<li class="li_a"><a href="/fontExample/membermanagement">★ 회원 관리 페이지 </a></li>
				<li class="li_a"><a href="/fontExample/sales">★ 매출 현황</a></li>
			</ul>
		</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$("#withdrawalMy").click(function() {
					var url = "certification?withdrawal";
					var name = "본인인증";
					var option = "width = 620, height = 600, top = 100, left = 200, location = no";
					window.open(url, name, option);
				});
	})
</script>
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

#b {
	float: left;
	height: 200px;
	width: 20%;
}


#information_menu {
	font-family: THE행복열매;
	font-weight: bolder;
	text-align: left;
	font-size: 40px;
}

#da {
	border: 1px solid black;
	text-align: left;
	width: 70%;
	margin: 5px;
}
</style>
</head>
<body>
	<div id="b">
			<div id="information_menu">내 정보</div>
			<div id="da"></div>
			<ul>
				<li class="li_a"><a href="/fontExample/myInfomation">★ 내 정보
						변경</a></li>
				<li class="li_a"><a href="/fontExample/salesRights">★ 판매권한 등록</a></li>		
				<li class="li_a"><a href="/fontExample/changePwd">★ 비밀번호 변경</a></li>
				<li class="li_a"><a href="/fontExample/exchangepage">★ 환전신청</a></li>
				<li class="li_a"><a href="/fontExample/uploadProduct">★ 판매등록</a></li>
				<li class="li_a"><a href="/fontExample/favorites">★ 즐겨찾기</a></li>
				<li class="li_a"><a href="/fontExample/payment">★ 결제내역</a></li>
				<li class="li_a"><a href="/fontExample/buy_waiting">★ 구매대기</a></li>
				<li class="li_a"><a href="/fontExample/sell_waiting">★ 판매대기</a></li>
				<li class="li_a"><a href="/fontExample/buy_history">★ 구매/판매 내역</a></li>
				<li class="li_a"><a href="/fontExample/myReview">★ 내가 쓴 리뷰</a></li>
				<li class="li_a"><a href="/fontExample/service_center_menu">★ 고객센터</a></li>
				<li class="li_a"><a href="/fontExample/myinquiry">★ 나의 문의 내역</a></li>
				<li class="li_a"><a href="#" id="withdrawalMy">★ 회원탈퇴</a></li>
				</ul>
		</div>
</body>
</html>
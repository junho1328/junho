<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$("#logout").on("click", function(e) {
		e.preventDefault();
		$.ajax({
			url:"/fontExample/logout",
			method:"post",
			success:function() {
				location.href = "/fontExample/"
			}
		})
	});
});
</script>

<style>
* {
	margin: 0;
	padding: 0;
}

li {
	list-style: none;
	color: black;
}

a {
	text-decoration: none;
}

.header_wrapper {
	float: right;
	maring: 0 auto;
	display: block;
}

.clearfix {
	content: '';
	display: block;
	clear: both;
}

.header {
	height: 40px;
	z-index: 9999;
	top: 0;
	left: 0;
}

.menu {
	float: right;
}

.menu li {
	float: left;
}
.menu li a {
	text-decoration: none;
}

.menu a {
	line-height: 30px;
	color: black;
	font-size: 15px;
	padding: 0 15px;
}
</style>
</head>
<body>
	<div class="header">
		<div class="header_wrapper">
			<ul class="menu">
				<sec:authorize access="isAnonymous()">
					<li><a href="/fontExample/join">회원가입</a></li>
					<li><a href="/fontExample/login?login">로그인</a></li>
					<li><a href="/fontExample/notice">공지사항</a></li>
					<li><a href="/fontExample/service_center_menu">고객센터</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<li><a href='#' id="logout">로그아웃</a></li>
					<li><a href='/fontExample/myInfomation'>내 정보</a></li>
					<li><a href="/fontExample/notice">공지사항</a></li>
					<li><a href="/fontExample/service_center_menu">고객센터</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href='#' id="logout">로그아웃</a></li>
					<li><a href='/fontExample/sales'>관리</a></li>
					<li><a href="/fontExample/notice">공지사항</a></li>
					<li><a href="/fontExample/inquiry">사이트 문의</a></li>
				</sec:authorize>
			</ul>
		</div>
	</div>
</body>
</html>
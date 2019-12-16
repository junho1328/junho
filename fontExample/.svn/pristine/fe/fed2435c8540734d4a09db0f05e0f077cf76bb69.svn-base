<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script>
	function checkPassword() {
		var patt = /(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{6,10}$/;
		var password = $("#newPassword").val();
		if (password.length == 0) {
			$("#new_password_msg").text("필수입력입니다").css("color", "red");
			return false;
		}
		if (patt.test(password) == false) {
			$("#new_password_msg").text("비밀번호는 특수문자 포함 6~20자 입니다.").css(
					'color', 'red');
			return false;
		}
		$("#new_password_msg").text("사용 가능한 비밀번호 입니다.").css('color', 'green');
		return true;
	}
	function checkPassword2() {
		var passwordcheck = $("#newPasswordcheck").val();
		var password = $("#newPassword").val();
		if (passwordcheck.length == 0) {
			$("#new_paasswordcheck_msg").text("필수입력입니다").css("color", "red");
			return false;
		}
		if (passwordcheck != password) {
			$("#new_passwordcheck_msg").text("비밀번호가 일치하지 않습니다.").css('color',
					'red');
			return false;
		}
		$("#new_passwordcheck_msg").text("비밀번호가 일치합니다.").css('color', 'green');
		return true;
	}

	$(function() {
		$("#alert").hide();
		$("#newPassword").on("blur", checkPassword);
		$("#newPasswordcheck").on("blur", checkPassword2);
		$("#okbtn").on("click", function() {
			$("#pwdchange").submit();
			alert("비밀번호가 변경되었습니다.")
			location.href="/fontExample"
		});

	})
</script>
<style>
* {
	margin: 0 auto;
	padding: 0;
}
#changePwdMain {
	float: right;
	width: 80%;
	height: 100%
}

#cph {
	font-weight: bolder;
	text-align: left;
	font-size: 40px;
}
.cptextAll {
	width: 300px;
	height: 25px;
	padding : 0;
	font-size : 13px;
	margin-left : 73px;
	margin-top : 8px;
	margin-bottom : 8px;
}
.cpbtn {
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
#ea {
	border: 1px solid black;
	text-align: right;
	width: 100%;
}
#changePwdTable {
	width : 100%;
}
table,
tr,
td {
	border-top : 1px solid #DDDDDD;
	border-bottom : 1px solid #DDDDDD;
}
.changePwdTd {
	border-right : 1px solid #DDDDDD;
	background-color : #FFFAFA;
	text-align: left;
	width : 150px;
}
.changePwdDiv {
	display: inline-block;
	padding-left : 20px;
	font-size : 13px;
}
#btnTd {
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<div>
			<jsp:include page="myPageMenu.jsp" />
		</div>
		<div id="changePwdMain">
			<div id="cph">비밀번호 변경</div>
			<div id="ea"></div>
			<form method="post" id="pwdchange" action="/fontExample/changePwd">
				<div id="changePwd">
					<table id="changePwdTable">
						<tr>
							<td class="changePwdTd">
								<div class="changePwdDiv">현재비밀번호</div>
							</td>
							<td>
								<input type="password" placeholder="현재 비밀번호를 입력해주세요" name="password" class="cptextAll">
								<input type="hidden" value="비밀번호 일치 확인">
							</td>
						</tr>
						<tr>
							<td class="changePwdTd">
								<div class="changePwdDiv">새 비밀번호</div>
							</td>
							<td>
								<input type="password" placeholder="새로운 비밀번호를 입력해주세요" name="newPassword" class="cptextAll" id="newPassword">
								<span id="new_password_msg"></span>
							</td>
						</tr>
						<tr>
							<td class="changePwdTd">
								<div class="changePwdDiv">새 비밀번호 확인</div>
							</td>
							<td>
								<input type="password" placeholder="새로운 비밀번호 확인" class="cptextAll" id="newPasswordcheck" name="newPasswordcheck">
								<span id="new_passwordcheck_msg"></span>
								<input type="hidden" name="_csrf" value="${_csrf.token}">
							</td>
						</tr>
						<tr>
							<td id="btnTd" colspan="2">
								<button class="cpbtn" id="okbtn" type="button">확 인</button>
								<a href="/fontExample">
									<button class="cpbtn">취소</button>
								</a>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
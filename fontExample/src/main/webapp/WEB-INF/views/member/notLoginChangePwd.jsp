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
		$("#new_password_msg").text("비밀번호는 특수문자 포함 6~20자 입니다.").css('color',
				'red');
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
		$("#new_passwordcheck_msg").text("비밀번호가 일치하지 않습니다.")
				.css('color', 'red');
		return false;
	}
	$("#new_passwordcheck_msg").text("비밀번호가 일치합니다.").css('color', 'green');
	return true;
}

$(function() {
	var username = location.search.substr(16);
	$("#username").val(username);
	$("#alert").hide();
	$("#newPassword").on("blur", checkPassword);
	$("#newPasswordcheck").on("blur", checkPassword2);
	$("#okbtn").on("click", function() {
		$.ajax({
			url: "/fontExample/notloginchangePwd",
			method: 'post',
			data: $("#pwdChange").serialize(),
			success:function(result) {
				location.href = "/fontExample/";
			},error:function(xhr) {
				alert("오류 발생");
			}
		})
		$("#pwdchange").submit();
	});
	
})
</script>
<style>
	*{
		margin:0 auto;
		padding:0;
	}
	#changePwdMain{
		width: 300px;
	}
	#cph{
		padding: 20px;
	}
	.cpli{
		padding: 30px;
		margin: 10px;
	}
	.cpleft{
		text-align: left;
	}
	.cptextAll{
		width: 300px;
		height: 30px;
	}
	.cpbtn{
		margin: 10px;
		border-radius: 5px;
		background-color: rgb(255, 182, 193);
		color: white;
		height: 30px;
		font-weight: bold;
		width: 250px;
		border: none;
	}
</style>
</head>
<body>
	<div id="changePwdMain">
		<div>
			<h3 id="cph">비밀번호 변경</h3>
		</div>
		<div>
			<ul>
			<form method="post" id="pwdChange" action="/fontExample/notloginchangePwd">
				<li class="cpleft" class="cpli">
					<label class="cpleft">새 비밀번호</label><br>
					<input type="password" placeholder="새로운 비밀번호를 입력해주세요" id="newPassword" name="newPassword" class="cptextAll"> <br>
					<span id="new_password_msg"></span></li>
					<input type="hidden" value="비밀번호 적합 확인">
				</li>
				<br>
				<li class="cpleft" class="cpli">
					<label>새 비밀번호 확인</label><br>
					<input type="password" placeholder="새로운 비밀번호 확인" class="cptextAll" id="newPasswordcheck" name="newPasswordcheck"> <br>
					<span id="new_passwordcheck_msg"></span>
					<input type="hidden" name="_csrf" value="${_csrf.token}">
					<input type="hidden" name="username" id="username">
					<input type="hidden" value="비밀번호 일치 확인">
				</li>
				<br>
			</ul>
		</div>
		</form>
		<br>
		<div>
			<a href="#"><button id="okbtn" class="cpbtn">확　　인</button><br></a>
		</div>
		<br>
		<br>
	</div>
</body>
</html>
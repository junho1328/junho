<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<script>
	
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	var random_number = 0;
	$(document)
			.ready(
					function() {
						$("#serviceview").click(function() {
											var url = "serviceview";
											var name = "서비스이용약관";
											var option = "width = 620, height = 600, top = 100, left = 200, location = no";
											window.open(url, name, option);
										});
						$("#privacy").click(function() {
											var url = "privacy";
											var name = "개인정보수집";
											var option = "width = 620, height = 600, top = 100, left = 200, location = no";
											window.open(url, name, option);
										});
						$("#uniqueIdentification").click(function() {
											var url = "uniqueIdentification";
											var name = "고유식별";
											var option = "width = 620, height = 600, top = 100, left = 200, location = no";
											window.open(url, name, option);
										});
						$("#newsAgency").click(function() {
											var url = "newsAgency";
											var name = "통신사이용약관";
											var option = "width = 620, height = 600, top = 100, left = 200, location = no";
											window.open(url, name, option);
										});
						$("#certification_number_button").click(function() {
											var name = $("#name").val();
											var chk_radio = document
													.getElementsByName('agency');
											var radio_result = false;
											for (var i = 0; i < 3; i++) {
												console.log(chk_radio[i].checked == true);
												if (chk_radio[i].checked == true) {
													radio_result = true;
													break;
												}
											}
											var conditions = document
													.getElementsByName('conditions');
											var conditions_result = false;
											for (var i = 0; i < 3; i++) {
												console
														.log(conditions[i].checked == true);
												if (conditions[i].checked == true) {
													conditions_result = true;
												} else {
													conditions_result = false;
												}
											}
											var phone_number = $("#tel").val();
											if (name == "") {
												alert("이름을 입력해주세요");
											} else if (phone_number == "") {
												alert("휴대폰 번호를 입력해주세요");
											} else if (!radio_result) {
												alert("통신사를 선택해주세요");
											} else if (!conditions_result) {
												alert("약관을 동의해주세요");
											} else {
												random_number = Math.floor(Math.random() * 100000) + 1;
												console.log(random_number);
											}
										});
						$("#certification_button").click(function() {
											var certification_number = $("#certification_number").val();
											if (certification_number == random_number) {
												var pageName = location.search.substr(1);
												console.log(pageName);
												if (pageName == "withdrawal") {
													$.ajax({
																url : "/fontExample/api/findId",
																method : 'get',
																data : $(
																		"#findInfo")
																		.serialize(),
																success : function(result) {
																	opener.document.location.href = "/fontExample/withdrawal?"+ result;
																	window.close();
																},
																error : function(
																		xhr) {
																	alert("등록된 사용자가 없습니다.");
																	window
																			.close();
																}
															})
												} else if (pageName == "findPwd") {
													$.ajax({
																url : "/fontExample/api/changePwd",
																method : 'post',
																data : $("#findInfo").serialize(),
																success : function(result) {
																	opener.document.location.href = "/fontExample/notLoginChangePwd?username = " + result;
																	window.close();
																},
																error : function(
																		xhr) {
																	alert("등록된 사용자가 없습니다.");
																	window
																			.close();
																}
															})

												} else if (pageName == "findId") {
													$.ajax({
																url : "/fontExample/api/findId",
																method : 'get',
																data : $(
																		"#findInfo")
																		.serialize(),
																success : function(result) {
																	opener.document.location.href = "/fontExample/findId?" + result;
																	window.close();
																},
																error : function(xhr) {
																	alert("등록된 사용자가 없습니다.");
																	window
																			.close();
																}
															})
												}
											} else {
												alert("인증번호를 확인해주세요");
											}

										});
					});
</script>

<style>
* {
	margin: 0 auto;
	padding: 0;
}

h2 {
	text-align: center;
}

#certification_main {
	text-align: center;
	border: 4px solid #4A97DF;
	width: 600px;
}

ul {
	background: #F8F8F8;
	width: 500px;
	text-align: center;
}

.certification_textAll {
	width: 280px;
	height: 30px;
}

li {
	list-style: none;
}

#foot {
	font-size: 10px;
}

#certification_infotext {
	width: 500px;
}

.certification_left {
	text-align: left;
}

p {
	font-size: 12px;
}

#certification_button, #certification_number_button {
	background-color: #3498DB;
	width: 100px;
	height: 35px;
	color: white;
}
</style>
</head>
<body>
	<div id="certification_main">
		<h2>
			<img src="resources/logo.png" id="logo">
		</h2>

		<div id="certification_infotext">
			<h3 class="certification_left">휴대폰 본인인증</h3>
			<br>
			<p class="certification_left">정확한 본인의 성명, 생년월일, 성별과 휴대폰 정보를 입력해
				주십시오.</p>
			<br>
			<ul>
				<form id="findInfo">
					<li><div style="display: inline-block; width: 105px;">성명</div>
						<input id="name" name="name" type="text"
						class="certification_textAll"><br></li> <br>
					<li><label class="certification_left"
						style="display: inline-block; width: 105px;">
							&nbsp;&nbsp;생년월일</label><input type="date" id="date" name="date"
						class="certification_textAll"><br></li> <br>
					<li>이동 통신사&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="skt"
						name="agency" value="skt">SKT&nbsp; <input type="radio"
						name="agency" id="kt" value="kt">KT&nbsp; <input
						type="radio" name="agency" id="lg" value="lg">LG&nbsp; </select><br>
					</li>
					<li><label>휴대전화 번호&nbsp;&nbsp;&nbsp;&nbsp;</label> <input
						type="text" class="certification_textAll" id="tel" name="tel">
						<br></li> <br>
				</form>
				<li>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="certification_number_button">인증번호 발송</button>
				</li>
				<br>
				<li>
					<div style="display: inline-block; width: 105px;">인증 번호</div> <input
					type="number" class="certification_textAll"
					id="certification_number" name="certification_number"><br>
				</li>

				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="certification_button" type="submit">인증</button>


			</ul>
			<br>
		</div>
		<div id="certification_foot">
			<li><input type="checkbox" name="conditions" value="">서비스
				이용약관동의
				<button type="button" name="" id="serviceview">전문보기</button> <input
				type="checkbox" name="conditions" value="">개인정보이용동의
				<button type="button" name"" id="privacy">전문보기</button></li>
			<li><input type="checkbox" name="conditions" value="">고유식별정보처리동의
				<button type="button" name="" id="uniqueIdentification">전문보기</button>
				<input type="checkbox" name="conditions" value="">통신사이용약관동의
				<button type="button" name="" id="newsAgency">전문보기</button></li>
		</div>
		<br>
	</div>
</body>
</html>
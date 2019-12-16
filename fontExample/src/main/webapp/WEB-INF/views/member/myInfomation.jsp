<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<sec:authorize access="isAuthenticated()">                          <!--  로그인 했을 때 실행  -->
	<sec:authentication property="principal.username" var="user" /> <!-- principal 로그인 되어 있는 정보  -->
</sec:authorize>
<title> 내 정보 변경 </title>
<script>
function certification_find(result){
	//$("#email_Input").val("" + result.email);
	//$("#tel_Input").val("" + result.tel);
	var param = {
			username : '${user}'
	}
	$.ajax({
		url : "/fontExample/api/certification_find",
		method : "get",
		data : param,
		async : false,
		success : function(result) {
			console.log(result);
			if(result.tel_Certification == 1){
				$("#tel_Input").hide();
				$("#tel_span").show();
			}
			if(result.email_Certification == 1){
				$("#email_Input").hide();
				$("#email_span").show();
			}
			
		},
		error : function(xhr) {
			alert("xhr.status")
			alert("xhr.responseText")
			console.log("에러 코드 :" + xhr.status);
			console.log("에러 메시지 :" + xhr.responseText);
		}
	})
}
function print_certification(result){
	console.log($("#tel_span").is(":visible"));
	if($("#tel_Input").is(":visible")){
		$("#tel_Input").val("" + result.tel);
	}else{
		$("#tel_span").text("" + result.tel);
		$("#tel_Certification").hide();
		$("#tel_Certification_finish").show();
	}
	if($("#email_Input").is(":visible")){
		$("#email_Input").val("" + result.email);
	}else{
		$("#email_span").text(result.email);
		$("#email_Certification").hide();
		$("#email_Certification_finish").show();
	}
}
$(document).ready(function() {
			var random_number = 0;
			$("#email_certification_tr").hide();
			$("#tel_span").hide();
			$("#email_span").hide();
			$("#tel_Certification_finish").hide();
			$("#email_Certification_finish").hide();
			var username = '${user}';
			$("#info_username").text(""+username);
			var param = {
					username : username
			}
			$.ajax({
				url : "/fontExample/api/findMemberByUsername",
				method : "get",
				data : param,
				async : false,
				success : function(result) {
					$("#info_name").text(""+result.name);
					certification_find();
					print_certification(result);
				},
				error : function(xhr) {
					alert("xhr.status")
					alert("xhr.responseText")
					console.log("에러 코드 :" + xhr.status);
					console.log("에러 메시지 :" + xhr.responseText);
				}
			})
			
			$("#email_Certification").on("click", function(){
				var email = $("#email_Input").val();
				random_number = Math.floor(Math.random() * 100000) + 1;
				var param = {
						email : email,
						random : random_number
				}
				$.ajax({
					url: "/fontExample/api/email/certification",
					method: 'post',
					data: param,
					success:function(result) {
						alert(result);
						$("#email_certification_tr").show();
						$("#email_Certification").text("인증번호 재전송");
					},error:function(xhr) {
						// 못 찾을 경우 Advice를 거쳐 409 오류 처리
						alert(xhr.responseText);
					}
				})
			})
			$("#email_Certification_Input_Btn").on("click", function(){
				var number = $("#email_certification_Input").val();
				if(number == random_number){
					console.log("같음");
					$.ajax({
						url: "/fontExample/api/email/certification",
						method: 'post',
						data: param,
						success:function(result) {
							alert(result);
							$("#email_certification_tr").show();
							$("#email_Certification").text("인증번호 재전송");
						},error:function(xhr) {
							// 못 찾을 경우 Advice를 거쳐 409 오류 처리
							alert(xhr.responseText);
						}
					})
				}else{
					alert("인증번호를 확인해주세요!");
				}
			})
			$("#withdrawal_button")
					.click(
							function() {
								var url = "certification?withdrwawl";
								var name = "본인인증";
								var option = "width = 620, height = 650, top = 100, left = 200, location = no";
								window.open(url, name, option);
							});
		});
</script>
<style>
/* .table { */
/* 	text-align: center; */
/* } */

td {
/* 	height: auto; */
/* 	display: table-cell; */
/* 	verticala-align: middle; */
}

.button {
	width: 120px;
	height: 30px;
	border-radius: 4px;
	background-color: #ffb6c1;
	font-weight: bold;
	color: white;
	border: none;
	display: inline-block;
}

.input {
	display: inline-block;
	float: left;
	margin-left : 150px;
	margin-bottom : 0;
	width: 300px;
	height: 25px;
	padding : 0;
	font-size : 13px;
	margin-top : 2.5px;
}

* {
	margin: 0 auto;
	padding: 0;
}
#c {
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
}
table,
tr,
td {
	border-top : 1px solid #DDDDDD;
	border-bottom : 1px solid #DDDDDD;
}
.verticala {
	border-right : 1px solid #DDDDDD;
	background-color : #FFFAFA;
	text-align: left;
	width : 150px;
}
.divInTd {
	display: inline-block;
	padding-left : 20px;
	padding-top : 10px;
	font-size : 13px;
}
.divInTdIdAndName {
	display: inline-block;
	padding-left : 20px;
	font-size : 13px;
}
#info_username {
	display: inline-block;
	float: left;
	margin-left : 150px;
	margin-bottom : 0;
}
#info_name {
	display: inline-block;
	float: left;
	margin-left : 150px;
	margin-bottom : 0;
}
#picture {
	display: inline-block;
	float: left;
	margin-left : 150px;
	margin-bottom : 0;
}
#sajinBtn {
	margin-top : 35px;
}
.middleTd {
	padding-top : 20px;
	padding-bottom : 20px;
}
</style>
</head>
<body>
<div>
	<div>
			<jsp:include page="myPageMenu.jsp" />
	</div>
		<div id="c">
			<div id="e"> 내 정보 변경 </div>
			<div id="ea"></div>
				<div id="information_page">
			<table id=info class="table">
			<thead>
				<tr>
					<td class="verticala">
						<div class="divInTd">사진</div>
					</td>
					<td class="middleTd">
						<img id="picture" src="resources/picture.jpg" width="100px" Height="100px">
					</td>
					<td>
						<button id="sajinBtn" class="button">사진 변경</button>
					</td>
				</tr>
				<tr>
					<td class="verticala">
						<div class="divInTdIdAndName">아이디</div>
					</td>
					<td class="middleTd" colspan="2">
						<p id="info_username"></p>
					</td>
				</tr>
				<tr>
					<td class="verticala">
						<div class="divInTdIdAndName">이름</div>
					</td>
					<td class="middleTd">
						<p id="info_name"></p>
					</td>
				</tr>
				<tr>
					<td class="verticala">
						<div class="divInTd">휴대전화</div>
					</td>
					<td class="middleTd">
						<input type="text" class="input" id="tel_Input" placeholder="번호를 입력해주세요.">
						<span id="tel_span"></span>
					</td>
					<td>
						<button class="button" id="tel_Certification">인증하기</button>
						<p class="button" id="tel_Certification_finish">인증완료</p>
					</td>
				</tr>
				<tr>
					<td class="verticala">
						<div class="divInTd">이메일</div>
					</td>
					<td class="middleTd">
						<input type="text" class="input" id="email_Input"placeholder="이메일을 입력해주세요.">
						<span id="email_span"></span>
					</td>
					<td>
						<button class="button" id="email_Certification">인증하기</button>
						<p class="button" id="email_Certification_finish">인증완료</p>
					</td>
				</tr>
				<tr id="email_certification_tr">
					<td></td>
					<td class="middleTd">
						<input type="text" class="input" id="email_certification_Input">
					</td>
					<td>
						<button class="button" id="email_Certification_Input_Btn">인증하기</button>
					</td>
				</tr>
			</thead>
			</table>
		</div>
	</div>
	</div>
</body>
</html>
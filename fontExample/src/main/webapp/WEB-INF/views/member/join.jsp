<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
<script>
	function checkUsername() {
		var username = $("#username").val();
		var patt = /^[A-Za-z0-9]{4,10}$/
		if (username.length == 0) {
			$("#username_msg").text("아이디는 필수 입력입니다.").css("color", "red");
			return false;
		}
		if (!patt.test(username)) {
			$("#username_msg").text("아이디는 영숫자 4~10자 입니다.").css("color", "red");
			return false;
		}
		return true;
	}

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

	function checkPassword() {
		var patt = /(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{6,10}$/;
		var password = $("#password").val();
		var checkNumber = password.search(/[0-9]/g);
		var checkEnglish = password.search(/[a-z]/ig);
		if (password.length == 0) {
			$("#password_msg").text("필수입력입니다").css("color", "red");
			return false;
		}
		if (patt.test(password) == false) {
			$("#password_msg").text("비밀번호는 특수문자 포함 6~20자 입니다.").css('color',
					'red');
			return false;
		}
		if(checkNumber<0||checkEnglish<0){
			$("#password_msg").text("숫자와 영문자를 혼용하여야 합니다.").css('color', 'red');
			return false;
		}
		if(/(\w)\1\1\1/.test(password)){
			$("#password_msg").text("연속된 문자를 4번 이상 사용하실 수 없습니다.").css('color', 'red');
			return false;
		}
		$("#password_msg").text("사용 가능한 비밀번호 입니다.").css('color', 'green');
		return true;
	}

	function checkPassword2() {
		var passwordcheck = $("#passwordcheck").val();
		var password = $("#password").val();
		if (passwordcheck.length == 0) {
			$("#paasswordcheck_msg").text("필수입력입니다").css("color", "red");
			return false;
		}
		if (passwordcheck != password) {
			$("#passwordcheck_msg").text("비밀번호가 일치하지 않습니다.")
					.css('color', 'red');
			return false;
		}
		$("#passwordcheck_msg").text("비밀번호가 일치합니다.").css('color', 'green');
		return true;
	}

	function checkEmail() {
		var email = $("#email").val();
		var patt = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		if (email.length == 0) {
			$("#email_msg").text("필수입력입니다").css("color", "red");
			return false;
		}
		if (patt.test(email) == false) {
			$("#email_msg").text("올바르지 않은 이메일 형식입니다.").css("color", "red");
			return false;
		}
		$("#email_msg").text("");
		return true;
	}

	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var fullRoadAddr = data.roadAddress;
				var extraRoadAddr = '';

				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				document.getElementById('postcode1').value = data.zonecode;
				document.getElementById('postcode2').value = fullRoadAddr;
				document.getElementById("addr1").focus();
			}
		}).open();
	}

	function checkJuso() {
		var postcode1 = $("#postcode1").val();
		var postcode2 = $("#postcode2").val();
		var addr1 = $("#addr1").val();
		if (postcode1 == null) {
			return false;
		} else if (postcode2 == null) {
			return false;
		} else if (addr1 == null) {
			return false;
		} else {
			return true;
		}

	}

	function checkBox1() {
		if ($("input:checkbox[id='check1']").is(":checked") == true) {
			$("#checkbox_msg").text("");
			return true;
		} else {
			$("#checkbox_msg").text("약관에 동의해주세요").css("color", "red");
		}
	}

	function checkBox2() {
		if ($("input:checkbox[id='check2']").is(":checked") == true) {
			$("#checkbox_msg").text("");
			return true;
		} else {
			$("#checkbox_msg").text("약관에 동의해주세요").css("color", "red");
		}
	}
	function join() {
		var formData = new FormData(document.getElementById("joinForm"));
		$.ajax({
			url : "/fontExample/api/join",
			method : "post",
			// formData를 보내기 위한 ajax 설정 2가지
			// querystring 변환 금지
			processData : false,
			// multipart 지정
			contentType : false,
			data : formData,
			success : function(result, textStatus, response) {
				alert("회원가입이 완료 되었습니다.");
				location.href = response.getResponseHeader('location');
			},
			error : function(xhr) {
				console.log("에러 코드 :" + xhr.status);
				console.log("에러 메시지 :" + xhr.responseText);
			}
		})
	}

	$(function() {
		$("#alert").hide();
		$("#username").on(
				"blur",
				function() {
					if (checkUsername() == true) {
						$.ajax({
							url : "/fontExample/checkId/"
									+ $("#username").val(),
							method : "get",
							success : function(result) {
								$("#username_msg").text("사용가능합니다").css("color",
										"green");
							},
							error : function(xhr) {
								$("#username_msg").text("사용중인 아이디입니다").css(
										"color", "red");
							}
						});
					}
				});
		$("#email").on(
				"blur",
				function() {
					if (checkEmail() == true) {
						$.ajax({
							url : "/fontExample/checkEmail?email="
									+ $("#email").val(),
							method : "get",
							success : function(result) {
								$("#email_msg").text("사용가능합니다").css("color",
										"green");
							},
							error : function(xhr) {
								$("#email_msg").text("사용중인 이메일입니다").css(
										"color", "red");
							}
						});
					}
				})
		$("#name").on("blur", checkName);
		$("#password").on("blur", checkPassword);
		$("#passwordcheck").on("blur", checkPassword2);
		$("#check1").on("blur", checkBox1);
		$("#check2").on("blur", checkBox2);
		$("#join_termsOfUse").click(function() {
			var url = "termsOfUse";
			var name = "이용약관";
			var option = "width = 620, height = 600, top = 100, left = 200, location = no";
			window.open(url, name, option);
		});
		$("#join_privacyPolicy").click(function() {
					var url = "privacyPolicy";
					var name = "개인정보처리방침";
					var option = "width = 620, height = 600, top = 100, left = 200, location = no";
					window.open(url, name, option);
		});
		$("#joinbtn").on(
				"click",
				function() {
					if (!checkUsername() || !checkName() || !checkPassword()
							|| !checkPassword2() || !checkEmail()
							|| !checkJuso() || !checkBox1() || !checkBox2()) {
						return;
					}
					join();
				})
	});
$(document).ready(function() {
	$("#tou").click(function(e) {
			var url = "termsOfUse";
			var name = "(필수) 4982 이용 약관 동의";
			var option = "width = 620, height = 600, top = 100, left = 200, location = no";
			e.preventDefault();
			window.open(url, name, option);
		});
	$("#prpo").click(function(e) {
			var url = "privacyPolicy";
			var name = "(필수) 개인정보 활용 동의";
			var option = "width = 620, height = 600, top = 100, left = 200, location = no";
			e.preventDefault();
			window.open(url, name, option);
	});
});
document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);
</script>
<style>
* {
	margin: 0 auto;
	padding: 0;
}

h2 {
	text-align: center;
}

#main {
	text-align: center;
}

#joinTerms {
	text-align: center;
	height : 40px;
	width: 280px;
	overflow: auto;
}

.left {
	text-align: left;
	margin-bottom : 20px;
}

#infotext {
	width: 280px;
}

.textAll {
	width: 280px;
	height: 30px;
}

#select {
	height: 30px;
	width : 85px;
}

.juso {
	height: 30px;
}

.ssjuso {
	width: 98px;
	height: 30px;
}

#inTel {
	width: 115px;
	border-radius: 5px;
	background-color: rgb(255, 182, 193);
	color: white;
	height: 30px;
	font-weight: bold;
	border: none;
}

#joinbtn {
	width: 280px;
	border-radius : 5px;
	background-color: #ffb6c1;
	color: white;
	height: 40px;
	font-weight: bold;
	font-size : 20px;
	border: none;
}

#adrselectbtn {
	width: 115px;
	background-color: #ffb6c1;
	border-radius : 5px;
	color : white;
	height: 30px;
	font-weight: bold;
	border: none;
}
#titleJoin {
	text-align: left;
	color : black;
	margin-left : 460px;
	margin-right : 460px;
	border-bottom : 2px solid #ffb6c1;
	margin-bottom : 25px;
}
#tou {
	color : darkblue;
	font-size : 12px;
	float : right;
	margin-right : 114px;
}
#prpo {
	color : darkblue;
	font-size : 12px;
	float : right;
	margin-right : 120px;
}
#check1,
#check2 {
	margin : 0;
	float: left;
	margin-top : 2.2px;
}
#ternsTd1 {
	height : 30px;
}
.termsLi {
	height : 20px;
}
.checkTd {
	text-align : left;
	padding : 0px;
}
#titleTerms {
	font-size : 20px;
}
#tel {
	height : 30px;
	width : 191px;
	padding-top : 2.5px;
}
</style>
</head>
<body>
	<div id="main">
		<div id="titleJoin">
			<h1 style="font-weight: bold">회원가입</h1>
		</div>
		<form id="joinForm" method="post">
			<div id="infotext">
				<ul>
					<li class="left">
<!-- 					<label class="left">아이디</label><br> -->
					 <input type="hidden">
					 <input
						id="username" name="username" type="text"
						placeholder="아이디를 입력해주세요" class="textAll"><br> <span
						id="username_msg"></span></li>
					<li class="left">
<!-- 					<label class="left">비밀번호</label><br> -->
					<input id="password" name="password" type="password"
						placeholder="비밀번호를 입력해주세요" class="textAll"> <br> <span
						id="password_msg"></span></li>
					<li class="left">
<!-- 					<label>비밀번호 확인</label><br> -->
					<input id="passwordcheck" name="passwordcheck" type="password"
						placeholder="비밀번호 한 번 더 입력해주세요" class="textAll"> <br>
						<span id="passwordcheck_msg"></span></li>
					<li class="left">
<!-- 					<label>이름</label><br>  -->
					<input id="name" name="name" type="text" placeholder="이름을 입력해주세요" class="textAll">
						<br> <span id="name_msg"></span></li>
					<li class="left">
<!-- 					<label>이메일</label><br> -->
					<input id="email" name="email" type="text" placeholder="이메일을 입력입력해주세요"
						class="textAll"><br> <span id="email_msg"></span></li>
					<li class="left"></li>
					<li class="left">
<!-- 					<label style="width: 70px">우편번호</label><br> -->
						<input type="text" style="width: 160px" class="juso"
						id="postcode1" name="postcode1" placeholder="우편번호">
						<input id="adrselectbtn" type="button" onclick="openDaumPostcode()"
						value="우편번호 검색"></input></li>
					<li class="left">
<!-- 					<label style="width: 80px">도로명 주소</label><br> -->
						<input type="text" id="postcode2" name="postcode2"
						placeholder="도로명주소" style="width: 280px" class="juso"></li>
					<li class="left">
<!-- 					<label style="width: 80px">상세 주소</label><br> -->
						<input class="ssjuso" id="addr1" name="addr1" type="text"
						placeholder="상세 주소" style="width: 280px"></li>
					<li class="left">
<!-- 					<label>휴대전화</label><br> -->
						<select id="select">
								<option>대한민국 +82</option>
								<option>일본 +81</option>
								<option>미국, 캐나다 +1</option>
								<option>중국 +86</option>		
						</select>
						<input type="text" placeholder="번호 입력" name="tel" id="tel">
					</li>
					<li class="left">
<!-- 						<div style="display:none"> -->
<!-- 						<a href="#"><button id="inTel">인증번호 받기</button></a> -->
<!-- 						</div> -->
					</li>
				</ul>
			</div>
			</form>
			<table id="joinTerms">
				<tr class="termsLi">
					<td class="checkTd">
						<input type="checkbox" id="check1">
						<a href="" id="tou">(필수) 4982 이용 약관 동의</a>
					</td>
				</tr>
				<tr class="termsLi">
					<td class="checkTd">
						<input type="checkbox" id="check2">
						<a href="" id="prpo">(필수) 개인정보 활용 동의</a>
					</td>
				</tr>
			</table>
			<br>
		<div>
			<a href="#"><button id="joinbtn">회 원 가 입</button></a>
		</div>
		<br> <br>
	</div>
</body>
</html>
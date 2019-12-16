<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>판매 권한</title>

<script>
	$(function() {
		$("#input_imgs").on("change", handleImgsFilesSelect);
		$("#storeSajin").on("change", loadImage);

		$("#SalesRightsBtn").on("click", function() {
			var formData = new FormData(document.getElementById("salesForm"));
			formData.append("username", loginId);
			$.ajax({
				url : "/fontExample/salesRights",
				method : "post",
				// formData를 보내기 위한 ajax 설정 2가지
				// querystring 변환 금지
				processData : false,
				// multipart 지정
				contentType : false,
				data : formData,
				success : function(result, textStatus, response) {
					alert("판매권한이 등록 되었습니다");
					location.href = "http://localhost:8081/fontExample/";
				},
				error : function(xhr) {
					console.log("에러 코드 :" + xhr.status);
					console.log("에러 메시지 :" + xhr.responseText);

				}
			})
		})
	});
	// 프사 업로드 1mb넘으면 업로드 거부
	function loadImage() {
		var file = document.getElementById("storeSajin").files[0];
		var maxSize = 1024 * 1024; // 1MB
		if (file.size > maxSize) {
			toastr.warning("사진은 1MB이하여야 합니다", "경고");
			document.getElementById("storeSajin").value = "";
			return false;
		}

		// 이하 하드디스크에 있는 이미지 파일을 로딩해 화면에 출력하는 코드
		var url = window.URL || window.webkitURL;
		var img = new Image();

		img.src = url.createObjectURL(file);

		var reader = new FileReader();
		reader.onload = function(e) {
			$("#show_profile").attr("src", e.target.result);
		}
		reader.readAsDataURL(file);
		return true;
	}
	// 이미지 미리보기

	function handleImgsFilesSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}

			sel_files.push(f);

			var reader = new FileReader();
			reader.onload = function(e) {
				var img_html = "<img src=\""+e.target.result + "\"/>";
				$(".imgs_wraps").append(img_html);
			}
			reader.readAsDateURL(f);
		})
	}

	function checkName() {
		var name = $("#name").val();
		var patt = /^[A-Za-z0-9가-힣]{4,10}$/
		if (name.length == 0) {
			$("#name_msg").text("스토어명은 필수 입력입니다.").css("color", "red");
			return false;
		}
		if (!patt.test(name)) {
			$("#name_msg").text("스토어명은 한,영숫자 4~10자 입니다.").css("color", "red")
					.css("width", "100px");
			return false;
		}
		$("#name_msg").text("");
		return true;
	}
	function checkSns() {
		var sns = $("#sns").val();
		var patt = /^[A-Za-z0-9]{4,15}$/
		if (sns.length == 0) {
			$("#sns_msg").text("카톡 아이디는 필수 입력입니다.").css("color", "red");
			return false;
		}
		if (!patt.test(sns)) {
			$("#sns_msg").text("카톡 아이디는 영숫자 4~15자 입니다.").css("color", "red");
			return false;
		}
		$("#sns_msg").text("");

		return true;
	}
	function checkAccount() {
		var account = $("#account").val();
		var patt = /^[0-9]{10,15}$/
		if (account.length == 0) {
			$("#account_msg").text("계좌번호 필수 입력입니다.").css("color", "red");
			return false;
		}
		if (!patt.test(account)) {
			$("#account_msg").text("잘못된 계좌번호 입니다.").css("color", "red");
			return false;
		}
		$("#account_msg").text("");
		return true;
	}
	$(function() {
		$("#alert").hide();
		$("#name").on(
				"blur",
				function() {
					if (checkName() == true) {
						$.ajax({
							url : "/fontExample/checkName/name"
									+ $("#name").val(),
							method : "get",
							success : function(result) {
								$("#name_msg").text("사용가능합니다").css("color",
										"green");
							},
							error : function(xhr) {
								$("#name_msg").text("사용중인 스토어명입니다").css(
										"color", "red");
							}
						});
					}
				});
		$("#sns").on("blur", function() {
			if (checkSns() == true) {
				$.ajax({
					url : "/fontExample/checkSns/sns" + $("#sns").val(),
					method : "get",
					success : function(result) {
						$("#sns_msg").text("사용가능합니다").css("color", "green");
					},
					error : function(xhr) {
						$("#sns_msg").text("사용중인 아이디입니다").css("color", "red");
					}
				});
			}
		})
		$("#account").on(
				"blur",
				function() {
					if (checkAccount() == true) {
						$.ajax({
							url : "/fontExample/checkAccount/account"
									+ $("#account").val(),
							method : "get",
							success : function(result) {
								$("#account_msg").text("사용가능합니다").css("color",
										"green");
							},
							error : function(xhr) {
								$("#account_msg").text("사용중인 계좌번호입니다").css(
										"color", "red");
							}
						});
					}
				})
		$("name").on("blur", checkName);
		$("sns").on("blur", checkSns);
		$("account").on("blur", checkAccount)

		// 2. ajax 조건 체크. 작성한 순서와 무관하게 동시에 실행되므로 순서를 제어해야 한다
		$("#SalesRightsBtn").on("click", function() {
			// 다시 한번 동기 조건 체크
			if (!checkName() || !checkSns() || !checkAccount())
				return;
			salesRights();
		})

	});
</script>
<style>
* {
	margin: 0 auto;
	padding: 0;
}

#salesMain {
	float: right;
	width: 80%;
	height: 100%
}

.leftOfTable {
	border-right : 1px solid #DDDDDD;
	background-color : #FFFAFA;
	text-align: left;
	width : 250px;
}

#SalesRightsBtn {
	width: 200px;
	height: 30px;
	border-radius: 4px;
	background-color: #ffb6c1;
	font-weight: bold;
	color: white;
	border: none;
	display: inline-block;
}


#ea {
	border: 1px solid black;
	text-align: right;
	width: 100%;
}

#cph {
	font-weight: bolder;
	text-align: left;
	font-size: 40px;
}
#storeSajin {
	width: 300px;
	height: 25px;
	padding : 0;
	border-radius: 0;
	font-size : 13px;
	margin-left : 73px;
}

input {
	width: 250px;
}
table,
tr,
td {
	border-top : 1px solid #DDDDDD;
	border-bottom : 1px solid #DDDDDD;
}
.leftOfTableDiv {
	display: inline-block;
	padding-left : 20px;
	padding-top : 6px;
	font-size : 13px;
}
#name,
#sns,
#account {
	font-size : 13px;
	width : 300px;
	margin-left : 73px;
}
#show_profile {
	height : 240px;
	margin-left : 73px;
}
</style>
</head>
<body>
	<div>
		<div>
			<jsp:include page="myPageMenu.jsp" />
		</div>

		<div id="salesMain">
			<div id="cph">판매권한 등록</div>
			<div id="ea"></div>
			<form id="salesForm">
				<table class="table">
					<tr class="imgs_wraps">
						<td class="leftOfTable">
						</td>
						<td>
							<img id="show_profile">
						</td>
					</tr>
					<tr>
						<td class="leftOfTable">
							<div class="leftOfTableDiv">상점 프로필사진</div>
						</td>
						<td>
							<input id="storeSajin" type="file" name="storeSajin" class="form-control" accept=".jpg,.jpeg,.png,.gif,.bmp">
						</td>
					<tr>
						<td class="leftOfTable" >
							<div class="leftOfTableDiv">스토어명</div>
						</td>
						<td>
							<input id="name" name="name" type="text" placeholder="스토어명은 한, 영, 숫자 4~10글자 입력해주세요.">
							<span id="name_msg"></span>
						</td>
					</tr>
					<tr>
						<td class="leftOfTable">
							<div class="leftOfTableDiv">카톡 아이디</div>
						</td>
						<td>
							<input id="sns" name="sns" type="text" placeholder="카톡 아이디는 영, 숫자 4~15글자 입력해주세요.">
							<span id="sns_msg"></span>
						</td>
					</tr>
					<tr>
						<td class="leftOfTable">
							<div class="leftOfTableDiv">계좌번호</div>
						</td>
						<td>
							<input id="account" name="account" type="text" placeholder="'-' 빼고 입력해주세요.">
							<span id="account_msg"></span>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<a href="#">
								<button type="button" id="SalesRightsBtn">완료</button>
							</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>
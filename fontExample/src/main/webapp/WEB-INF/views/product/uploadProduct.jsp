<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<script src="/fontExample/ckeditor/ckeditor.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<sec:authorize access="isAuthenticated()">                          <!--  로그인 했을 때 실행  -->
   <sec:authentication property="principal.username" var="user" /> <!-- principal 로그인 되어 있는 정보  -->
</sec:authorize>
<title>Insert title here</title>
<script>
	/* 이미지 업로드 jquery*/
	var sel_files = [];
	$(document).ready(
			function() {
				loginId = '${user}';
				$("#input_imgs").on("change", handleImgsFilesSelect);
				$("#productImage").on("change", loadImage);
				$("#tag1Direct").hide();
				$("#tag2Direct").hide();
				$("#tag3Direct").hide();
				$("#tag4Direct").hide();
				$("#tag5Direct").hide();
				$("#tag6Direct").hide();
				$("#tag7Direct").hide();
				$("#tag8Direct").hide();
				$("#tag9Direct").hide();
				$("#tag10Direct").hide();
				
				$.ajax({
					url : "/fontExample/api/categories/large",
					method : "get",
					success : function(result) {
						$.each(result, function(idx, mr) {
							$("#lno").append("<option value="+mr.no+">"+mr.name+"</option>");
						});
						snoLoad(1);
					},
					error : function(xhr) {
						alert("xhr.status")
						alert("xhr.responseText")
						console.log("에러 코드 :" + xhr.status);
						console.log("에러 메시지 :" + xhr.responseText);
					}
				})
				
				$("#uploadbtn2").on("click", function(e) {
							e.preventDefault();
							if (checkInfo() && checkName() && checkJuso()
									&& checkPrice() && checkQuantity()) {
								productInsert();
							} else {
								alert("정보를 입력해주세요");
							}
						})

				$("#tag1").change(function() {
					if ($("#tag1").val() == "input") {
						$("#tag1Direct").show();
					} else {
						$("#tag1Direct").hide();
					}
				})
				$("#tag2").change(function() {
					if ($("#tag2").val() == "input") {
						$("#tag2Direct").show();
					} else {
						$("#tag2Direct").hide();
					}
				})
				$("#tag3").change(function() {
					if ($("#tag3").val() == "input") {
						$("#tag3Direct").show();
					} else {
						$("#tag3Direct").hide();
					}
				})
				$("#tag4").change(function() {
					if ($("#tag4").val() == "input") {
						$("#tag4Direct").show();
					} else {
						$("#tag4Direct").hide();
					}
				})
				$("#tag5").change(function() {
					if ($("#tag5").val() == "input") {
						$("#tag5Direct").show();
					} else {
						$("#tag5Direct").hide();
					}
				})
				$("#tag6").change(function() {
					if ($("#tag6").val() == "input") {
						$("#tag6Direct").show();
					} else {
						$("#tag6Direct").hide();
					}
				})
				$("#tag7").change(function() {
					if ($("#tag7").val() == "input") {
						$("#tag7Direct").show();
					} else {
						$("#tag7Direct").hide();
					}
				})
				$("#tag8").change(function() {
					if ($("#tag8").val() == "input") {
						$("#tag8Direct").show();
					} else {
						$("#tag8Direct").hide();
					}
				})
				$("#tag9").change(function() {
					if ($("#tag9").val() == "input") {
						$("#tag9Direct").show();
					} else {
						$("#tag9Direct").hide();
					}
				})
				$("#tag10").change(function() {
					if ($("#tag10").val() == "input") {
						$("#tag10Direct").show();
					} else {
						$("#tag10Direct").hide();
					}
				})
			});
	function snoLoad(lno){
		$("#sno option").remove();
		$.ajax({
			url : "/fontExample/api/categories/small/"+lno,
			method : "get",
			success : function(result) {
				$.each(result, function(idx, mr) {
					$("#sno").append("<option value="+mr.no+">"+mr.name+"</option>");
				});
			},
			error : function(xhr) {
				alert("xhr.status")
				alert("xhr.responseText")
				console.log("에러 코드 :" + xhr.status);
				console.log("에러 메시지 :" + xhr.responseText);
			}
		})
	}
	function lnoChange(){
		var lno = $("#lno").val();
		snoLoad(lno);
	}
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
				$(".imgs_wrap").append(img_html);
			}
			reader.readAsDateURL(f);
		});
	}
	//주소 api
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
				document.getElementById("quantity").focus();
			}
		}).open();
	}
	function loadImage() {
		var file = document.getElementById("productImage").files[0];
		var maxSize = 1024 * 1024; // 1MB
		if (file.size > maxSize) {
			toastr.warning("사진은 1MB이하여야 합니다", "경고");
			document.getElementById("productImage").value = "";
			return false;
		}

		// 이하 하드디스크에 있는 이미지 파일을 로딩해 화면에 출력하는 코드
		var url = window.URL || window.webkitURL;
		var img = new Image();

		img.src = url.createObjectURL(file);

		var reader = new FileReader();
		reader.onload = function(e) {
			$("#show_image").attr("src", e.target.result);
		}
		reader.readAsDataURL(file);
		return true;
	}

	function productInsert() {
		// 사진을 포함할 수 있으므로 FormData 형식
		var no = null;
		var formData = new FormData(document.getElementById("productUploadForm"));
		formData.append("information", CKEDITOR.instances['information'].getData());
		formData.append("productImage",	document.getElementById('productImage').files[0]);
		formData.append("username", loginId );
		$.ajax({
			url : "/fontExample/api/uploadProduct",
			method : "post",
			processData : false,
			contentType : false,
			data : formData,
			success : function(result) {
				alert(result);
				location.href = "/fontExample/readProduct?pageno=" + result
			},
			error : function(xhr) {
				alert("xhr.status")
				alert("xhr.responseText")
				console.log("에러 코드 :" + xhr.status);
				console.log("에러 메시지 :" + xhr.responseText);
			}
		})
	}
	function checkName() {
		console.log("checkName");
		var patt = /^[A-Za-z0-9_ 가-힣]{2,20}$/
		var name = $("#name").val();
		if (name.length == 0) {
			alert("필수입력입니다");
			document.getElementById("name").focus();
			return false;
		}
		if (patt.test(name) == false) {
			alert("제목은 2~20자입니다")
			document.getElementById("name").focus();
			return false;
		}
		return true;
	}
	function checkPrice() {
		console.log("checkPrice");
		var regex = /^[0-9]*$/
		var price = $("#price").val();
		console.log(price);
		if (price.length == 0) {
			alert("필수입력입니다");
			return false;
		}
		if (regex.test(price) == false) {
			alert("숫자만 입력해주세요")
			document.getElementById("price").focus();
			return false;
		}
		return true;
	}
	function checkQuantity() {
		console.log("checkQuantity");
		var regex = /^[0-9]*$/
		var quantity = $("#quantity").val();
		if (quantity.length == 0) {
			alert("필수입력입니다");
			return false;
		}
		if (regex.test(quantity) == false) {
			alert("숫자만 입력해주세요")
			document.getElementById("quantity").focus();
			return false;
		}
		return true;
	}
	function checkJuso() {
		console.log("checkJuso");
		var postcode1 = $("#postcode1").val();
		var postcode2 = $("#postcode2").val();
		if (postcode1 == "") {
			return false;
		} else if (postcode2 == "") {
			return false;
		} else {
			return true;
		}
	}

	function checkInfo() {
		console.log("checkInfo");
		var lno = $("#lno").val();
		var sno = $("#sno").val();
		if (lno == "" || sno == "")
			return false;
		else
			return true;
	}
</script>
<style>
* {
	margin: 0 auto;
	padding: 0;
	
}

#uploadmain {
	float: right;
	width: 80%;
}

#uph {
	font-family: THE행복열매;
	font-weight: bolder;
	text-align: left;
	font-size: 40px;
}

#uphome {
	height: 100%;
	text-align: center;
	overflow: hidden;
}

#rightfloat {
	text-align: left;
	float: right;
	width: 50%;
	padding: 20px;
	height: 100%;
	background-color: rgb(255, 227, 235);
}

#leftfloat {
	float: left;
	width: 50%;
	padding: 15px;
	height: 100%;
	background-color: rgb(255, 241, 242);
}

#bottomfloat {
	float: right;
	width: 100%;
	height: 100%;
}

.label1 {
	width: 84%;
	height: 25px;
}

.labelpad {
	width: 15%;
}

#information {
	width: 95%;
	height: 510px;
}

.selectwid {
	height: 25px;
}

.pleft {
	text-align: left;
}

.tagholder {
	width: 80px;
}

#uploadbtn1 {
	text-align: right;
}

#uploadbtn2 {
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

#imgp {
	text-align: left;
	padding-top : 5px;
	padding-bottom : 3px;
	padding-left : 30px;
	border : 5px solid #ffb6c1;
}

.selectBox {
	width: 80px;
	height: 25px;
}

.selectDirect {
	width: 80px;
	height: 25px;
}

.imgs_wrap {
	border: 2px solid lightgray;
}

#ea {
	border: 1px solid black;
	text-align: left;
	width: 100%;
	margin: 5px;
}

#adrselectbtn {
	width: 115px;
	border-radius: 4px;
	background-color: #ffb6c1;
	color: white;
	height: 24px;
	font-weight: bold;
	border: none;
	display: inline-block;
}
#imgp h4 {
	margin-bottom : 15px;
	font-weight: bold;
}

#showImageSpace {
	margin-top : 20px;
}
#showImageSpace h3 {
	font-weight: bold;
}
#showImageSpace .title {
	text-align: left;
	margin-bottom : 5px;
	font-size : 13px;
}
#roadA {
	display: block;
	width : 17%;
	margin : 0;
}
#price,
#postcode1,
#quantity {
	width : 33%;
}
#lno,
#sno {
	width : 33%;
}
#smallCateLa {
	margin-left : 5px;
}
#roadJuso {
	margin-bottom : 3.5px;
}
#postcode2 {
	width: 100%;
}
#uploadbtnDiv {
	text-align: right;
}
</style>
</head>
<body>
	<div>
		<div>
			<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" />
		</div>
		<div id="uploadmain">
			<div id="uph">판매글 작성</div>
			<div id="ea"></div>
			<div id="uphome">
				<form id="productUploadForm">
					<div id="leftfloat">
						<div id="imgp">
							<h4> ☆ 사진 업로드시 유의사항 ☆ </h4>
							<p>- 사진은 상품등록 시 정사각형으로 짤려서 등록됩니다.</p>
							<p>- 확대하기를 누를 경우 원본사진을 확인할 수 있습니다.</p>
							<p>- 사진을 클릭 후 이동하여 등록순서를 변경할 수 있습니다.</p>
							<p>- 큰 사진일 경우 이미지가 깨지는 경우가 발생할 수 있습니다.</p>
							<p>- 최대 지원 사이즈인 640x640으로 리사이즈 해서 올려주세요.</p>
							<p>(사진 용량 최대 10M)</p>
						</div>
						<div id="showImageSpace">
							<p class="title">사진 업로드</p>
							<input id="productImage" type="file" name="productImage" class="form-control" accept=".jpg,.jpeg,.png,.gif,.bmp">
							<h3>사진 미리보기</h3>
						</div>
						<div class="imgs_wrap">
							<img id="show_image" height="240px">
						</div>
					</div>
					<div id="rightfloat">
						<div>
							<label class="labelpad">제목: </label>
							<input type="text" class="label1" name="name" id="name" placeholder="제목을 입력해주세요.">
						</div>
						<div>
							<label class="labelpad">대분류 : </label> 
							<select id="lno" name="lno" class="selectwid" onchange="lnoChange()"></select>
							<label id="smallCateLa" class="labelpad">소분류 : </label> 
							<select id="sno" name="sno" class="selectwid"></select>
						</div>
						<div>
							<label class="labelpad">가격: </label>
							<input type="text" placeholder="가격을 입력해주세요." class="selectwid" name="price" id="price">
						</div>
						<div class="left">
							<label class="labelpad">우편번호</label> 
							<input type="text" class="juso" id="postcode1" name="postcode1" placeholder="우편번호">
							<input id="adrselectbtn" type="button" onclick="openDaumPostcode()" value="우편번호 검색"></input>
						</div>
						<div id="roadJuso" class="left">
							<label id="roadA" class="labelpad">도로명 주소</label> 
							<input type="text" id="postcode2" name="postcode2" placeholder="도로명주소" class="juso">
						</div>
						<div>
							<label class="labelpad">수량: </label> 
							<input type="text" id="quantity" name="quantity" placeholder="수량을 입력해주세요.">
						</div>
						<div>
							<label class="labelpad">상세 정보</label> 
							<textarea name="information" id="information"></textarea> 
							<script>var ck = CKEDITOR.replace('information',{filebrowserUploadUrl : '<c:url value="http://localhost:8081/fontExample/ckupload" />'});
							</script>
						</div>
						<div id="uploadbtnDiv">
							<button id="uploadbtn2">작성 완료</button>
						</div>
					</div>
						
<!-- 						<div style="visibility:hidden"> -->
<!-- 						<li><label>태그 입력: </label> <br>  -->
<!-- 						<select id="tag1" name="tag1" class="selectBox"> -->
<!-- 								<option value="0">선택</option> -->
<!-- 								<option value="1">하나</option> -->
<!-- 								<option value="2">둘</option> -->
<!-- 								<option value="3">셋</option> -->
<!-- 								<option value="input">직접입력</option> -->
<!-- 						</select> <input type="text" id="tag1Direct" name="tag1Direct" -->
<!-- 							class="selectDirect" /> <select id="tag2" name="tag2" -->
<!-- 							class="selectBox"> -->
<!-- 								<option value="0">선택</option> -->
<!-- 								<option value="1">하나</option> -->
<!-- 								<option value="2">둘</option> -->
<!-- 								<option value="3">셋</option> -->
<!-- 								<option value="input">직접입력</option> -->
<!-- 						</select> <input type="text" id="tag2Direct" name="tag2Direct" -->
<!-- 							class="selectDirect" /> <br> <select id="tag3" name="tag3" -->
<!-- 							class="selectBox"> -->
<!-- 								<option value="0">선택</option> -->
<!-- 								<option value="1">하나</option> -->
<!-- 								<option value="2">둘</option> -->
<!-- 								<option value="3">셋</option> -->
<!-- 								<option value="input">직접입력</option> -->
<!-- 						</select> <input type="text" id="tag3Direct" name="tag3Direct" -->
<!-- 							class="selectDirect" /> <select id="tag4" name="tag4" -->
<!-- 							class="selectBox"> -->
<!-- 								<option value="0">선택</option> -->
<!-- 								<option value="1">하나</option> -->
<!-- 								<option value="2">둘</option> -->
<!-- 								<option value="3">셋</option> -->
<!-- 								<option value="input">직접입력</option> -->
<!-- 						</select> <input type="text" id="tag4Direct" name="tag4Direct" -->
<!-- 							class="selectDirect" /> <br> <select id="tag5" name="tag5" -->
<!-- 							class="selectBox"> -->
<!-- 								<option value="0">선택</option> -->
<!-- 								<option value="1">하나</option> -->
<!-- 								<option value="2">둘</option> -->
<!-- 								<option value="3">셋</option> -->
<!-- 								<option value="input">직접입력</option> -->
<!-- 						</select> <input type="text" id="tag5Direct" name="tag5Direct" -->
<!-- 							class="selectDirect" /> <select id="tag6" name="tag6" -->
<!-- 							class="selectBox"> -->
<!-- 								<option value="0">선택</option> -->
<!-- 								<option value="1">하나</option> -->
<!-- 								<option value="2">둘</option> -->
<!-- 								<option value="3">셋</option> -->
<!-- 								<option value="input">직접입력</option> -->
<!-- 						</select> <input type="text" id="tag6Direct" name="tag6Direct" -->
<!-- 							class="selectDirect" /> <br> <select id="tag7" name="tag7" -->
<!-- 							class="selectBox"> -->
<!-- 								<option value="0">선택</option> -->
<!-- 								<option value="1">하나</option> -->
<!-- 								<option value="2">둘</option> -->
<!-- 								<option value="3">셋</option> -->
<!-- 								<option value="input">직접입력</option> -->
<!-- 						</select> <input type="text" id="tag7Direct" name="tag7Direct" -->
<!-- 							class="selectDirect" /> <select id="tag8" name="tag8" -->
<!-- 							class="selectBox"> -->
<!-- 								<option value="0">선택</option> -->
<!-- 								<option value="1">하나</option> -->
<!-- 								<option value="2">둘</option> -->
<!-- 								<option value="3">셋</option> -->
<!-- 								<option value="input">직접입력</option> -->
<!-- 						</select> <input type="text" id="tag8Direct" name="tag8Direct" -->
<!-- 							class="selectDirect" /> <br> <select id="tag9" name="tag9" -->
<!-- 							class="selectBox"> -->
<!-- 								<option value="0">선택</option> -->
<!-- 								<option value="1">하나</option> -->
<!-- 								<option value="2">둘</option> -->
<!-- 								<option value="3">셋</option> -->
<!-- 								<option value="input">직접입력</option> -->
<!-- 						</select> <input type="text" id="tag9Direct" name="tag9Direct" -->
<!-- 							class="selectDirect" /> <select id="tag10" name="tag10" -->
<!-- 							class="selectBox"> -->
<!-- 								<option value="0">선택</option> -->
<!-- 								<option value="1">하나</option> -->
<!-- 								<option value="2">둘</option> -->
<!-- 								<option value="3">셋</option> -->
<!-- 								<option value="input">직접입력</option> -->
<!-- 						</select> <input type="text" id="tag10Direct" name="tag10Direct" -->
<!-- 							class="selectDirect" /> <br> -->
<!-- 							<p>* 태그는 최대 10개까지 선택 및 입력이 가능합니다.</p></li> -->
<!-- 						</div> -->
				</form>
			</div>
		</div>
	</div>
</body>
</html>
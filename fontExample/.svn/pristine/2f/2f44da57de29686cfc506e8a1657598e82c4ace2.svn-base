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
<sec:authorize access="isAuthenticated()">                          <!--  로그인 했을 때 실행  -->
   <sec:authentication property="principal.username" var="user" /> <!-- principal 로그인 되어 있는 정보  -->
</sec:authorize>
<style>
* {
	margin : 0 auto;
	padding : 0;
}





#leftfloat {
	float: left;
	width: 50%;
	padding: 15px;
	height: 80%;
	background-color: rgb(255, 241, 242);
}
#imgp {
	width: 70%;
	text-align: left;
}
.imgs_wrap {
	border: 1px solid aliceblue;
}
#rightfloat {
	text-align: left;
	float: right;
	width: 50%;
	padding: 20px;
	height: 80%;
	background-color: rgb(255, 227, 235);
}
.selectwid {
	height: 25px;
	width: 26%;
}
#content {
	width: 95%;
	height: 510px;
}
.selectDirect {
	width: 80px;
	height: 25px;
}
.selectBox {
	width: 80px;
	height: 25px;
}





#MB_Below {
	height: 900px;
	padding: 10px;
	margin: 10px;
}

#topSellerInfo {
	width : 100%;
	height: 200px;
}

#storeImage {
	width: 50%;
	margin-top : 10px;
	margin-bottom : 10px;
	border-radius: 70px;
}

#storeId {
	font-weight : bold;
	color : white;
	font-size: 20px;
}

#sellerTrust {
	color: blue;
	border-bottom : 1px solid #E6E6E6;
}

#singoDecla {
	margin-bottom : 0;
	margin-left : 10px;
	margin-top : 55px;
	font-size : 13px;
	color: red;
}

#storeInfo {
	width: 20%;
	height: 200px;
	background-color : #848484;
	float: left;
}

#sellerInfo {
	float: right;
	width: 80%;
	text-align: left;
	font-size: 15px;
	height : 200px;
	border : 1px solid #E6E6E6;
	padding-left : 5px;
	padding-right : 20px;
}

#sellerStoreId {
	font-weight : bold;
	font-size : 20px;
	margin-bottom : 0;
}

.MB_Visit {
	font-size: 15px;
	width: 40%;
	float: left;
	text-align: left;
}

.Sell_Cnt {
	font-size: 15px;
	text-align: left;
	width: 40%;
	float: left;
}

.Report {
	font-size: 20px;
	width: 20%;
	color: red;
	float: right;
	text-align: right;
	font-weight: bolder;
}

.MB_Visit, .Sell_Cnt {
	font-size: 23px;
	font-weight: bold;
}

.Review_Pr {
	font-weight: bolder;
	font-size: 23px;
}

.Review_SellMb, .Review_Mb, .Product_Name, .Imgupload {
	font-size: 20px;
	text-align: left;
	padding-left: 30px;
}

.Imgupload {
	
}

#Img1, #Img2, #Img3 {
	margin: 10px;
	width: 200px;
	height: 200px;
}

#Review_Text, #Review_Trust {
	font-size: 20px;
}

.trust {
	padding: 5px;
}

#uploadDoneBtn {
	border-radius: 5px;
	background-color: rgb(255, 182, 193);
	color: white;
	height: 40px;
	font-weight: bold;
	width: 100px;
	border: none;
}

#show_image {
	height : 240px;
}

#d {
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

#b {
	float: left;
	height: 900px;
	width: 20%;
}

.li_a {
	font-weight: bold;
	font-size: 15px;
	margin: 5px;
	text-align: left;
}
</style>
<script>
/* 이미지 업로드 jquery */
	var sel_files =[];
	var seller;
	var productName;
	$(function() {
		
		function printSellerInfo(seller) {
			var $body = $("#topSellerInfo");
			var $div = $("<div>").attr("id", "storeInfo").appendTo($body);
			var $image = $("<img>").attr("id", "storeImage").attr("src", seller.image).appendTo($div);
			var $storeId = $("<p>").attr("id", "storeId").text(seller.username).appendTo($div);
			var $sellerInfo = $("<div>").attr("id", "sellerInfo").appendTo($body);
			var $sellerStoreId = $("<p>").attr("id", "sellerStoreId").text(seller.name).appendTo($sellerInfo);
			var $sellerTrust = $("<p>").attr("id", "sellerTrust").appendTo($sellerInfo);
			$("<span>").text("판매횟수 : "+ seller.count).appendTo($sellerTrust);
			$("<p>").text("전화번호 : " + seller.tel).appendTo($sellerInfo);
			$("<p>").text("카톡 아이디 : " + seller.sns).appendTo($sellerInfo);
			var $singoDecla = $("<p>").attr("id", "singoDecla").appendTo(sellerInfo);
			$("<a>").attr("href", "/fontExample/declaration").text("신고하기").appendTo($singoDecla);
		}
		
			var $form = $("#productUploadForm");
			var $leftfloat = $("<div>").attr("id","leftfloat").appendTo($form);
			var $label = $("<label>").text(" ☆ 이미지 업로드시 유의사항 ☆ ").appendTo($leftfloat);
			var $imgp = $("<div>").attr("id","imgp").appendTo($leftfloat);
				$("<p>").text("- 이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.").appendTo($imgp);
				$("<p>").text("- 확대하기를 누를 경우 원본이미지를 확인할 수 있습니다.").appendTo($imgp);
				$("<p>").text("- 사진을 클릭 후 이동하여 등록순서를 변경할 수 있습니다.").appendTo($imgp);
				$("<p>").text("- 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다.").appendTo($imgp);
				$("<p>").text("최대 지원 사이즈인 640x640으로 리사이즈 해서 올려주세요.").appendTo($imgp);
				$("<p>").text("(개당 이미지 최대 10M)").appendTo($imgp);
			var $imagePre = $("<div>").attr("id","imagePre").appendTo($leftfloat);
				$("<h3>").text("이미지 미리보기").appendTo($imagePre);
				$("<p>").attr("class","title").text("이미지 업로드").appendTo($imagePre);
				$("<input>").attr("id","images").attr("type","file").attr("name","images").attr("class","form-control").attr("accept",".jpg,.jpeg,.png,.gif,.bmp").appendTo($imagePre);
			var $imgs = $("<div>").attr("id","imgs").appendTo($leftfloat);
				$("<div>").attr("class","imgs_wrap").appendTo($imgs);
					$("<img>").attr("id","show_image").css("height","240px");
			var $rightfloat = $("<div>").attr("id","rightfloat").appendTo($form);
			var $rightUl = $("<ul>").attr("id","rightUl").appendTo($rightfloat);
// 				var $rightLi1 = $("<li>").attr("id","rightLi1").appendTo($rightUl);
// 					var $rightLabel1 = $("<label>").attr("class","labelpad").text("제목 : ").appendTo($rightLi1);
// 						$("<input>").attr("type","text").attr("class","label1").attr("name","name").attr("id","name").appendTo($rightLabel1);
// 				var $rightLi2 = $("<li>").attr("id","rightLi2").appendTo($rightUl);
// 					var $rightLabel2 = $("<label>").attr("class","labelpad").text("수량 : ").appendTo($rightLi2);
// 						$("<input>").attr("type","text").attr("id","quantity").attr("name","quantity").appendTo($rightLabel2);
// 				var $rightLi3 = $("<li>").attr("id","rightLi3").appendTo($rightUl);
// 					var $rightLabel3 = $("<label>").attr("class","labelpad").text("신뢰도 : ").appendTo($rightLi3);
// 						var $trueBtn = $("<button>").attr("type","button").attr("id","trustTrue").text(" + ").appendTo($rightLabel3);
// 							$("<span>").attr("class","badge").attr("id","trustUpSpan").appendTo($trueBtn);
// 						var $falseBtn = $("<button>").attr("type","button").attr("id","trustFalse").text(" - ").appendTo($rightLabel3);
// 							$("<span>").attr("class","badge").attr("id","trustDownSpan").appendTo($falseBtn);
					var $detailInfor = $("<li>").attr("id","detailInfor").appendTo($rightUl);
						$("<label>").attr("class","labelpad").text("상세정보").appendTo($detailInfor);
						$("<textarea>").attr("name", "content").attr("id","content").appendTo($detailInfor);
						var ck = CKEDITOR.replace('content',{
                            filebrowserUploadUrl : '<c:url value="http://localhost:8081/fontExample/ckupload" />'
                         });
						
						
				var $uploadDoneBtn = $("<button>").attr("id","uploadDoneBtn").attr("type","button").text("작성 완료").appendTo($rightfloat);
						
				
				
				seller = '${username}'
				productName = '${productName}'
				console.log(username);
				console.log(productName);
				
				
				loginId = '${user}';
				$("#input_imgs").on("change", handleImgsFilesSelect);
				$("#images").on("change", loadImage);
				
				$("#productUploadForm").submit(function(e) {
					// form을 서버로 전송할 수 있는 urlencoded 형식으로 변환하는 함수가 serialize
					// 하지만 CKEDITOR로 지정한 textarea는 별도로 읽어와 붙여줘야 한다
					e.preventDefault();
						productInsert();
				});
				
				$("#uploadDoneBtn").click(function() {
					$("#productUploadForm").submit();
				});
				
				
				var sellerNameRaw = location.search.substring(10).split('&');
				var sellerName = decodeURI(sellerNameRaw[0]);
				param2 = {
						username : sellerName
				}
				$.ajax({
					url : "/fontExample/findsellerAll",
					method : "get",
					dataType :"json",
					data: param2,
					success : function(result) {
						printSellerInfo(result);
					}
				});
				
				
			});
	
	function handleImgsFilesSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			
			sel.files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e) {
				var img_html = "<img src=\""+e.target.result + "\"/>";
				$(".imgs_wrap").append(img_html);
			}
			reader.readAsDateURL(f);
		});
	}
	
	function loadImage() {
		var file = document.getElementById("images").files[0];
		var maxSize = 1024 * 1024; // 1MB
		if(file.size > maxSize) {
			toastr.warning("사진은 1MB이하여야 합니다", "경고");
			document.getElementById("images").value = "";
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
		

		
		console.log(formData);
		formData.append("content", CKEDITOR.instances['content'].getData());
		formData.append("productImage", document.getElementById('images').files[0]);
		formData.append("username", seller);
		formData.append("product", productName);
		// 생년, 생월, 생일을 연결해서 생년월일을 만든다
		
		// ES스크립트 6의 of 반복문을 이용하면 FpormData의 값을 출력할 수 있다
		$.ajax({
			url : "/fontExample/api/sellReviewReport",
			method : "post",
			// formData를 보내기 위한 ajax 설정 2가지
			// querystring 변환 금지
			processData : false,
			// multipart 지정
			contentType : false,
			data : formData,
			success : function(result) {
				alert(result);
				location.href = "/fontExample/sellReviewPage?seller=" + seller
			},
			error : function(xhr) {
				alert(xhr.status)
				alert(xhr.responseText)
				console.log("에러 코드 :" + xhr.status);
				console.log("에러 메시지 :" + xhr.responseText);
			}
		});
	}
	
	
// 	function checkName() {
// 		console.log("checkName");
// 		var patt = /^[A-Za-z0-9가-힣]{2,20}$/
// 		var name = $("#name").val();
// 		if (name.length == 0) {
// 			alert("제목 필수입력입니다");
// 			document.getElementById("name").focus();
// 			return false;
// 		}
// 		if (patt.test(name) == false) {
// 			alert("제목은 2~20자입니다")
// 			document.getElementById("name").focus();
// 			return false;
// 		}
// 		return true;
// 	}
	
	
	
 
// 	$(function() {
		
// 		var username = location.search.substr(10);
// 		$.ajax({
// 			url : "/fontExample/api/sellerReviews/" + username,
// 			method : "get",
// 			success : function(result, status, xhr) {
// 				console.log(result);
// 				seller_review = result
// 			}, error : function(xhr) {
// 				console.log(xhr.status);
// 			}
// 		});
		
// 		$("#trustTrue").on("click", function() {
// 			var param= {
// 				_method : "patch",
// 				username : seller_review.username,
// 			};
// 			console.log(param);
// 			$.ajax({
// 				url : "/fontExample/api/sellerReviews/trustUp",
// 				method : "post",
// 				data : param,
// 				success : function(ress) {
// 					console.log(ress);
// 					$("#trustUpSpan").text(ress);
// 				}, error : function(xhr) {
// 					console.log(xhr.status);
// 				}
// 			});
// 		});
		
// 		$("#trustFalse").on("click", function() {
// 			var param = {
// 				_method : "patch",
// 				username : seller_review.username,
// 			};
// 			$.ajax({
// 				url : "/fontExample/api/sellerReviews/trustDown",
// 				method : "post",
// 				data : param,
// 				success : function(ress) {
// 					$("#trustDownSpan").text(ress);
// 				}, error : function(xhr) {
// 					console.log(xhr.status);
// 				}
// 			});
// 		});
// 	});
 
</script>
</head>
<body>
	<div id="topSellerInfo">
	</div>
	
	<form id="productUploadForm">
	</form>
</body>
</html>
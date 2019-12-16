<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<sec:authorize access="isAuthenticated()">                          <!--  로그인 했을 때 실행  -->
   <sec:authentication property="principal.username" var="user" /> <!-- principal 로그인 되어 있는 정보  -->
</sec:authorize>
 <script>
 	 loginId = '${user}';
 	 var productno = location.search.substr(8);
 	 console.log(productno);
	 $(document).ready(function(){
		 	$('[data-toggle="tooltip"]').tooltip();   
			var param = {
					no : productno
			}
			var sellerUsername = "";
			$.ajax({
				url: "/fontExample/api/product/find",
				method: 'get',
				data: param,
				success : function(result) {
					$("#productName").text(result.name);
					$("#productImage").attr("src", result.image);
					$("#productQuantity").text(result.quantity);
					$("#productPrice").text(result.price);
					$("#category").text(result.lno +""+ result.sno);
					$("#deliveryPrice").text(2500);
					findPoint();
					findsellerbyNo();
					productPayment(result.price);
				}
			})
			
			$("#paymentQuantity").on("blur", blurQuantity);
			
			$("#buyBtn").on("click", function(){
				var quantity = $("#paymentQuantity").val();
				var name = $("#name").val();
				var postcode = $("#postcode1").val();
				if(quantity == ""){
					alert("구매수량 입력해주세요");
					document.getElementById("paymentQuantity").focus();
				}else if(postcode == ""){
					alert("주소를 입력해주세요");
					document.getElementById("postcode1").focus();
				}else if(name == ""){
					alert("이름을 입력해주세요");
					document.getElementById("name").focus();
				}else{
					var finalPaymentAmount = parseInt($("#finalPaymentAmount").text());
					var paramData = {
							finalPayment : finalPaymentAmount
					}
					$.ajax({
						url: "/fontExample/api/checkfinalPayment",
						method: 'post',
						data: paramData,
						success : function(result) {
							if(result == 1){
								pointUp();
							}else{
								amount();
							}
						}
					})
				}
			})
			
			$("#cancelBtn").on("click", function(){
				history.back();				
			})
		})
		
		function pointUp(){
		 	var finalPaymentAmount = parseInt($("#finalPaymentAmount").text());
		 	location.href="/fontExample/charge?payment"+finalPaymentAmount;
	 	}
	 	function amount(){
	 		var paramData = {
	 				no : productno,
	 				quantity : $("#paymentQuantity").val()
		 	}
	 		console.log(paramData)
	 		$.ajax({
				url: "/fontExample/api/purchase/insert",
				method: 'post',
				data: paramData,
				success : function(result) {
					location.href="/fontExample/purchaseok?no="+productno;
				}
			})
	 		
	 	}
	 	function findsellerbyNo(){
	 		var param = {
		 			no : productno
		 		}
		 		$.ajax({
		 			url: "/fontExample/findsellerbyno",
		 			method: 'get',
		 			data : param,
		 			async : false,
		 			success : function(result) {
		 				sellerUsername = result;
		 				$("#seller_username").text(result);
		 			}
		 		})
	 	}
	 	function blurQuantity(){
	 		var price = $("#productPrice").text();
	 		productPayment(price)
	 	}
	 	function findPoint(){
	 		$.ajax({
				url: "/fontExample/api/point",
				method: 'get',
				async : false,
				success : function(result) {
					$("#myPoint").text(result);
				}
			})
	 	}
	 	function productPayment(price){
	 		var quantity = $("#paymentQuantity").val();
	 		var maxQuantity = parseInt($("#productQuantity").text());
	 		if(quantity == ""){
	 			var productPayment = price * 1;
		 		$("#productPayment").text(productPayment);
		 		finalPaymentAmount(productPayment);	
	 		}else if(quantity > maxQuantity){
	 			alert("최대 수량은 " + maxQuantity +" 개 입니다");
	 			document.getElementById("paymentQuantity").value="";
	 			document.getElementById("paymentQuantity").focus();
	 		}else{
	 			var productPayment = price * quantity;
		 		$("#productPayment").text(productPayment);
		 		finalPaymentAmount(productPayment);
	 		}
	 	}
	 	
		function finalPaymentAmount(price){
		 	var delivertPrice = parseInt($("#deliveryPrice").text());
		 	var eventPrice = parseInt($("#eventPrice").text());
		 	var myPoint = parseInt($("#myPoint").text());
			
			var payment = delivertPrice + price;
			var mPayment = eventPrice + myPoint;
			if(mPayment > payment){
				$("#finalPaymentAmount").text(0);
			}else{
				var result = payment - mPayment;
				$("#finalPaymentAmount").text(result);
			}
						
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
	 </script>
<style>
* {
	margin: 0 auto;
	padding: 0;
}
#paymentMain{
	margin-top: 30px;
	width: 820px;
}
.subtitle{
	box-sizing: border-box;
    position: relative;
    min-height: 30px;
    margin-top: 15px;
    padding: 11px 0 8px;
    color: #2f2f2f;
    font-size: 18px;
    font-weight: 700;
    text-align: left;
}
#paymentTable{
	table-layout: fixed;
    width: 100%;
    border-spacing: 0;
    border-collapse: collapse;
    border-top: 2px solid #e1e1e1;
    color: #1d1d1d;
}

#paymentTable tr td{
	box-sizing: border-box;
    position: relative;
    padding: 7px 0 7px 10px;
    border-bottom: 1px solid #e1e1e1;
    text-align: left;
}

#paymentTable tr th{
    border-bottom: 1px solid #e1e1e1;
    border-right : 1px solid #DDDDDD;
	background-color : #FFFAFA;
	text-align: left;
	width : 150px;
}
#paymentTitle{
	font-size : 30px;
	font-weight: bold;
}
.btnGroup{
    margin: 45px 0;
    text-align: center;
}
.paymentButton{
	width: 120px;
	height: 30px;
	border-radius: 4px;
	background-color: #ffb6c1;
	font-weight: bold;
	color: white;
	border: none;
	display: inline-block;
}
#buyBtn{
	margin-right: 15px;
}
#paymentQuantity {
	display: inline-block;
	float: left;
	margin-bottom : 0;
	width: 35px;
	height: 25px;
	padding : 0;
	font-size : 13px;
	text-align: right;
	margin-right : 5px;
}
#tooltipA{
	text-decoration: none;
	color: black;
}
#productImage {
	margin-left : 156.5px;
}
.divInCCTh {
	display: inline-block;
	padding-left : 20px;
	font-size : 13px;
}
#name {
	display: inline-block;
	margin-bottom : 0;
	width: 145px;
	height: 25px;
	padding : 0;
	font-size : 13px;
}
#postcode1 {
	display: inline-block;
	margin-bottom : 0;
	width: 145px;
	height: 25px;
	padding : 0;
	font-size : 13px;
}
.usernamePClass {
	margin-top : 8px;
	margin-bottom : 3px;
	font-weight: bold;
	font-size : 14px;
}
#postcode2,
#addr1 {
	display: inline-block;
	margin-bottom : 0;
	width: 100%;
	height: 25px;
	padding : 0;
	font-size : 13px;
}
#adrselectbtn {
	display: inline-block;
	height: 25px;
	width : 95px;
	padding-bottom : 2px;
	font-size : 13px;
	border-radius: 4px;
	background-color: #ffb6c1;
	font-weight: bold;
	color: white;
	border: none;
}
</style>
</head>
<body>
	<div id="paymentMain">
		<div id="paymentTitle">
			구매정보 확인
		</div>
		<div id="ProductInfo">
			<div class="subtitle">물품정보</div>
			<table id="paymentTable">
				<tr>
					<th>
						<div class="divInCCTh">카테고리</div>
					</th>
					<td colspan="3" id="category">1 </td>
				</tr>
				<tr>	
					<th>
						<div class="divInCCTh">물품제목</div>
					</th>
					<td colspan="3" id="productName"> 1</td>
				</tr>
				<tr>	
					<th>
						<div class="divInCCTh">등록일시</div>
					</th>
					<td colspan="3" id="productDate"> 1</td>
				</tr>
				<tr>
					<th>
						<div class="divInCCTh">수량</div>
					</th>
					<td id="productQuantity"> 1</td>
					<th>
						<div class="divInCCTh">가격</div>
					</th>
					<td><span>￦</span><span id="productPrice"></span></td>
				</tr>
				<tr>	
					<th>
						<div class="divInCCTh">구매수량</div>
					</th>
					<td colspan="3"><input  id="paymentQuantity" name="paymentQuantity"> 개</td>
				</tr>
				<tr>
					<th>
						<div class="divInCCTh">물품사진</div>
					</th>
					<td colspan="3"><img id="productImage"> </td>
				</tr>
			</table>
		</div>
		<div id="MyInfo">
			<div class="subtitle">배송지 정보</div>
			<table id="paymentTable">
				<tr>
					<th>
						<div class="divInCCTh">이름</div>
					</th>
					<td><input id="name" name="name" placeholder="이름을 입력해주세요"></td>
				</tr>
				<tr>
					<th>
						<div class="divInCCTh">배송지</div>
					</th>
					<td id="username">
						<p class="usernamePClass">우편번호</p>
						<div>
						<input type="text" class="juso" id="postcode1" name="postcode1" placeholder="우편번호"> 
						<input id="adrselectbtn" type="button" onclick="openDaumPostcode()"	value="우편번호 검색">
						</div>
						<p class="usernamePClass">도로명 주소</p>
						<input type="text" id="postcode2" name="postcode2" placeholder="도로명주소" class="juso">
						<p class="usernamePClass">상세 주소</p>
						<input class="ssjuso" id="addr1" name="addr1" type="text" placeholder="상세 주소">
					</td>
				</tr>
			</table>
		</div>
		
		<div id="amountInfo">
			<div class="subtitle">결제정보</div>
			<table id="paymentTable">
				<tr>
					<th>
						<div class="divInCCTh">상품금액</div>
					</th>
					<td><span>￦</span><span id="productPayment"></span></td>
				</tr>
				<tr>
					<th>
						<div class="divInCCTh">배송비</div>
					</th>
					<td><span>￦</span><span id="deliveryPrice"></span></td>
				</tr>
				<tr>
					<th>
						<div class="divInCCTh">이벤트</div>
					</th>
					<td><span>￦</span><span id="eventPrice">0</span></td>
				</tr>
				<tr>
					<th>
						<div class="divInCCTh">현재보유포인트</div>
					</th>
					<td ><span>￦</span><span id="myPoint">0</span></td>
				</tr>
				<tr>
					<th>
						<div class="divInCCTh">
							<a href="#" id="tooltipA"data-toggle="tooltip" title="(상품금액+배송비) - (이벤트+현재보유포인트)">최종결제금액</a>
						</div>
					</th>
					<td><span>￦</span><span id="finalPaymentAmount"></span></td>
				</tr>
			</table>
		</div>
		<input id="seller_username" name="seller_username" type="hidden">
		<div class="btnGroup">
			<button class="paymentButton" id="buyBtn">구매하기</button>
			<button class="paymentButton" id="cancelBtn">취소하기</button>
		</div>
	</div>
</body>
</html>
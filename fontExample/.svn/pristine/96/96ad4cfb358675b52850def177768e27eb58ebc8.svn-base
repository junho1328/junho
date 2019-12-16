<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>구매내역</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.buyHistoryPage {
	width: 960px;
	text-align: right;
	margin-left: 240px;
}

.buyHistoryPage * {
	text-align: left;
}

.buyHistoryPage h2 {
	text-align: center;
	margin-top: 10px;
	margin-bottom: 50px;
	border-bottom: 2px solid gray;
	padding-bottom: 20px;
	font-weight: bold;
}

.categoryBtnMenu {
	height: 40px;
	margin-bottom: 50px;
}

.categoryBtnMenu ul {
	width: 100%;
	height: 40px;
}

.categoryBtnMenu ul li {
	width: 49.7%;
	list-style: none;
	margin: 1px;
	float: left;
}

.categoryBtnMenu ul li a {
	font-weight: bold;
	display: block;
	width: 100%;
	height: 40px;
	line-height: 40px;
	background: rgb(240, 240, 240);
	color: black;
	font-size: 12px;
	text-align: center;
	text-decoration: none;
}

.categoryBtnMenu ul li:first-child a {
	background-color: rgb(255, 182, 193);
}

.buyInformation {
	width: 900px;
	height: 339px;
	border: 1px solid black;
	margin-left: 265px;
}

.buyDate {
	width: 898px;
	height: 60px;
	background-color: rgb(240, 240, 240);
	border-bottom: 1px solid black;	
}

.buyDate p {
	padding: 20px;
	margin: 0px;
	text-align: left;
}

.buyDate a {
	float:right;
	cursor: pointer;
}

.tradeDate {
	font-weight: bold;
}

.orderImage {
	float: left;
	padding: 50px;
	padding-left: 20px;
}

.buyOrderInfomation {
	width: 650px;
	float: left;
}

.orderText {
	padding: 64px;
}

.orderTotalStatus {
	width: 198px;
	height: 278px;
	padding: 30px;
	float: left;
	border-left: 1px solid black;
	text-align: center;
}

.orderTotalStatus button {
	width: 100%;
	text-align: center;
}

.buyOrderCheckbox {
	float: left;
	height: 278px;
	line-height: 278px;
	position: relative;
	padding: 18.5px;
}

.buyOrderCheckbox input {
	position: relative;
	margin-top: 0px;
	top: 45%;
}

.orderStatusMessage {
	text-align: center;
	height: 92.6px;
}
.orderStatus {
	padding-top: 10px;
	padding-bottom: 50px;
}

.orderStatus p {
	text-align: center;
}

.orderBtn {
	margin-top: 0px;
}

.orderBtn button {
	margin-bottom: 10px;
}

.orderText {
	text-align: left;
}
.orderTextTitle {
	font-weight: bold;
}

.buyList_item {
	margin-bottom: 30px;
	
}

.deleteBtnDiv {
	width: 900px;
	height: 50px;
	line-height: 50px;
	margin-left: 265px;
}

#deleteBtn {
	margin-top: 8px;
	margin-bottom: 8px;
	float: right;
}

/* JH 스타일 */

#e {
	font-family: THE행복열매;
	font-weight: bolder;
	text-align: left;
	font-size: 40px;
}

#ea {
	border: 1px solid black;
	text-align: left;
	width: 100%;
	margin: 5px;
	margin-bottom:20px;
}

</style>
<script>
$(document).ready(function() {
	var $body = $(".buyHistoryPage");
	$("<div>").text("구매대기상품").attr("id","e").appendTo($body);
	$("<div>").attr("id","ea").appendTo($body);
	$("<div class=categoryBtnMenu></div>").appendTo($body);
	$("<ul class=categoryBtn>").appendTo(".categoryBtnMenu");
	function printList(page) {
		var $body = $(".buyList_item");
		var $productData = null;
		$.each(page.purchases, function(idx, sm) {
			var param = {
					no : sm.product_no
			}
			$.ajax({
				url : "/fontExample/api/product/find",
				method : "get",
				async : false,
				data : param,
				success : function(result){
					$productData = result
					console.log($productData)
				}
			})
			var $buyListItem = $("<div>").attr("class","buyList_item").appendTo($body);
			var $buyInformation = $("<div>").attr("class","buyInformation").appendTo($buyListItem);
			var $buyDate = $("<div>").attr("class","buyDate").appendTo($buyInformation);
			var $tradeDate = $("<p>").text("예약날짜 : ").appendTo($buyDate);
			// 거래날짜
			$("<span>").text(sm.purchaseDate).attr("class","tradeDate").appendTo($tradeDate);
			var $buyOrderCheckbox = $("<div>").attr("class","buyOrderCheckbox").appendTo($buyInformation);
			var $buyOrderInfomation = $("<div>").attr("class","buyOrderInfomation").appendTo($buyInformation);
			var $orderImage = $("<div>").attr("class","orderImage").appendTo($buyOrderInfomation);
			// 이미지
			$("<img>").attr("src",$productData.image).attr("width","150px").attr("alt","상품이미지").appendTo($orderImage).css("cursor","pointer").on("click",function() {
				location.href="http://localhost:8081/fontExample/readProduct?pageno="+sm.product_no
			});
			var $orderText = $("<div>").attr("class","orderText").appendTo($buyOrderInfomation);
			// 제품명
			$("<p>").text($productData.name).attr("class","orderTextTitle").appendTo($orderText).css("cursor","pointer").on("click",function() {
				location.href="http://localhost:8081/fontExample/readProduct?pageno="+sm.product_no
			});
			var $orderProductInfo = $("<p>").appendTo($orderText);
			// 가격
			$("<span>").text("합계 "+ sm.amount + "원 /").appendTo($orderProductInfo);
			// 판매자
			$("<span>").text("판매자 : " + sm.seller).appendTo($orderProductInfo).css("cursor","pointer").on("click",function() {
				location.href="http://localhost:8081/fontExample/sellReviewPage?no="+sm.no
			});
			var $orderTotalStatus = $("<div>").attr("class","orderTotalStatus").appendTo($buyInformation);
			var $orderStatusMessage = $("<div>").attr("class","orderStatusMessage").appendTo($orderTotalStatus);
			// 거래상태
			if(sm.state==1) {
				$("<p>").text("배송 준비중").appendTo($orderStatusMessage);
			} else {
				$("<p>").text("배송중").appendTo($orderStatusMessage);				
			}
			var $orderBtn = $("<div>").attr("class","orderBtn").appendTo($orderTotalStatus);
			$("<button>").attr("id","contactBtn").text("판매자와 연락").attr("class","btn btn-primary")
				.on("click",function() {
					location.href="/fontExample/talk?no="+sm.no;
				}).appendTo($orderBtn);
			$("<button>").attr("id","reviewBtn").val(sm.state).text("구매 확정").attr("class","btn btn-warning")
				.on("click",function() {
					purchaseFinal()
				}).appendTo($orderBtn);
			$("<button>").attr("id","reportBtn").val(sm.state).text("구매 취소").attr("class","btn btn-default")
				.on("click",function() {
					//cancelPurchase()
				}).appendTo($orderBtn);
			$("<input>").attr("type","hidden").attr("id","proNO").val(sm.no).appendTo($orderStatusMessage);
		});
	}
	function purchaseFinal(){
		if(2==1){
			alert("판매자가 아직 배송을 하지 않았습니다.")
		} else if (1==1){
			var param = {
					no : $("#proNO").val()
			}
			$.ajax({
				url : "/fontExample/api/purchase/complete",
				method : "post",
				data : param,
				success : function(result){
					alert("구매확정 완료")
					location.href = "http://localhost:8081/fontExample/buy_waiting"
				}
			})
		}
	}
	function printPage(page) {
		var $ul = $("<ul>").attr("class", "pagination").appendTo($("#paging"));
		var cntOfPage = Math.floor(page.totalcount / page.pagesize);
		if (page.totalcount % page.pagesize != 0)
			cntOfPage++;

		var blockSize = 5;
		var blockNo = Math.floor(page.pageno / blockSize) + 1;
		// page.pageno가 blockSize의 배수인 경우 (위에서 pageno가 5, 10, 15) blockNo 감소
		if (page.pageno % blockSize == 0)
			blockNo--;
		var startPage = (blockNo - 1) * blockSize + 1;
		var endPage = startPage + blockSize - 1;
		if (endPage > cntOfPage)
			endPage = cntOfPage;

		if (blockNo > 1) {
			var $li = $("<li>").attr("class", "previous").appendTo($ul);
			$("<a>").attr("href",
					"/fontExample/buy_waiting?pageno=" + (startPage - 1)).text(
					"앞으로").appendTo($li);
		}
		for (var i = startPage; i <= endPage; i++) {
			if (i == page.pageno) {
				var $li = $("<li>").attr("class", "active").appendTo($ul);
				$("<a>").attr("href", "/fontExample/buy_waiting?pageno=" + i)
						.text(i).appendTo($li);
			} else {
				var $li = $("<li>").appendTo($ul);
				$("<a>").attr("href", "/fontExample/buy_waiting?pageno=" + i)
						.text(i).appendTo($li);
			}
		}

		if (endPage < cntOfPage) {
			var $li = $("<li>").attr("class", "next").appendTo($ul);
			$("<a>").attr("href",
					"/fontExample/buy_waiting?pageno=" + (endPage + 1)).text(
					"다음으로").appendTo($li);
		}
	}

	
	$(function() {
		$.ajax({
			url : "/fontExample/api/purchase/waiting/buyer",
			method : "get",
			data : location.search.substr(8),
			success : function(result) {
				console.log(result);
				printList(result);
				printPage(result);
			}
		});
	});
})
</script>
</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" />
	</div>
    <div class="buyHistoryPage">
    </div>
	<div class="buyList_item">
	</div>
	<div id="paging" style="text-align: center;">
   	</div>
</body>
</html>



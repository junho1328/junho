<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>판매내역</title>
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

.sellHistoryPage {
	width: 960px;
	text-align: right;
	margin-left: 240px;
}

.sellHistoryPage * {
	text-align: left;
}

.sellHistoryPage h2 {
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

.categoryBtnMenu ul li:last-child a {
	background-color: rgb(255, 182, 193);
}

.sellInformation {
	width: 900px;
	height: 339px;
	border: 1px solid black;
	margin-left: 265px;
}

.sellDate {
	width: 898px;
	height: 60px;
	background-color: rgb(240, 240, 240);
	border-bottom: 1px solid black;	
}

.sellDate p {
	padding: 20px;
	margin: 0px;
	text-align: left;
}

.sellDate a {
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

.sellOrderInfomation {
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

.sellOrderCheckbox {
	float: left;
	height: 278px;
	line-height: 278px;
	position: relative;
	padding: 18.5px;
}

.sellOrderCheckbox input {
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

.sellList_item {
	margin-bottom: 30px;
}

.deleteBtnDiv {
	width: 900px;
	height: 50px;
	line-height: 50px;
	margin-left: 265px;
}

.deleteBtnDiv button:first-child {
	margin-top: 8px;
	margin-bottom: 8px;
	float: left;
}
.deleteBtnDiv button:last-child {
	margin-top: 8px;
	margin-bottom: 8px;
	float: right;
}

#paging {
	width: 900px;
	height: 50px;
	line-height: 50px;
	margin-left: 265px;
}

#paginationDiv {
	margin:8px;
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

#emptySummary {
	width: 960px;
	height: 500px;
	line-height: 500px;
	text-align: center;
	margin-left: 240px;

</style>
<script>
$(document).ready(function() {
	var $body = $(".sellHistoryPage");
	$("<div>").text("판매내역").attr("id","e").appendTo($body);
	$("<div>").attr("id","ea").appendTo($body);
	$("<div class=categoryBtnMenu></div>").appendTo($body);
	$("<ul class=categoryBtn>").appendTo(".categoryBtnMenu");
	$("<li class=Btn1>").appendTo(".categoryBtn");
	$("<li class=Btn2>").appendTo(".categoryBtn");
	$("<a>").text("구매내역").attr("href", "/fontExample/buy_history").appendTo(".Btn1");
	$("<a>").text("판매내역").attr("href", "/fontExample/sell_history").appendTo(".Btn2");
	
	function printList(page) {
		var $body = $(".sellList_item");
		$.each(page.summarys, function(idx, sm) {
			var $sellListItem = $("<div>").attr("class","sellList_item").appendTo($body);
			var $sellInformation = $("<div>").attr("class","sellInformation").appendTo($sellListItem);
			var $sellDate = $("<div>").attr("class","sellDate").appendTo($sellInformation);
			var $tradeDate = $("<p>").text("거래날짜 : ").appendTo($sellDate);
			// 거래날짜
			$("<span>").text(sm.checkDate).attr("class","tradeDate").appendTo($tradeDate);
			var $sellOrderCheckbox = $("<div>").attr("class","sellOrderCheckbox").appendTo($sellInformation);
			// 체크박스
			$("<input>").attr("type","checkbox").attr("class","sno").val(sm.no).appendTo($sellOrderCheckbox);
			
			var $sellOrderInfomation = $("<div>").attr("class","sellOrderInfomation").appendTo($sellInformation);
			var $orderImage = $("<div>").attr("class","orderImage").appendTo($sellOrderInfomation);
			// 이미지
			$("<img>").attr("src",sm.image).attr("width","150px").attr("alt","상품이미지").appendTo($orderImage).css({"width":"150px","height":"150px","cursor":"pointer"}).on("click",function() {
				location.href="http://localhost:8081/fontExample/readProduct?pageno="+sm.no
			});
			var $orderText = $("<div>").attr("class","orderText").appendTo($sellOrderInfomation);
			// 제품명
			$("<p>").text(sm.name).attr("class","orderTextTitle").appendTo($orderText).css("cursor","pointer").on("click",function() {
				location.href="http://localhost:8081/fontExample/readProduct?pageno="+sm.no
			});
			var $orderProductInfo = $("<p>").appendTo($orderText);
			// 가격
			$("<span>").text(sm.price + "원 /").appendTo($orderProductInfo);
			// 판매자
			$("<span>").text("구매자 : " + sm.sellerUsername).appendTo($orderProductInfo).css("cursor","pointer").on("click",function() {
				location.href="http://localhost:8081/fontExample/sellReviewPage?no="+sm.no
			});
			var $orderTotalStatus = $("<div>").attr("class","orderTotalStatus").appendTo($sellInformation);
			var $orderStatusMessage = $("<div>").attr("class","orderStatusMessage").appendTo($orderTotalStatus);
			// 거래상태
			if(sm.method==1) {
				$("<p>").text("거래완료").appendTo($orderStatusMessage);
			} else {
				$("<p>").text("거래중").appendTo($orderStatusMessage);				
			}
			var $orderBtn = $("<div>").attr("class","orderBtn").appendTo($orderTotalStatus);
			$("<button>").attr("id","reviewBtn").text("리뷰 보기").attr("class","btn btn-default")
				.on("click",function() {
					location.href="/fontExample/sellReviewPage?seller="+sm.sellerUsername; // 넘어갈 때 유저정보를 들고가야함
				}).appendTo($orderBtn);
		});
		
		if($body.children().length == 0) {
			$("<div>").text("내역이 존재하지 않습니다.").attr("id","emptySummary").appendTo($body);
			$("#checkAll").attr("disabled","true");
			$("#deleteBtn").attr("disabled","true");
		}
	}
	
	function printPage(page) {
		var $ul = $("<ul>").attr("id","paginationDiv").attr("class", "pagination").appendTo($("#paging"));
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
					"/fontExample/sell_history?pageno=" + (startPage - 1)).text(
					"앞으로").appendTo($li);
		}
		for (var i = startPage; i <= endPage; i++) {
			if (i == page.pageno) {
				var $li = $("<li>").attr("class", "active").appendTo($ul);
				$("<a>").attr("href", "/fontExample/sell_history?pageno=" + i)
						.text(i).appendTo($li);
			} else {
				var $li = $("<li>").appendTo($ul);
				$("<a>").attr("href", "/fontExample/sell_history?pageno=" + i)
						.text(i).appendTo($li);
			}
		}

		if (endPage < cntOfPage) {
			var $li = $("<li>").attr("class", "next").appendTo($ul);
			$("<a>").attr("href",
					"/fontExample/sell_history?pageno=" + (endPage + 1)).text(
					"다음으로").appendTo($li);
		}
	}

	
	$(function() {
		$.ajax({
			url : "/fontExample/api/sell_historys",
			method : "get",
			data : location.search.substr(1),
			success : function(result) {
				printList(result);
				printPage(result);
			}
		});
		
		$("#checkAll").on("click", function() {
			if($(".sno").is(":checked")==true) {
				$(".sno").prop("checked",false);
			} else if($(".sno").is(":checked")==false) {
				$(".sno").prop("checked",true);
			}
		})

		$("#deleteBtn").on("click",function(){
			if(confirm("삭제하시겠습니까?")==true) {
				var ar = [];
				$(".sno").each(function(idx){
					if($(this).prop("checked")){
						ar.push($(this).val());
					}
				})
				console.log(ar);
				if(ar.length==0) {
					alert("내역을 선택해주세요");
					return;					
				}
				var params = {
						json:JSON.stringify(ar),
				}
				$.ajax({
					url:"/fontExample/api/deleteHistory",
					method:"post",
					data:params,
					success:function(result){
						location.reload();
					}
				})
				
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
    <div class="sellHistoryPage">
    </div>
	<div class="sellList_item">
	</div>
	<div class="deleteBtnDiv">
		<button id="checkAll" class="btn btn-info">전체 선택</button>
		<button id="deleteBtn" class="btn btn-danger">삭제</button>
	</div>
	<div id="paging" style="text-align: center;">
   	</div>
</body>
</html>
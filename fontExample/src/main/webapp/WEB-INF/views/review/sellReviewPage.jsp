<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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


#myreviewW {
	overflow : hidden;
}

#MRmain {
	width : 960px;
	float : right;
}

        #frequently1 {
            width: 100%;
            height: 40px;
            background-color: white;
            border-top : 2px solid black;
            border-left : none;
            border-right : none;
            border-bottom : none;
            margin-bottom : 10px;
        }
        #frequently2 {
            width: 100%;
            height: 40px;
            background-color: white;
            border-top : 2px solid black;
            border-left : none;
            border-right : none;
            border-bottom : none;
            margin-bottom : 10px;
        }
        #frequently3 {
            width: 100%;
            height: 40px;
            background-color: white;
            border-top : 2px solid black;
            border-left : none;
            border-right : none;
            border-bottom : none;
            margin-bottom : 10px;
        }
        #frequently4 {
            width: 100%;
            height: 40px;
            background-color: white;
            border-top : 2px solid black;
            border-left : none;
            border-right : none;
            border-bottom : none;
            margin-bottom : 10px;
        }
        #frequently5 {
            width: 100%;
            height: 40px;
            background-color: white;
            border-top : 2px solid black;
            border-left : none;
            border-right : none;
            border-bottom : none;
            margin-bottom : 10px;
        }
        #question_mark {
            float: left;
            width : 38px;
        }
        #downarrow {
            float: right;
            margin-top: 5px;
            margin-right: 20px;
        }
        #questionName1 {
            margin-top: 8px;
            margin-left: 6px;
            float: left;
            font-size: 18px;
        }
        #questionName2 {
            margin-top: 8px;
            margin-left: 6px;
            float: left;
            font-size: 18px;
        }
        #questionName3 {
            margin-top: 8px;
            margin-left: 6px;
            float: left;
            font-size: 18px;
        }
        #questionName4 {
            margin-top: 8px;
            margin-left: 6px;
            float: left;
            font-size: 18px;
        }
        #questionName5 {
            margin-top: 8px;
            margin-left: 6px;
            float: left;
            font-size: 18px;
        }




#information_menu {
	font-family: THE행복열매;
	font-weight: bolder;
	text-align: left;
	font-size: 40px;
}

#myinfo_sidebar {
	height: 200px;
	width: 20%;
	float : left;
}

#blackBar {
	border: 1px solid black;
	text-align: left;
	width: 70%;
	margin: 5px;
}

.li_a {
	font-weight: bold;
	font-size: 15px;
	margin: 5px;
	text-align: left;
}

.li_a a {
	color: black;
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
}
</style>
<script>





	function printList(page) {
		var $body = $("#list");
		$.each(page.sellerReview, function(idx, mr) {
			var $tr = $("<tr>").appendTo($body);
			$("<td>").text(mr.no).appendTo($tr);
			var $td = $("<td>").appendTo($tr);
			$("<td>").text(mr.seller).appendTo($td);
			var $td = $("<td>").appendTo($tr);
			var $productName = $("<td>").text(mr.product).appendTo($td);
			$("<td>").text(mr.trust).appendTo($tr);
			
				var $frequentlyList =  $("<ul>").attr("id","frequentlyList").attr("class","example01").css("display","none").appendTo($td);
				var $li =  $("<li>").appendTo($frequentlyList);
				var $eachReview = $("<div>").attr("class","eachReview").appendTo($li);
				var $reviewDetail = $("<div>").attr("class","reviewDetail").appendTo($eachReview);
				var $reviewerPersonalInformation = $("<div>").attr("class","reviewerPersonalInformation").appendTo($reviewDetail);
				var $postedDate =  $("<span>").text(mr.sellerReviewDate + " ").attr("class","postedDate").appendTo($reviewerPersonalInformation);
				$("<span>").text("판매자 : ").appendTo($postedDate);
				$("<a>").attr("href","/fontExample/sellReviewPage?seller=" + mr.seller).text(mr.seller + " ").appendTo($postedDate);
				$("<span>").text("신뢰도 : " + mr.trust).attr("class","likeOrNotlike").appendTo($postedDate);
				var $nonameDiv = $("<div>").attr("id","JJDIv").appendTo($reviewDetail);
				$("<img>").attr("src", mr.picture).attr("class","productSajin").appendTo($nonameDiv);
				$("<img>").attr("src", mr.picture).attr("class","productSajin").appendTo($nonameDiv);
				$("<img>").attr("src", mr.picture).attr("class","productSajin").appendTo($nonameDiv);
				var $reviewArticle = $("<p>").attr("class","reviewArticle").appendTo($nonameDiv);
				var str = String(mr.content);
				str = str.replace(/,/g,"")
		    	$($reviewArticle).append(str);

				
		        $($tr).click(function () {
		            if ($frequentlyList.is(":visible")) {
		            	$frequentlyList.slideUp();
		            	$productName.css("font-size", "16px").css("font-weight", "normal");
		            } else {
		            	$frequentlyList.slideDown();
		            	$productName.css("font-size", "20px").css("font-weight","bold");
		            }
		        });
		})
	}
	

	function printPage(page) {
		var $ul = $("<ul>").attr("class", "pagination").appendTo($("#paging"));
		var cntOfPage = Math.floor(page.totalcount / page.pagesize);
		var sellerReivewSeller = page.sellerReview[0].seller;
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
					"/fontExample/sellReviewPage?seller=" + sellerReivewSeller + "&pageno=" + (startPage - 1)).text(
					"앞으로").appendTo($li);
		}
		for (var i = startPage; i <= endPage; i++) {
			if (i == page.pageno) {
				var $li = $("<li>").attr("class", "active").appendTo($ul);
				$("<a>").attr("href", "/fontExample/sellReviewPage?seller=" + sellerReivewSeller + "&pageno=" + i)
						.text(i).appendTo($li);
			} else {
				var $li = $("<li>").appendTo($ul);
				$("<a>").attr("href", "/fontExample/sellReviewPage?seller=" + sellerReivewSeller + "&pageno=" + i)
						.text(i).appendTo($li);
			}
		}

		if (endPage < cntOfPage) {
			var $li = $("<li>").attr("class", "next").appendTo($ul);
			$("<a>").attr("href",
					"/fontExample/sellReviewPage?seller=" + sellerReivewSeller + "&pageno=" + (endPage + 1)).text(
					"다음으로").appendTo($li);
		}
	}
	
	$(function () {
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
		

		
		var sellerName = location.search.substr(8);
		console.log(sellerName);
		var param = { seller : sellerName }
		

		$.ajax({
			url : "/fontExample/api/sellerReviews",
			method : "get",
			data : param,
			success : function(result) {
				console.log(result);
				printList(result);
				printPage(result);
				
// 				판매권한 등록 시 authorities에 ROLE_SELLER 등록 되지만
// 				seller 테이블에는 변화가 없음

// 				판매등록 시 sell, product, seller, member 테이블 조인
// 				하지만 seller에 값이 담기지 않는다.

// 				구매내역에서 리뷰 쓰기를 누르고 완료하면
// 				리뷰에서 제목이 구매내역 제목이 아니고 판매글 제목이 나온다

// 				구매확정 눌렀는데 포인트가 줄어들지 않는다

// 				고객센터 슬라이드업 다운 바꿔야댐

// 				관리자 페이지에서 결제 내역에서 결제 했는데 안나옴
			}
		});
		
		
		var sellerNameRaw = location.search.substring(8).split('&');
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
</script>
</head>
<body>

	<div id="topSellerInfo">
	</div>
		<div>
			<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" />
		</div>
	<div id="MRmain">
		<div id="e">SELLER REVIEW</div>
		<div id="ea"></div>
		<table class="table table-hover">
			<colgroup>
				<col width="10%">
				<col width="20%">
				<col width="60%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>리뷰번호</th>
					<th>판매자</th>
					<th>제품명</th>
					<th>신뢰도</th>
				</tr>
			</thead>
			<tbody id="list">
			</tbody>
		</table>
		<div id="paging" style="text-align: center;"></div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>제품목록조회(게시판형)</title>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        #pBarmain {
            margin: auto;
            border-collapse: collapse;
            width: 100%;
            text-align : left;
        }
        #tagA {
            margin-bottom:30px;
            margin-top:30px;
        }
		#tagB {
            border-bottom:1px solid #999999;
            padding-bottom:20px;
		}
		#tagC {
			padding-top:20px;
		}
        #largeCate ul {
        	margin:0;
        }
        #tagB div:first-child {
        	text-align: center;
        	vertical-align:top;
        	width: 12.5%;
        	height: 60px;
        	display: inline-block;
		}
		#tagC div:first-child {
        	text-align: center;
        	vertical-align:top;
        	width: 12.5%;
        	height: 120px;
        	display: inline-block;
		}
        #largeCate {
        	width: 87.5%;
        	display: inline-block;
        }
        #smallCate {
        	width: 87.5%;
        	display: inline-block;
        }
        #largeCate ul li {
        	width: 150px;
        }
        #smallCate ul li {
        	width: 150px;
        }
        .largeDiv {
        	margin-top:5px;
        	margin-bottom:5px;
        	display:inline-block;
        }
		.smallDiv {
        	margin-top:5px;
        	margin-bottom:5px;
        	display:inline-block;
        }
		#smallCateUl {
			margin:0;
		}
        #sellArticle {
            border-bottom: 2px solid black;
            border-top : 2px solid black;
            font-size : 30px;
        }
        .innerBox {
            display: inline-block;
            border-collapse: collapse;
            width: 200px;
            height: 280px;
            margin-left: 10px;
            margin-right: 10px;
            margin-top: 15px;
        }
        #changeBoard {
            position: relative;
            bottom : 40px;
            left : 1100px;
            display: inline-block;
        }
        table {
            width : 100%;
        }
        th {
            border-bottom : 1px solid black;
            padding-bottom : 3px;
            padding-top : 3px;
        }
        td {
            padding-top : 5px;
            padding-bottom : 5px;
        }
        table, tr, th, td {
            text-align: center;
        }
		#bottomPaging {
		   width: 100%;
		   text-align: center;
		   height: 100px;
		   border-top: 2px solid black;
		}
		 #pagination {
		   margin: 0;
		   left: 1087px;
		   margin-top: 35px;
		}
		#sellArticleOuter {
		   height : 46px;
		}
        .productDetail {
            width: 200px;
            display: inline-block;
            padding-left: 10px;
        }
        .productUl {
        	display: inline-block;
        }
        .productTitle {
            font-weight: bold;
            font-size: 14px;
        }
        .productPrice {
            font-size: 12px;
        }
        .productDate {
            padding-top: 5px;
            font-size: 12px;
        }
        .productState {
            padding-top: 8px;
            font-weight: bold;
        }
        .largeLink {
        	color:#999999;
        }
        .largeLink:hover {
        	color:#000000;
        	text-decoration: none;
        }
        .SmallDiv {
        	display: inline-block;
        }
        .smallLink {
        	color:#999999;
        	cursor:pointer;
        }
        .smallLink:hover {
        	color:#000000;
			text-decoration: none;
        }
		#tagB div:first-child span {
			font-weight:bold;
			height: 30px;
			line-height: 30px;
		}
		#tagC div:first-child span {
			font-weight:bold;
			height: 30px;
			line-height: 30px;
		}
		
    </style>
<script>
var showView = "Bar";
var savePage = null;

function printLargeCate(largepage) {
	var $tagB = $("#tagB");
 	$("#largeCate").remove();
	var $largeCateName =  $("<div>").appendTo($tagB);
	var $largeCate = $("<div>").attr("id", "largeCate").appendTo($tagB);
	var $largeCateUl = $("<ul>").appendTo($largeCate);
	$("<span>").text("대분류").appendTo($largeCateName);
	$.each(largepage, function(idx, lar) {
		var $largeDiv = $("<li>").attr("class", "largeDiv").appendTo($largeCateUl);
		var $a = $("<a>").attr("class", "largeLink").attr("href","#").text(lar.name).val(lar.no).appendTo($largeDiv);
	});
	
	$(".largeLink").on("click",function(e){
		e.preventDefault();
		var $checkFunction = $(this).val();
			loadSmallByLno($(this).val());
			findProductByLarge($(this).val(),1);
	})
}
function printSmallCate(smallpage) {
	var $tagC = $("#tagC");
	$("#smallCateName").remove();
	$("#smallCate").remove();
	var $smallCateName =  $("<div>").attr("id","smallCateName").appendTo($tagC);
	var $smallCate = $("<div>").attr("id", "smallCate").appendTo($tagC);
	var $smallCateUl = $("<ul>").attr("id", "smallCateUl").appendTo($smallCate);
	$("<span>").text("소분류").appendTo($smallCateName);
	$.each(smallpage, function(idx, sma) {
		var $smallDiv = $("<li>").attr("class", "SmallDiv").appendTo($smallCateUl);
		var $a = $("<a>").attr("class","smallLink").text(sma.name).val(sma.no).appendTo($smallDiv);
	});
	$(".smallLink").on("click",function(e){
		e.preventDefault();
		var $checkFunction = $(this).val();
			findProductBySmall($(this).val());
	})
}
function printList(page) {
	savePage = page;
	var $body = $("#wholeSellArticle");
	$('table').remove('.object')
	$('ul').remove('.productUl')
	if(showView=="Bar"){
		var $table = $("<table>").attr("class","object").appendTo($body);
		var $head = $("<thead>").appendTo($table);
		$("<th>").text("번호").appendTo($head);
		$("<th>").text("사진").appendTo($head);
		$("<th>").text("제품명").appendTo($head);
		$("<th>").text("가격").appendTo($head);
		$("<th>").text("수량").appendTo($head);
		$("<th>").text("상태").appendTo($head);
		$("<th>").text("날짜").appendTo($head);
		var $inbody = $("<tbody>").appendTo($table);
		$.each(page.sell, function(idx, pro) {
			var $tr = $("<tr>").attr("id","tr").appendTo($inbody);
			$("<td>").attr("class","object").text(pro.no).appendTo($tr);
				var $td = $("<td>").attr("class","object").appendTo($tr);
				$("<img>").click(function(){
					location.href="/fontExample/readProduct?pageno=" + pro.product_no
				}).attr("class", "object").attr("src", pro.image).attr("width","200px").css("cursor","pointer").appendTo($td);
				var $td = $("<td>").attr("class","object").appendTo($tr);
				$("<a>").attr("class","object").attr("href","/fontExample/readProduct?pageno=" + pro.product_no).text(pro.name).appendTo($td);
				$("<td>").attr("class","object").text(pro.price).appendTo($tr);
				$("<td>").attr("class","object").text(pro.quantity).appendTo($tr);
				if(pro.state==1) {
					$("<td>").attr("class","object").text("거래완료").appendTo($tr);
				} else if(pro.state==0) {
					$("<td>").attr("class","object").text("거래중").appendTo($tr);
				}
				$("<td>").attr("class","object").text(pro.sell_date).appendTo($tr);
		});
	} else {
		$.each(page.sell, function(idx, pros) {
			var $productUl = $("<ul>").attr("class","productUl").appendTo($body);
			var $innerBox = $("<li>").attr("class","innerBox").appendTo($productUl);
			var $productSajin = $("<img>").click(function() {
				location.href="/fontExample/readProduct?pageno=" + pro.product_no
			}).attr("src", pros.image).attr("width","200px").css("cursor","pointer").attr("class", "productSajin").appendTo($innerBox);
			var $productDetail = $("<div>").attr("class", "productDetail").appendTo($innerBox);
			$("<a>").attr("href", "/fontExample/readProduct?pageno=" + pros.product_no).text(pros.name).attr("class", "productTitle").appendTo($productDetail);
			$("<div>").text(pros.price).attr("class", "productPrice").appendTo($productDetail);
			$("<div>").text(pros.sell_date).attr("class", "productDate").appendTo($productDetail);
			if(pros.state==1) {
				$("<div>").text("거래완료").attr("class","productState").appendTo($productDetail);
			} else if(pros.state==0) {
				$("<div>").text("거래중").attr("class","productState").appendTo($productDetail);
			}
		});
	}
}



function printPage(page,params,type) {
	$("#target").remove();
	var $ul = $("<ul>").attr("class", "pagination").attr("id","target").appendTo($("#paging"));
	var cntOfPage = Math.floor(page.totalcount / page.pagesize);
	if (page.totalcount % page.pagesize != 0)
		cntOfPage++;

	var blockSize = 5;
	var blockNo = Math.floor(page.pageno / blockSize) + 1;
	if (page.pageno % blockSize == 0)
		blockNo--;
	var startPage = (blockNo - 1) * blockSize + 1;
	var endPage = startPage + blockSize - 1;
	if (endPage > cntOfPage)
		endPage = cntOfPage;
	if (blockNo > 1) {
		var $li = $("<li>").attr("class", "previous").appendTo($ul);
		$("<a>").attr("href","#").attr("class","event").text("앞으로").val(startPage - 1).appendTo($li);
	}
	for (var i = startPage; i <= endPage; i++) {
		if (i == page.pageno) {
			var $li = $("<li>").attr("class", "active").appendTo($ul);
			$("<a>").attr("href", "#").attr("class","event").text(i).val(i).appendTo($li);
		} else {
			var $li = $("<li>").appendTo($ul);
			$("<a>").attr("href", "#").attr("class","event").text(i).val(i).appendTo($li);
		}
	}
	if (endPage < cntOfPage) {
		var $li = $("<li>").attr("class", "next").appendTo($ul);
		$("<a>").attr("href","#").attr("class","event").text("다음으로").val(endPage + 1).appendTo($li);
	}

	if(type=="all"){
		$(".event").on("click",function(e){
			e.preventDefault();
			findAllProduct($(this).val());
		})
	}else if(type=="large"){
		$(".event").on("click",function(e){
			e.preventDefault();
			findProductByLarge(params.lno,$(this).val());
		})
	}
	else if(type=="small"){
		$(".event").on("click",function(e){
			e.preventDefault();
			findProductBySmall(params.sno,$(this).val());
		})
	}
	else if(type=="name"){
		$(".event").on("click",function(e){
			e.preventDefault();
			findProductBySmall(params.pname,$(this).val());
		})
	}
}
function findAllProduct($PageNo){
	var params = {
			pageno : $PageNo,
	}
	$.ajax({
		url: "/fontExample/api/productLists",
		method: "get",
		data : params,
		success: function(result) {
			printList(result);
			printPage(result,params,"all");
		}
	});
}
function findProductByLarge($largeNo,$PageNo){
	var params = {
			lno : $largeNo,
			pageno : $PageNo,
	}
	$.ajax({
		url : "/fontExample/api/productLists/Large",
		method : "get",
		data : params,
		success : function(result){
			printList(result);
			printPage(result,params,"large");
		}
	})
}
function findProductBySmall($smallNo,$PageNo){
	var params = {
		sno : $smallNo,
		pageno : $PageNo,
	}
	$.ajax({
		url : "/fontExample/api/productLists/Small",
		method : "get",
		data : params,
		success : function(result){
			printList(result);
			printPage(result,params,"small");
		}
	})
}
function findProductByProName($Pname,$PageNo){
	var params = {
		pname : $Pname,
		pageno : $PageNo,
	}
	$.ajax({
		url : "/fontExample/api/productLists/Name",
		method : "get",
		data : params,
		success : function(result){
			printList(result);
			printPage(result,params,"name");
		}
	})
}
function loadLarge(){
	$.ajax({
		url: "/fontExample/api/categories/large",
		method : "get",
		success: function(resultlar) {
			console.log(resultlar);
			printLargeCate(resultlar);
		}
	});
}
function loadSmall(){
	$.ajax({
		url: "/fontExample/api/categories/small",
		method : "get",
		success: function(resultsma) {
			console.log(resultsma);
			printSmallCate(resultsma);
		}
	});
}
function loadSmallByLno(lno) {
	$.ajax({
		url : "/fontExample/api/categories/small/" + lno,
		method : "get",
		success : function(resultsl) {
			printSmallCate(resultsl);
		}
	});
}

$(function() {
	var Search = "${Search}"
	var category = "${category}"
	console.log(category)
	loadLarge();
	if(Search!=null){
		findProductByProName(Search,1);
		loadSmallByLno(1)
	} else if(category!=null){
		findProductByLarge(category,1);
		loadSmallByLno(category)
	} else {
		findAllProduct(1);
		loadSmall();
	}
	$("#changeBar").on("click",function(){
		showView = "Bar"
		printList(savePage);
	})
	$("#changeSquare").on("click",function(){
		showView = "Square"
		printList(savePage);
	})
})

</script>
</head>
<body>
    <div id="pBarmain">

		<div id="tagA">
			<div id="tagB">
			</div>
			<div id="tagC">
			</div>
		</div>
        <div id="sellArticleOuter">
            <div id="sellArticle">판매글</div>
                <div id="changeBoard">
					<button type="button" class="btn btn-default" id="changeBar">
						<i class="glyphicon glyphicon-th-list"></i>
					</button>
					<button type="button" class="btn btn-default" id="changeSquare">
						<i class="glyphicon glyphicon-th"></i>
					</button>
                </div>
        </div>
        <div id="wholeSellArticle">
        </div>
		<div id="paging" style="text-align: center;"></div>
    </div>
</body>
</html>
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
<title>Insert title here</title>
<style>
#remoteMain {
	width: 100px;
	height: 480px;
	position: fixed;
	right: 50%;
	top: 180px;
	margin-right: -720px;
	text-align: center;
}

.remoteImg {
	width: 80px;
	height: 80px;
	padding: 5px;
}

#likeBtn {
	text-align: center;
/* 	background-color: #ffb6c1; */
	border : 1px solid rgb(102, 102, 102);
	height : 35px;
	line-height: 35px;
	margin-bottom : 7px;
}
#likeBtnA {
	color : rgb(102, 102, 102);
	font-weight: bold;
	text-decoration: none;
}

#remoteImg {
	text-align:center;
	height: 260px;
	border-left : 1px solid rgb(204, 204, 204);
	border-right : 1px solid rgb(204, 204, 204);
	border-bottom : 1px solid rgb(204, 204, 204); 
}
#relaPro {
	border : 1px solid rgb(204, 204, 204);
	height : 35px;
	line-height: 35px;
}
#remoteTop {
	border : 1px solid rgb(102, 102, 102);
	height : 35px;
	line-height: 35px;
	margin-top : 7px;
}
#remoteTopA {
	color : rgb(102, 102, 102);
	font-weight: bold;
	text-decoration: none;
}
#relaProDiv {
	font-weight: bold;
	color : rgb(102, 102, 102);
}
</style>
<script>
function printRelatedProduct(result) {
	var $body = $("#remoteImg");
	var linkNo = parseInt(location.search.substr(8));
	$.each(result, function(idx, rp) {
		if(linkNo!==rp.no) {
			$("<img>").attr("src",rp.image).attr("class","remoteImg").css("cursor","pointer").appendTo($body).on("click",function() {
				location.href="http://localhost:8081/fontExample/readProduct?pageno="+rp.no;
			});			
		}
	})
	if($body.children().length == 0) {
		for(i=1; i<4; i++) {
			$("<img>").attr("src","resources/productNotReady.jpg").css({"width":"80px","height":"80px"}).appendTo($body);			
		}
	}
}

$(function() {
	var linkNo = location.search.substr(8);
	var test = parseInt(linkNo);
	var test2 = typeof test;
	if(isNaN(test)) {
		var param = {
			no:0
		};
	} else if(test2=='number'){
		var param = {
			no:test
		}
	}
	$.ajax({
		url: "/fontExample/api/relatedProducts",
		dataType: "json",
		method: "get",
		data: param,
		success:function(result) {
 			printRelatedProduct(result);
		}
	})
})
</script>
</head>
<body>
	<div id="remoteMain">
		<div id="likeBtn">
			<a id="likeBtnA" href="/fontExample/favorites">즐겨찾기</a>
		</div>
		<div id="relaPro">
			<div id="relaProDiv">연관 상품</div>
		</div>
		<div id="remoteImg">
			
		</div>
		<div id="remoteTop">
			<a id="remoteTopA" href="#page">▲T O P</a>
		</div>
	</div>
</body>
</html>
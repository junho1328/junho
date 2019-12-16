<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
function printTag(tags) {
	var $tagUl = $("#menubarUl");
	$.each(tags, function(idx, tag) {
		var $li = $("<li>").attr("class","hotTag").appendTo($tagUl);
		$("<a>").text("#"+tag.name).attr("href","#").appendTo($li);
	})
}

function printLargeCate2(largeCate2) {
	$menubarLi1 = $("#menubarLi1");
	$menubarUl2 = $("<ul>").attr("id","menubarUl2").appendTo($menubarLi1);
	$.each(largeCate2, function(idx, cate) {
		$li = $("<li>").appendTo($menubarUl2);
		$("<a>").text(cate.name).attr("href","http://localhost:8081/fontExample/productList?category="+cate.no).appendTo($li);
	})
}


$(function() {
	// 인기태그 불러오는 ajax
	$.ajax({
		url: "/fontExample/api/findHotTag",
		method: "get",
		success:function(result) {
			printTag(result);
		}
	})
	
	// large_category 불러오는 ajax
	$.ajax({
		url: "/fontExample/api/categories/large",
		method:"get",
		success: function(result) {
			printLargeCate2(result);
		}
	})
	
	$("#menubarA").mouseover(function() {
		$("#menubarUl2").slideDown(200);
		$("#menubarA").css("background-color","#FFF1F2");
	});
	$("#menubarLi1").mouseleave(function() {
		$("#menubarUl2").slideUp(200);
		$("#menubarA").css("background-color","#FFE3EB");
	})
})
</script>
<style>
.menubar {
	border: none;
	margin: 0px;
	padding: 0px;
/* 	font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans", */
/* 		"Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica, */
/* 		sans-serif; */
	font-size: 15px;
	font-weight: bold;
	color: black;
}

.menubar ul {
	height: 50px;
	list-style: none;
	margin: 0;
	padding: 0;
}

.menubar li {
	float: left;
	padding: 0px;
}

.menubar li a {
	color: #000000;
	display: block;
	font-weight: normal;
	line-height: 50px;
	margin: 0px;
	padding: 0px 25px;
	text-align: center;
	text-decoration: none;
}

.menubar li a:hover, .menubar ul li:hover a {
	text-decoration: none;
}

.menubar li ul {
	display: none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
	height: auto;
	padding: 0px;
	margin: 0px;
	border: 0px;
  	position: absolute;
	width: 225px;
	z-index: 200;
	/*top:1em;
/*left:0;*/
}

.menubar li:hover ul {
/*  	display: block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}

.menubar li li {
	background-color: #FFFFFF;
	display: block;
	float: none;
	margin: 0px;
	padding: 0px;
	width: 225px;
}

.menubar li ul a {
	display: block;
	color: black;
	height: 50px;
	font-size: 15px;
	font-style: normal;
	margin: 0px;
	padding: 0px 10px 0px 15px;
	text-align: left;
   	background-color:#FFF1F2;
	border-bottom:1px solid #FFF;
	border-top:1px solid #FFF;
	border-right:1px solid #FFF;
}

.menubar li ul a:hover, .menubar li ul li:hover a {
	text-decoration: none;
}

.menubar p {
	clear: left;
}

#nav2_page {
  	border-left:none;
	margin-bottom: 0px;
	background-color:#FFE3EB;
}
.hotTag{
	font-size: 12px;
}
#menubarUl2 li:first-child {
	border-top:1px solid #DDDDDD;
}
</style>
</head>
<body>
	<nav id="nav2_page" class="navbar navbar-default">
		<div class="container-fluid">
		</div>
		<div class="navbar-header">
			<div class="menubar">
				<ul id="menubarUl">
					<li id="menubarLi1">
						<a href="#" id="menubarA" class="dropdown-toggle"><img src="resources/menuicon.png" height="25px">전체 카테고리</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>
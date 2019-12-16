<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        #main {
            overflow: hidden;
            margin: auto;
            border-collapse: collapse;
            width: 900px;
            text-align : left;
        }
        #tagA {
            overflow: hidden;
            text-align : center;
        }
        #tagB {
            width: 100px;
            float: left;
        }
        #tagC {
        	margin-top : 20px;
        	margin-bottom : 10px;
        }

        #largeCate {
            width: 150px;
            float: left;
        }
        
        .largeDiv {
            padding-left : 15px;
            padding-top : 10px;
        }

        #smallCate {
            width: 490px;
            float: left;
        }

		#smallCateUl li {
        	display : inline-block;
            width: 140px;
            margin : 0;
        }
</style>
<script>
	$(document).ready(function() {
		$("#largeCate a").click(function(e) {
			e.preventDefault();
			var largeCate = $(this).attr("title");
			$("#smallCate li").hide();
			if (largeCate == "all") {
				$("#smallCate li").fadeIn();
			} else {
				$("#smallCate li[class*=" + largeCate + "]").fadeIn();
			}
		});
	});
	
</script>
</head>
<body>
	<div id="main">
	
		<div id="tagA">
			<div id="tagB">
				<h3 id="tagC">태그</h3>
			</div>
			<div id="largeCate">
				<ul>
					<li class="largeDiv"><a href="#" title="all">전체상품</a></li>
					<li class="largeDiv"><a href="#" title="eco">의류</a></li>
					<li class="largeDiv"><a href="#" title="soc">가전제품</a></li>
					<li class="largeDiv"><a href="#" title="star">생활용품</a></li>
					<li class="largeDiv"><a href="#" title="sports">악세서리</a></li>
				</ul>
			</div>
			<div id="smallCate">
				<ul id="smallCateUl">
					<li class="eco"><a href="/fontExample/api/categories/large" >의류 1</a></li>
					<li class="eco"><a href="/fontExample/api/categories/small?lno=1">의류 2</a></li>
					<li class="eco"><a href="/fontExample/api/productLists">의류 3</a></li>
					<li class="eco"><a href="#">의류 4</a></li>
					<li class="eco"><a href="#">의류 5</a></li>
					<li class="eco"><a href="#">의류 6</a></li>
					<li class="eco"><a href="#">의류 7</a></li>
					<li class="sports"><a href="#">악세서리 1</a></li>
					<li class="sports"><a href="#">악세서리 2</a></li>
					<li class="sports"><a href="#">악세서리 3</a></li>
					<li class="star"><a href="#">생활용품 1</a></li>
					<li class="soc"><a href="#">가전제품 1</a></li>
					<li class="soc"><a href="#">가전제품 2</a></li>
					<li class="soc"><a href="#">가전제품 3</a></li>
				</ul>
			</div>
		</div>
		
	</div>
</body>
</html>
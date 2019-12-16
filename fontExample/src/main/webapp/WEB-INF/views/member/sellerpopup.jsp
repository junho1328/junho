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
<script>
function printSeller(seller){
	$("#sellerimgpop").attr("src", seller.image);
	$("#sellerName").text(seller.name);
	$("#sellerUsername").text(seller.username);
	$("#sellercount").text(seller.count);
}

function printtrust(member){
	$("#membertrust").text(member.trust);
}

$(function(){
	var seller;
	no = location.search.split("=");
	console.log(no);
	$.ajax({
		url: "/fontExample/api/sellerpopup/" + no[1],
		method: "get",
		success: function(result) {
			printSeller(result);
			printtrust(result);
		}
	});
})
</script>
<style>
	*{
		margin: 0 auto;
		padding: 0;
	}
	#sellerimgpop{
		width: 200px;
		height: 200px;
	}
</style>
</head>
<body>
	<div>
		<h2>판매자 정보</h2>
		<div>
			<ul id="">
					<li><img src="" id="sellerimgpop" style=""></li><br>
					<li>스　토　어　명　:　<span id="sellerName"></span></li><br>
					<li>판　　매　　자　:　<span id="sellerUsername"></span></li><br>
					<li>신　　뢰　　도　:　<span id="membertrust"></span></li><br>
					<li>판　매　횟　수　:　<span id="sellercount"></span></li>
				</ul>
		</div>
	</div>
</body>
</html>
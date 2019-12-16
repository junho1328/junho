<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> -->

<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	var username = location.search.substr(1);
	$("#findId").text(username);
})

</script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#main #page {
	width: 570px;
	height: 470px;
	margin: auto;
	margin-top: 3em;
	margin-bottom: 15px;
	padding: 60px;
	background-color: white;
}

#main h2 {
	margin-top: 0;
	margin-bottom: 20px;
}

#main input {
	height: 50px;
	border: none;
}

#main #orderAuthBtn {
	width: 24%;
	display: inline-block;
}

#main .border-bottom {
	border-bottom: 1px solid black;
	margin-bottom: 10px;
}

#main .inputSizeWithBtn {
	width: 74%;
}

#main #textArea {
	margin-bottom: 30px;
}

#main button {
	width: 25%;
}

#main #submit {
	width: 100%;
	height: 50px;
	margin-top: 80px;
}
</style>
</head>
<body>
	<div id="main">
		<div id="page">
			<div id="textArea">
				<h2>아이디 찾기</h2>
				<br>
				<div>
					<p>가입하신 아이디 : </p>
					<p id="findId"></p>
				</div>
			</div>
			<a href="/fontExample/login"><button id="submit"
					class="btn btn-default">로그인 화면으로 이동</button></a>
		</div>
	</div>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<sec:authorize access="isAuthenticated()">                          <!--  로그인 했을 때 실행  -->
   <sec:authentication property="principal.username" var="user3" /> <!-- principal 로그인 되어 있는 정보  -->
</sec:authorize>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
var loginId = '${user3}'
	var wsocket;
	$(function(){
		// 연결버튼 누르면 서버측 웹소켓에 연결
		$("#connect").on("click",function(){
			wsocket = new WebSocket("ws://localhost:8081/fontExample/talked");
			wsocket.onopen = function(){
				console.log(wsocket)
				alert("서버에 연결이 되었습니다.");
			}
			wsocket.onclose = function(){
				alert("서버와 연결이 종료되었습니다");
			}
			wsocket.onmessage = function(result){
				$("#chatArea").append(result.data + "<br>");
			}
		});
		// talk 텍스트 상자에 키보드로 입력했을 때 , event객체는 자바스크립트가 알아서 생성
		$("#talk").on("keypress", function(e){
			if(e.keyCode==13){
				var msg = $("#talk").val();
				wsocket.send(loginId+msg);
				$("#talk").val("");
			}
		});
		
	});
</script>
<style>
#chatArea {
	width: 200px;
	height: 200px;
	overflow: auto;
	border: 1px solid black;
}
</style>
</head>
<body>
	<button id="connect">연결</button>
	<button id="close">종료</button>
	<div id="chatArea"></div>
	<input type="text" id="talk">
</body>
</html>
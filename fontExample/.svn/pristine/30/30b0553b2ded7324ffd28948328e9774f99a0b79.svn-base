<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
<script src="/fontExample/ckeditor/ckeditor.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<sec:authorize access="isAuthenticated()">
	<!--  로그인 했을 때 실행  -->
	<sec:authentication property="principal.username" var="user" />
	<!-- principal 로그인 되어 있는 정보  -->
</sec:authorize>
<title>사이트 문의 답변</title>
<script type="text/javascript">
	$(function() {
			$("#AnswerText").hide(); // .hide(); 선택요소를 사라지게 만든 메소드
			$("#insertAnswer").hide();
			inquiryAnswer();
			$("#answerBtn").on("click", function(){
				$("#AnswerText").show(); // .show(); 보이게 해주는 메소드
				$("#insertAnswer").show();
				$("#answerBtn").hide();
				$("#inquiryAnswer").text("");
				$("#answerBtn").attr("id", "insertAnser");
			})
			$("#insertAnswer").on("click", function(){
				insertAnswer();
			})
	})
	function inquiryAnswer(){
		$("#answerBtn").text("답변달기");
		$.ajax({
			url : "/fontExample/api/inquiryAnswer",
			data: "no" + location.search.substr(3),
			method : "get",
			success : function(result, xhr) {
				printAnswer(result.answer);
			},
			error : function(xhr) {
				console.log(xhr.status);
			}
		});
	}
	function printAnswer(answer){
		if(answer == null){
			$("#inquiryAnswer").text("아직 답변이 없습니다. 조금만 기다려주세요");
		}else{
			comma(answer)
		}
	}
	function comma(str){
		str = String(str);
		str = str.replace(/,/g,"")
	    $("#inquiryAnswer").append(str);
	}
	function insertAnswer(){
		var no = location.search.substr(4);
		var formData = new FormData(document.getElementById("answerForm"));
		formData.append("answer", CKEDITOR.instances['answerContent'].getData());
		formData.append("no", no);
		//formData.append("username", loginId );
		$.ajax({
			url : "/fontExample/api/inquiry_answerInsert",
			method : "post",
			contentType: false,
			processData: false,
			data : formData,
			success : function(result) {
				location.href = "/fontExample/inquiry_read?no=" + result
				console.log(result);
			},
			error : function(xhr) {
				alert("xhr.status")
				alert("xhr.responseText")
				console.log("에러 코드 :" + xhr.status);
				console.log("에러 메시지 :" + xhr.responseText);
			}
		})
	}
</script>
<style type="text/css">
#details {
	padding-top: 30%;
}

#summary {
	font-family: monospace;
	padding: 10px;
	border-top: 3px solid #e1e1e1e1;
	text-align: left;
	font-weight: bolder;
	font-size: 20px;
}

#answer {
	border: 3px solid #e1e1e1e1;
}
</style>
</head>
<body>
	<div>
			<div id="details">
				<div id="summary">문의 답변</div>
				<input type="hidden" id="iaNo" name="no">
				<div id="inquiryAnswer"></div>
			</div>
			<div id="AnswerText">
				<form id="answerForm">
				<textarea name="answerContent" id="answerContent"></textarea> 
				<script>
					CKEDITOR.replace('answerContent');
				</script>
				</form>
			</div>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button id="answerBtn" class="btnGroups"></button>
					<button id="insertAnswer" class="btnGroups">작성완료</button>
				</sec:authorize>
	</div>
</body>
</html>
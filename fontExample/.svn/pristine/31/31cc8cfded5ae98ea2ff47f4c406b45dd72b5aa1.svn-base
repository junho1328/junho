<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<sec:authorize access="isAuthenticated()">                          <!--  로그인 했을 때 실행  -->
   <sec:authentication property="principal.username" var="user" /> <!-- principal 로그인 되어 있는 정보  -->
</sec:authorize>
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		$("#notice_enrollment_btn").on("click", function(){
			var formData = new FormData(document.getElementById("notice_info"));
			formData.append("content", CKEDITOR.instances['content'].getData());
			//formData.append("username", loginId );
			$.ajax({
				url : "/fontExample/api/noticeInsert",
				method : "post",
				contentType: false,
				processData: false,
				data : formData,
				success : function(result) {
					location.href = "/fontExample/notice_read?no=" + result
				},
				error : function(xhr) {
					alert("xhr.status")
					alert("xhr.responseText")
					console.log("에러 코드 :" + xhr.status);
					console.log("에러 메시지 :" + xhr.responseText);
				}
			})
		})
	})

</script>
<style>
* {
	margin: 0 auto;
	padding: 0;
	
}
#notice_enrollment_main {
	width: 820px;
}

#notice_title{
	font-family: THE행복열매;
	font-weight: bolder;
	text-align: left;
	font-size: 25px;
}

#notice_enrollment_info {
	text-align: left;
	padding: 20px;
	height: 100%;
	background-color: rgb(255, 227, 235);
}

.label1 {
	width: 80%;
	height: 25px;
}

.labelpad {
	width: 15%;
}

#content {
	width: 95%;
	height: 510px;
}

#border {
	border: 1px solid black;
	text-align: left;
	margin: 5px;
}

#notice_enrollment_btn {
	width: 115px;
	border-radius: 5px;
	background-color: rgb(255, 182, 193);
	color: white;
	height: 30px;
	font-weight: bold;
	border: none;
}
#btnGroup{
	text-align: right;
}
</style>
</head>
<body>
	<div>
		<div id="notice_enrollment_main">
			<div id="notice_title">공지사항</div>
			<div id="border"></div>
			<div id="notice_enrollment_info">
				<form id="notice_info">
					<div>
						<label class="labelpad">제목: </label> 
						<input type="text" class="label1" name="title" id="title">
					</div>
					<div>
						<label class="labelpad">상세 정보</label> 
						<br> 
						<textarea name="content" id="content"></textarea> 
						<script>
							CKEDITOR.replace('content');
						</script>
					</div>
				</form>
				<div id="btnGroup">
					<button id="notice_enrollment_btn">작성 완료</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
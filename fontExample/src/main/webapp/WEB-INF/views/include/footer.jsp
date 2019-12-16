<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document)
			.ready(
					function() {
						$("#termsOfUse")
								.click(
										function() {
											var url = "termsOfUse";
											var name = "이용약관";
											var option = "width = 620, height = 600, top = 100, left = 200, location = no";
											window.open(url, name, option);
										});
						$("#privacyPolicy")
						.click(
								function() {
									var url = "privacyPolicy";
									var name = "개인정보처리방침";
									var option = "width = 620, height = 600, top = 100, left = 200, location = no";
									window.open(url, name, option);
								});
						$("#business")
						.click(
								function() {
									var url = "business";
									var name = "사업자정보확인";
									var option = "width = 620, height = 600, top = 100, left = 200, location = no";
									window.open(url, name, option);
								});
						$("#operationPolicy")
						.click(
								function() {
									var url = "operationPolicy";
									var name = "운영정책";
									var option = "width = 620, height = 600, top = 100, left = 200, location = no";
									window.open(url, name, option);
								});
					});
</script>
<style>
#footer {
	margin-top:100px;
	margin-bottom:50px;
	text-align: center;
}

#footer_menu {
	display: inline-block;
	
}
#footer_menu a{
	color: black;
}
</style>
</head>
<body>
	<div id="footer" class="container-fluid">
		<div id="footer_menu">
			<a href="" id="termsOfUse">이용약관</a>&nbsp; &nbsp;&nbsp;&nbsp;
			<a href="" id="operationPolicy">운영정책</a>&nbsp; &nbsp;&nbsp;&nbsp;
			<a href="" id="business">사업자정보확인</a> &nbsp;&nbsp;&nbsp;&nbsp;
			<a href="" id="privacyPolicy">개인정보처리방침</a>
		</div>
		<h5 class="white-text">copyright &copy; 2019 ICIA 4982</h5>
	</div>
</body>
</html>
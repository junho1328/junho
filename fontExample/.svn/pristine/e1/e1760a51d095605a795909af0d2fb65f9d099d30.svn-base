<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title> 회원 관리 페이지</title>
<sec:authorize access="isAuthenticated()">                          <!--  로그인 했을 때 실행  -->
	<sec:authentication property="principal.username" var="user" /> <!-- principal 로그인 되어 있는 정보  -->
</sec:authorize>
<style>
#a {
	float: right;
	width: 80%;
	height: 100%;
}

#b {
	font-family: THE행복열매;
	font-weight: bolder;
	text-align: left;
	font-size: 40px;
}

#c {
	border: 1px solid black;
	text-align: left;
	width: 100%;
	margin: 5px;
}
</style>
<script>
	function printList(result){
		var username = '${user}';
		// 테이블의 <tbody>를 선택한다
		var $body = $("#list");
		$.each(result, function(idx, mem) {
			var $tr = $("<tr>").appendTo($body);
			$("<td>").text(mem.name).appendTo($tr)
			$("<td>").text(mem.username).appendTo($tr)
			$("<td>").text(mem.authority).appendTo($tr)
			$("<td>").text(mem.point).appendTo($tr)
			$("<td>").text(mem.count).appendTo($tr)
			$("<td>").text(mem.block).appendTo($tr)
		});	
	}
	function printPage(result){
		var $ul = $("<ul>").attr("class", "pagination").appendTo($("#paging"));
		var cntOfPage = Math.floor(page.totalcount / page.pagesize);
		if (page.totalcount % page.pagesize != 0)
			cntOfPage++;
		

		var blockSize = 5;
		var blockNo = Math.floor(page.pageno / blockSize) + 1;
		// page.pageno가 blockSize의 배수인 경우 (위에서 pageno가 5, 10, 15) blockNo 감소
		if (page.pageno % blockSize == 0)
			blockNo--;
		var startPage = (blockNo - 1) * blockSize + 1;
		var endPage = startPage + blockSize - 1;
		if (endPage > cntOfPage)
			endPage = cntOfPage;
		
		if (blockNo > 1) {
			var $li = $("<li>").attr("class", "previous").appendTo($ul);
			$("<a>").attr("href",
					"/fontExample/membermanagement?pageno=" + (startPage - 1)).text(
					"앞으로").appendTo($li);
		}
		for (var i = startPage; i <= endPage; i++) {
			if (i == page.pageno) {
				var $li = $("<li>").attr("class", "active").appendTo($ul);
				$("<a>").attr("href", "/fontExample/membermanagement?pageno=" + i)
						.text(i).appendTo($li);
			} else {
				var $li = $("<li>").appendTo($ul);
				$("<a>").attr("href", "/fontExample/membermanagement?pageno=" + i)
						.text(i).appendTo($li);
			}
		}

		if (endPage < cntOfPage) {
			var $li = $("<li>").attr("class", "next").appendTo($ul);
			$("<a>").attr("href",
					"/fontExample/membermanagement?pageno=" + (endPage + 1)).text(
					"다음으로").appendTo($li);
		}
	}
	$(function() {
		$.ajax({
			url : "/fontExample/api/memberManagement",
			method : "get",
			data : location.search.substr(1),
			success : function(result, status, xhr) {
				console.log(result);
				printList(result);
				printPage(result);
			}
		});
	});
</script>
</head>
<body>
	<div>
		<div>
			<jsp:include page="/WEB-INF/views/management/managementpage.jsp" />
		</div>
		<div id="a">
			<div id="b"> 회원 관리 페이지 </div>
			<div id="c"></div>
	<table class="table table">
					<thead>
					<tr>
						<th>이름</th>
						<th>아이디</th>
						<th>권한</th>
						<th>포인트</th>
						<th>거래횟수</th>
						<th>정지여부</th>
					</tr>
				</thead>
				<tbody id="list">
				</tbody>		
	</table>
	</div>
	</div>
</body>
</html>
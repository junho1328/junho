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
<title>사이트 문의 페이지</title>
<sec:authorize access="isAuthenticated()">                          <!--  로그인 했을 때 실행  -->
	<sec:authentication property="principal.username" var="user" /> <!-- principal 로그인 되어 있는 정보  -->
</sec:authorize>
<style>
#a {
	float: right;
	width: 80%;
	height: 100%;
	/* 	margin-top: 30px;
	width: 820px;
	height: 1000px; */
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

/* .li_a {
	color: black;
	font-weight: bold;
	font-size: 15px;
	margin: 5px;
	text-align: left;
} */

.table th, #list {
	text-align: center;
	font-weight: bold;
}

.check_delete {
    width: 90px;
    height: 30px;
    border-radius: 5px;
    background-color: #ffb6c1;
    color: white;
    border: none;
}

</style>
<script>
	function printList(result) {
		var username = '${user}';
		var $body = $("#list");
		$.each(result.inquiryPage, function(idx, mr) {
			var $tr = $("<tr>").appendTo($body);
			$("<td>").attr("class", "mr.no").text(mr.no).appendTo($tr);
			$("<td>").text(mr.username).appendTo($tr);
			$("<td>").text(mr.type_no).appendTo($tr);
			var $td = $("<td>").appendTo($tr);
			$("<a>").text(mr.title).attr("href","/fontExample/inquiry_read?no=" + mr.no).appendTo($td);
			$("<td>").text(mr.process).appendTo($tr);
			$("<button>").attr("type", "button").text("delete").attr("class",
					"check_delete").attr('data-no', mr.no).appendTo($tr);
		});
		$(".check_delete").on("click", function() {
			if (confirm("삭제하시겠습니까?") == true) {
				var no = $(this).attr('data-no');
				var param = {
					no : no,
					_method : "delete",
				};
				$.ajax({
					url : "/fontExample/api/inquiryDelete",
					method : "post",
					data : param,
					success : function(result) {
						location.href = "/fontExample/inquiry";
					},
					error : function(xhr) {
						console.log("삭제에 실패했습니다");
					}
				})
			}
		});
	}
	function printPage(page, writer) {
		var $ul = $("<ul>").attr("class", "pagination").appendTo($("#paging"));

		var cntOfPage = Math.floor(page.totalcount / page.pagesize);
		if (page.totalcount % page.pagesize != 0)
			cntOfPage++;

		var blockSize = 5;
		var blockNo = Math.floor(page.pageno / blockSize) + 1;
		if (page.pageno % blockSize == 0)
			blockNo--;
		var startPage = (blockNo - 1) * blockSize + 1;
		var endPage = startPage + blockSize - 1;
		if (endPage > cntOfPage)
			endPage = cntOfPage;

		var writerParam = '';
		if (writer != undefined)
			writerParam = '&writer=' + writer;
		if (blockNo > 1) {
			var $li = $("<li>").attr("class", "previous").appendTo($ul);
			$("<a>").attr(
					"href",
					"/fontExample/inquiry?pageno=" + (startPage - 1)
							+ writerParam).text("앞으로").appendTo($li);
		}
		for (var i = startPage; i <= endPage; i++) {
			if (i == page.pageno) {
				var $li = $("<li>").attr("class", "active").appendTo($ul);
				$("<a>").attr("href",
						"/fontExample/inquiry?pageno=" + i + writerParam).text(
						i).appendTo($li);
			} else {
				var $li = $("<li>").appendTo($ul);
				$("<a>").attr("href",
						"/fontExample/inquiry?pageno=" + i + writerParam).text(
						i).appendTo($li);
			}
		}

		if (endPage < cntOfPage) {
			var $li = $("<li>").attr("class", "next").appendTo($ul);
			$("<a>").attr(
					"href",
					"/fontExample/inquiry?pageno=" + (endPage + 1)
							+ writerParam).text("다음으로").appendTo($li);
		}
	}
	$(function() {
		$.ajax({
			url : "/fontExample/api/inquiryAllRead",
			method : "get",
			data : location.search.substr(1),
			success : function(result, status, xhr) {
				printList(result);
				printPage(result);
				console.log(result);
			},
			error : function(xhr) {
				console.log(xhr.status);
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
			<div id="b">사이트 문의 페이지</div>
			<div id="c"></div>
			<table class="table table-hover">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="25%">
					<col width="15%">
					<col width="5%">
				</colgroup>
				<thead>
					<tr>
						<th id="no">문의 번호</th>
						<th>작성자</th>
						<th>문의 유형</th>
						<th>문의 제목</th>
						<th>처리 상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="list">
				</tbody>
			</table>
			<div id="paging" style="text-align: center;"></div>
		</div>
	</div>
</body>
</html>

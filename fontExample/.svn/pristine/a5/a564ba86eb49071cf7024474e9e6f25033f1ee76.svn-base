<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>신고하기 목록</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#a {
	float: right;
	width: 80%;
	height: 100%
}

#c {
	border: 1px solid black;
	text-align: left;
	width: 100%;
	margin: 5px;
}

#titleName {
	font-family: THE행복열매;
	font-weight: bolder;
	text-align: left;
	font-size: 40px;
}

.table th, #list {
	text-align: center;
}

</style>
<script>
	function printList(result) {
		var $body = $("#list");
		$.each(result.declarationPage, function(idx, mr) {
			var $tr = $("<tr>").appendTo($body);
			$("<td>").text(mr.no).appendTo($tr);
			$("<td>").text(mr.username).appendTo($tr);
			$("<td>").text(mr.declaration_username).appendTo($tr);
			if (mr.reason_no == 1) {
				$("<td>").text("광고(상점홍보,낚시글,도배글").appendTo($tr);
			} else if (mr.reason_no == 2) {
				$("<td>").text("물품정보 부정확").appendTo($tr);
			} else if (mr.reason_no == 3) {
				$("<td>").text("거래 금지 품목").appendTo($tr);
			} else if (mr.reason_no == 4) {
				$("<td>").text("언어폭력").appendTo($tr);
			} else if (mr.reason_no == 5) {
				$("<td>").text("기타사유").appendTo($tr);
			}
			var $td = $("<td>").appendTo($tr);
			var content = mr.content; // 변수 
			if (content.length >= 15) { // length = 글자 
				content = content.substr(0, 15) // 대입 (1에서 14)
				content = content + "..." // a = 1+"1"   = 11
			}
			$("<a>").attr("href", "declaration/detailView?no=" + mr.no).text(
					content).appendTo($td); // 하이퍼링크, 주소를 잘 넣어준다
			$("<td>").text(mr.declaration_date).appendTo($tr);
			var $td = $("<td>").appendTo($tr);
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
					"/fontExample/declarationList?pageno=" + (startPage - 1)
							+ writerParam).text("앞으로").appendTo($li);
		}
		for (var i = startPage; i <= endPage; i++) {
			if (i == page.pageno) {
				var $li = $("<li>").attr("class", "active").appendTo($ul);
				$("<a>").attr(
						"href",
						"/fontExample/declarationList?pageno=" + i
								+ writerParam).text(i).appendTo($li);
			} else {
				var $li = $("<li>").appendTo($ul);
				$("<a>").attr(
						"href",
						"/fontExample/declarationList?pageno=" + i
								+ writerParam).text(i).appendTo($li);
			}
		}

		if (endPage < cntOfPage) {
			var $li = $("<li>").attr("class", "next").appendTo($ul);
			$("<a>").attr(
					"href",
					"/fontExample/declarationList?pageno=" + (endPage + 1)
							+ writerParam).text("다음으로").appendTo($li);
		}
	}

	$(function() {
		$.ajax({
			url : "/fontExample/api/declaration/pageno",
			data : "pageno=" + location.search.substr(8),
			method : "get",
			success : function(result, status, xhr) {
				printList(result);
				printPage(result);
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
			<div id="titleName">신고 목록</div>
			<div id="c"></div>
			<table class="table table-hover">
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>신고번호</th>
						<th>신고대상자</th>
						<th>신고하신분</th>
						<th>사유번호</th>
						<th>신고내용</th>
						<th>신고일자</th>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
function printList(result) {
	var $body = $("#list");
	$.each(result.noticePage, function(idx, mr) {
		var $tr = $("<tr>").appendTo($body); // appendTo 뒤에 붙이겠다
		$("<td>").css("text-align", "center").text(mr.no).appendTo($tr);
		var $td = $("<td>").appendTo($tr);
		$("<a>").attr("href", "notice_read?no=" + mr.no).text(mr.title).appendTo($td); // 하이퍼링크, 주소를 잘 넣어준다
		$("<td>").text(mr.notice_date).appendTo($tr);
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
				"/fontExample/notice?pageno=" + (startPage - 1)
						+ writerParam).text("앞으로").appendTo($li);
	}
	for (var i = startPage; i <= endPage; i++) {
		if (i == page.pageno) {
			var $li = $("<li>").attr("class", "active").appendTo($ul);
			$("<a>").attr(
					"href",
					"/fontExample/notice?pageno=" + i
							+ writerParam).text(i).appendTo($li);
		} else {
			var $li = $("<li>").appendTo($ul);
			$("<a>").attr(
					"href",
					"/fontExample/notice?pageno=" + i
							+ writerParam).text(i).appendTo($li);
		}
	}

	if (endPage < cntOfPage) {
		var $li = $("<li>").attr("class", "next").appendTo($ul);
		$("<a>").attr(
				"href",
				"/fontExample/notice?pageno=" + (endPage + 1)
						+ writerParam).text("다음으로").appendTo($li);
	}
}

	$(function(){
		$("#enrollmentBtn").on("click", function(){
			location.href="/fontExample/notice_enrollment"
		})
		$.ajax({
			url : "/fontExample/api/noticeAllRead",
			data: "pageno=" + location.search.substr(8),
			method : "get",
			success : function(result, xhr) {
				printList(result);
				printPage(result);
				console.log(result);
			},
			error : function(xhr) {
				console.log(xhr.status);
			}
		});
	})
</script>
<style>
* {
	margin: 0 auto;
	padding: 0;
}
#noticeMain{
	margin-top: 30px;
	width: 820px;
	height: 1000px;
}
.subtitle{
	box-sizing: border-box;
    position: relative;
    min-height: 30px;
    margin-top: 15px;
    padding: 11px 0 8px;
    color: #2f2f2f;
    font-size: 15px;
    font-weight: 700;
    text-align: left;
}
#noticeTable{
	table-layout: fixed;
    width: 100%;
    border-spacing: 0;
    border-collapse: collapse;
    border-top: 2px solid #e1e1e1;
    color: #1d1d1d;
}

#noticeTable tr td{
	box-sizing: border-box;
    position: relative;
    padding: 7px 0 7px 10px;
    border-bottom: 1px solid #e1e1e1;
    text-align: left;
}

#noticeTable tr th{
	box-sizing: border-box;
    padding: 7px 0;
    height: 40px;
    border-bottom: 1px solid #e1e1e1;
    background-color: #f0f0f0;
    text-align: center;
}
#noticeTitle{
	position: relative;
    padding-bottom: 3px;
    margin-bottom: 20px;
    text-align: left;
    font-size: 25px;
    font-weight: 700;
    letter-spacing: -2px;
}
#no{
	width: 100px;
}
#date{
	width: 130px;
}
#btnGroup{
	text-align: right;
}
#enrollmentBtn{
	border-radius: 5px;
	background-color: rgb(255, 182, 193);
	color: white;
	height: 30px;
	font-weight: bold;
	border: none;
}

</style>
</head>

<body>
	<div id="noticeMain">
		<div id="noticeTitle">
			공지사항<br>
		</div>
		<br>
		<div id="ProductInfo">
			<table id="noticeTable">
				<tr>
					<th id="no">번호</th>
					<th id="title">제목</th>
					<th id="date">등록일</th>
				</tr>
				<tbody id="list">
				</tbody>
			</table>
		</div>
		
			<div id="btnGroup">
				<button id="enrollmentBtn">글쓰기</button>
			</div>
			<div id="paging" style="text-align: center;"></div>
	</div>
	
</body>
</html>
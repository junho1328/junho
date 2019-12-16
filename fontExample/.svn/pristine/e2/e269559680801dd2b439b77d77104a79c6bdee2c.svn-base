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
		var no = location.search.substr(4);
		var param = {
				no : no
		}
		$.ajax({
			url: "/fontExample/api/noticeRead",
			method: "get",
			data: param,
			success: function(result){
				$("#no").text(result.no);
				$("#title").text(result.title);
				$("#notice_date").text(result.notice_date);
				comma(result.content);
			}
		})
		
		$("#listBtn").on("click", function(){
			location.href="/fontExample/notice"
		})
		$("#reWriteBtn").on("click", function(){
			var noticeNo = $("#no").text();
			location.href="/fontExample/notice_reWrite?no="+noticeNo;
		})
		function comma(str){
			str = String(str);
			str = str.replace(/,/g,"")
		    $("#content").append(str);
		}
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
#no, #date{
	width: 100px;
}
#btnGroup{
text-align: right;
}
.btnGroup{
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
					<td><span id="no"></span></td>
					<th>제목</th>
					<td colspan="3"><span id="title"></span></td>
					<th id="date">등록일</th>
					<td><span id="notice_date"></span></td>
				</tr>
				<tr>
					<td colspan="5" id="content"> </td>
				</tr>
			</table>
		</div>
			<div id="btnGroup">
				<button id="reWriteBtn" class="btnGroup">수정</button>
				<button id="listBtn" class="btnGroup">목록</button>
			</div>
	</div>
</body>
</html>
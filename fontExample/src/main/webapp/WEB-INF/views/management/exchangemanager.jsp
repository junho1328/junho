<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 환전 신청 내역 </title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<sec:authorize access="isAuthenticated()">                          <!--  로그인 했을 때 실행  -->
	<sec:authentication property="principal.username" var="user" /> <!-- principal 로그인 되어 있는 정보  -->
</sec:authorize>
<style>

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

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

#d {
	width: 100%;
	height: 100%;
	padding: 10px;
}

#e {
	font-weight: bolder;
	text-align: left;
	font-size: 40px;
}

.li_a {
	color: black;
	font-weight: bold;
	font-size: 15px;
	margin: 5px;
	text-align: left;
}

a {
	color: black;
}

.table th, #list {
	text-align: center;
}

#f {
	margin: 5px;
	text-align: center;
	display: block;
	float: right;
}

#exchange_input {
	font-family: serif;
	float: left;
	display: block;
	width: 200px;
	height: 30px;
	font-size: 20px;
}

#search_button {
	float: right;
	display: block;
}

#check_delete {
    width: 80px;
    height: 30px;
    border-radius: 4px;
    background-color: #ffb6c1;
    color: white;
    border: none;
    display: inline-block;
    float: right;
}

#link {
	font-size: 20px;
	float: left;
	width: 50px;
	height: 30px;
}
#choice {
    float: right;
    padding: 15px;
}
.btn-default {
	height: 30px;
}
</style>
<script>
$(function() {
	function printList(result) {
		var username = '${user}';
		var $body = $("#list");
		$.each(result.exchangePage, function(idx, mr) {
			var $tr = $("<tr>").appendTo($body);
			var $td = $("<td>").appendTo($tr);
			$("<input>").attr("type", "checkbox").attr("name", "input_check").attr("class","input_check").val(mr.no)
					.appendTo($td);
			$("<td>").text(mr.no).appendTo($tr);
			$("<td>").text(mr.username).appendTo($tr);
			$("<td>").text(mr.name).appendTo($tr);
			$("<td>").text(mr.amount).appendTo($tr);
			$("<td>").text(mr.bank).appendTo($tr);
			$("<td>").text(mr.account).appendTo($tr);
			$("<td>").text(mr.changeday).appendTo($tr);
		});
	}
	$("#check_all").click(function() {
		if ($("#check_all").prop("checked")) {
			$("input[name=input_check]").prop("checked", true);
		} else {
			$("input[name=input_check]").prop("checked", false);
		}
	})
	function printPage(page){
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
					"/fontExample/exchangemanager?pageno=" + (startPage - 1)).text(
					"앞으로").appendTo($li);
		}
		for (var i = startPage; i <= endPage; i++) {
			if (i == page.pageno) {
				var $li = $("<li>").attr("class", "active").appendTo($ul);
				$("<a>").attr("href", "/fontExample/exchangemanager?pageno=" + i)
						.text(i).appendTo($li);
			} else {
				var $li = $("<li>").appendTo($ul);
				$("<a>").attr("href", "/fontExample/exchangemanager?pageno=" + i)
						.text(i).appendTo($li);
			}
		}

		if (endPage < cntOfPage) {
			var $li = $("<li>").attr("class", "next").appendTo($ul);
			$("<a>").attr("href",
					"/fontExample/exchangemanager?pageno=" + (endPage + 1)).text(
					"다음으로").appendTo($li);
		}
	}
	$(function() {
		$.ajax({
			url : "/fontExample/api/exchangeAllRead",
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
 		$("#check_delete").on("click", function() {
			if(confirm("삭제하시겠습니까?")==true){
				var del = [];
				$(".input_check").each(function(idx){
					if($(this).prop("checked")){
						del.push($(this).val());
					}
				})
				console.log(del);
				if(del.length==0)
					return;
				var params = {
						json:JSON.stringify(del),
				}
				$.ajax({
					url:"/fontExample/api/exchangeDelete",
					method:"post",
					data:params,
					success:function(result){
						location.reload();
						printList(result);
					},
					error: function(error){
						console.log("에러 : " + error);
					}
				})
			}
		});
	});
})
</script>
</head>
<body>
	<div>
		<div>
			<jsp:include page="/WEB-INF/views/management/managementpage.jsp" />
		</div>
		<div id="a">
			<div id="b">
				환전 신청 내역
				<form id="choice" action="" method="get">
					<select id="link">
						<option>no</option>
						<option>id</option>
						<option>name</option>
						<option>bank</option>
						<option>bank_no</option>
						<option>day</option>
					</select> <input id="exchange_input" type="text" placeholder="Search"
						name="search">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</form>
			</div>
			<div id="c"></div>
			<div id="d">
				<div id="e">
					<div id="f"></div>
				</div>
				<table class="table table-hover">
					<colgroup>
						<col width="5%">
						<col width="10%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="10%">
						<col width="20%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr style="">
							<th><input type="checkbox" id="check_all"></th>
							<th>연번</th>
							<th>판매자 아이디</th>
							<th>이름</th>
							<th>환전액</th>
							<th>은행</th>
							<th>계좌번호</th>
							<th>신청일자</th>
						</tr>
					</thead>
					<tbody id="list">
					</tbody>
				</table>
				<a href="/fontExample/exchangemanager"><button id="check_delete"
						type="button">삭제</button></a>
									<div id="paging" style="text-align: center;"></div>
			</div>
		</div>
	</div>
</body>
</html>

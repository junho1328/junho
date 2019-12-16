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

td a {
	width: 100%;
}

th {
	text-align: center;
	width:10%;
}

td {
	text-align: center;
	width:10%;
}

#titleName {
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
#paging{
	margin : 0 auto;
}
</style>
<script>
	function printList(result,role) {
		var $order = $("#order");
		var $tr = $("<tr>").appendTo($order);
		$("<th>").text("번호").appendTo($tr);
		$("<th>").text("결제일자").appendTo($tr);
		$("<th>").text("결제금액").appendTo($tr);
		$("<th>").text("결제진행상태").appendTo($tr);
		$("<th>").text("가상계좌번호").appendTo($tr);
		$("<th>").text("가상계좌은행").appendTo($tr);
		$("<th>").text("가상예금주").appendTo($tr);
		if(role=='imAdmin'){
			$("<th>").text("결제자ID").appendTo($tr);
			$("<th>").text("결제고유번호").appendTo($tr);
			$("<th>").text("가상계좌승인").appendTo($tr);
			$("<th>").text("결제취소").appendTo($tr);
		}
		var $body = $("#list");
		$.each(result.payment, function(idx, pay) {
			console.log(pay)
			var $trbody = $("<tr>").appendTo($body)
			$("<td>").text(pay.no).appendTo($trbody);
			$("<td>").text(pay.paymentDate).appendTo($trbody);
			$("<td>").text(pay.amount).appendTo($trbody);
			if(pay.statue=="ready")
				$("<td>").text("결제대기").appendTo($trbody);
			else if(pay.statue=="paid")
				$("<td>").text("결제완료").appendTo($trbody);
			else if(pay.statue=="cancelled")
				$("<td>").text("결제취소").appendTo($trbody);
			else if(pay.statue=="failed")
				$("<td>").text("실패").appendTo($trbody);
			$("<td>").text(pay.vbankAccount).appendTo($trbody);
			$("<td>").text(pay.vbankBank).appendTo($trbody);
			$("<td>").text(pay.vbankName).appendTo($trbody);
			if(role=='imAdmin'){
				$("<td>").text(pay.username).appendTo($trbody);
				$("<td>").text(pay.impAid).appendTo($trbody);
				var $td = $("<td>").appendTo($trbody);
				$("<button>").attr("type","button").text("승인확인").attr("class","btn btn-success ok").val(pay.no).appendTo($td);
				var $td2 = $("<td>").appendTo($trbody);
				$("<button>").attr("type","button").text("결제취소").attr("class","btn btn-danger cancel").val(pay.no).appendTo($td2);
			}
		});
		$(".cancel").on("click",function(){
			var no = $(this).val();
			$.ajax({
				url : "/fontExample/api/payment/cancel/"+no,
				data : "pageno=" + location.search.substr(8),
				method : "post",
				success : function(result, status, xhr) {
					alert("취소가 성공적으로 이루어졌습니다.")
					location.reload();
				},
				error : function(xhr) {
					console.log(xhr.status);
				}
			})
		})
		$(".ok").on("click",function(){
			var no = $(this).val();
			$.ajax({
				url : "/fontExample/api/payment/check/"+no,
				data : "pageno=" + location.search.substr(8),
				method : "post",
				success : function(result, status, xhr) {
					alert(result)
					location.reload();
				},
				error : function(xhr) {
					console.log(xhr.status);
				}
			})
		})
	}
	function printPage(page, role) {
		var $ul = $("<ul>").attr("class", "pagination").appendTo($("#paging"));

		var cntOfPage = Math.floor(page.totalcount / page.pagesize);
		if (page.totalcount % page.pagesize != 0)
			cntOfPage++;

		var blockSize = 1;
		var blockNo = Math.floor(page.pageno / blockSize) + 1;
		if (page.pageno % blockSize == 0)
			blockNo--;
		var startPage = (blockNo - 1) * blockSize + 1;
		var endPage = startPage + blockSize - 1;
		if (endPage > cntOfPage)
			endPage = cntOfPage;
		if(role=='imAdmin'){
			var $link = "/fontExample/payment?pageno="
		} else {
			var $link = "/fontExample/payment/user?pageno="
		}
		if (blockNo > 1) {
			var $li = $("<li>").attr("class", "previous").appendTo($ul);
			$("<a>").attr("href",$link + (startPage - 1)).text("<<<<").appendTo($li);
		}
		for (var i = startPage; i <= endPage; i++) {
			if (i == page.pageno) {
				var $li = $("<li>").attr("class", "active").appendTo($ul);
				$("<a>").attr("href",$link + i).text(i).appendTo($li);
			} else {
				var $li = $("<li>").appendTo($ul);
				$("<a>").attr("href",$link + i).text(i).appendTo($li);
			}
		}
		if (endPage < cntOfPage) {
			var $li = $("<li>").attr("class", "next").appendTo($ul);
			$("<a>").attr("href",$link + (endPage + 1)).text("다음으로").appendTo($li);
		}
	}
	$(function() {
		if($('#isAdmin').val()=='imNotAdmin'){
			$.ajax({
				url : "/fontExample/api/payment/user",
				data : "pageno=" + location.search.substr(8),
				method : "get",
				success : function(result, status, xhr) {
					printList(result,$('#isAdmin').val());
					printPage(result,$('#isAdmin').val());
				},
				error : function(xhr) {
					console.log(xhr.status);
				}
			});
		}
		if($('#isAdmin').val()=='imAdmin'){
			$.ajax({
				url : "/fontExample/api/payment",
				data : "pageno=" + location.search.substr(8),
				method : "get",
				success : function(result, status, xhr) {
					printList(result,$('#isAdmin').val());
					printPage(result,$('#isAdmin').val());
				},
				error : function(xhr) {
					console.log(xhr.status);
				}
			});
		}
	});
</script>

</head>
<body>
	<div>
		<div>
			<sec:authorize access="!hasRole('ROLE_ADMIN')">
				<input type="hidden" value="imNotAdmin" id="isAdmin">
				<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" />
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<input type="hidden" value="imAdmin" id="isAdmin"> 
				<jsp:include page="/WEB-INF/views/management/managementpage.jsp" />
			</sec:authorize>
		</div>
		<div id="a">
			<div id="titleName">결제목록</div>
			<div>성공하거나 대기중인 결제목록이 나타납니다.</div>
			<div id="c"></div>
			<table class="table table-hover">
				<thead id="order">
				</thead>
				<tbody id="list">
				</tbody>
			</table>
			<div id="paging"></div>
		</div>
	</div>
</body>
</html>
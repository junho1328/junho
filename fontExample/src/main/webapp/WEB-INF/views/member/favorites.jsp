<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<script>
	$(document).ready(function(){
	    $("#check_all").click(function(){
	        if($("#check_all").prop("checked")){
	            $("input[name=input_check]").prop("checked",true);
	        }else{
	            $("input[name=input_check]").prop("checked",false);
	        }
	    })
	});
		</script>
<style>
#b {
	float: left;
	height: 200px;
	width: 20%;
}

#c {
	float: right;
	width: 80%;
}

#d {
	font-family: THE행복열매;
	font-weight: bolder;
	text-align: left;
	font-size: 40px;
}

#da {
	border: 1px solid black;
	text-align: left;
	width: 70%;
	margin: 5px;
}

#e {
	font-family: THE행복열매;
	font-weight: bolder;
	text-align: left;
	font-size: 40px;
}

#ea {
	border: 1px solid black;
	text-align: left;
	width: 100%;
}

td {
	text-align: center;
}

.li_a {
	font-weight: bold;
	font-size: 15px;
	margin: 5px;
	text-align: left;
	color: black;
}
a	{
	color: black;
}

.li_b {
	list-style-type: none;
	float: left;
	text-align: center;
	display: inline-block;
}

.ul_a {
	text-align: center;
}
#check_delete {
    float : right;
    width: 120px;
	height: 30px;
	border-radius: 4px;
	background-color: #ffb6c1;
	font-weight: bold;
	color: white;
	border: none;
	display: inline-block;
	margin-top : 5px;
}
#soldout_delete {
	margin-right: 5px;
    float : right;
    width: 120px;
	height: 30px;
	border-radius: 4px;
	background-color: #ffb6c1;
	font-weight: bold;
	color: white;
	border: none;
	display: inline-block;
	margin-top : 5px;
}
.favDiv {
	text-align : center;
	margin-top : 4px;
	margin-bottom : 4px;
}
#checkboxTh {
	text-align: center;
}
.favImageTd {
	padding-top : 8px;
	padding-bottom : 8px;

}
td {
	border-top : 1px solid #DDDDDD;
	border-bottom : 1px solid #DDDDDD;
}
.favImage {
	height : 200px;
}
</style>
<script>
function printList(result){
	var $body = $("#list");
	$.each(result, function(idx, fv){
		var $tr = $("<tr>").appendTo($body);
		var $td = $("<td>").appendTo($tr);
		$("<input>").attr("type","checkbox").attr("class","del").attr("name","input_check").val(fv.no).appendTo($td);
		if(fv.image==null){
			$("<td>").text("이미지 없음").appendTo($tr);
		} else {
			$imagetd = $("<td>").attr("class","favImageTd").appendTo($tr);
			$("<img>").click(function(){
				location.href="/fontExample/readProduct?pageno=" + fv.pno
			}).attr("class","favImage").attr("src",fv.image).css("cursor","pointer").appendTo($imagetd);
		}
		var $fvName = $("<td>").appendTo($tr);
		$("<a>").attr("href","/fontExample/readProduct?pageno=" + fv.pno).text(fv.name).appendTo($fvName)
		$("<td>").text("￦" + fv.price).appendTo($tr);
		$("<td>").text(fv.productDate).appendTo($tr);
		if(fv.state==0)
			$("<td>").text("판매 중").appendTo($tr);
		else if(fv.state==1)
			$("<td>").text("판매 완료").appendTo($tr);
		$("<input>").attr("type","hidden").attr("class","issold").val(fv.state).appendTo($td);
	})
}
$(function(){
	$.ajax({
		url :"/fontExample/api/favorite",
		method:"get",
		success:function(result){
			printList(result);
		},error:function(xhr){
			alert("즐겨찾기 로드에 실패하였습니다.");
		}
	});
	$("#check_delete").on("click",function(){
		var ar = [];
		$(".del").each(function(idx){
			if($(this).prop("checked")){
				ar.push($(this).val());
			}
		})
		console.log(ar);
		if(ar.length==0)
			return;
		var params = {
				json:JSON.stringify(ar),
				_method:'delete'
		}
		$.ajax({
			url:"/fontExample/api/favorite",
			method:"post",
			data:params,
			success:function(result){
				location.reload();
			}
		})
	});
	$("#soldout_delete").on("click",function(){
		var params = {
			_method:'delete'
		}
		$.ajax({
			url:"/fontExample/api/favorite/soldout",
			method:"post",
			data:params,
			success:function(result){
				location.reload();
			}
		})
	});
})
</script>
</head>
<body>
	<div>
		<div>
			<jsp:include page="myPageMenu.jsp" />
		</div>
		<div id="c">
			<div id="e">즐겨찾기</div>
			<div id="ea"></div>
			<div>
				<table id="choice">
					<colgroup>
						<col width="10%">
						<col width="30%">
						<col width="20%">
						<col width="10%">
						<col width="20%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th id="checkboxTh">
								<input type="checkbox" id="check_all">
							</th>
							<th>
								<div class="favDiv">사진</div>
							</th>
							<th>
								<div class="favDiv">제품명</div>
							</th>
							<th>
								<div class="favDiv">가격</div>
							</th>
							<th>
								<div class="favDiv">등록일</div>
							</th>
							<th>
								<div class="favDiv">판매여부</div>
							</th>
						</tr>
					</thead>
					<tbody id="list">
					</tbody>
				</table>
			</div>
			<button id="check_delete" type="button" class="btn btn-default"> 선택 항목 삭제 </button>
			<button id="soldout_delete" type="button" class="btn btn-default"> 완료 항목 삭제 </button>
		</div>
	</div>
</body>
</html>

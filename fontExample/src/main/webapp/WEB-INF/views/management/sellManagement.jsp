<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<title>Insert title here</title>
<script>



//<tr><td><input type="checkbox" name="checkRow" value="select" ></td><td>번호 부여받기 </td><td>
//<img src="resources/picture.jpg" width="100px" height="100px"></td>
//<td>제품</td><td>가격</td><td>등록일</td><td><button id="hide"class="button" onclick="hide();">숨기기</button>
//</td><td><button id="delete"class="button" onclick="deleteAction();">삭제</button></td></tr>
		
	function printList(result){
		// 테이블의 <tbody>를 선택한다
		var $body = $("#list");
		//var blockButton = ;
		$.each(result, function(idx, sell) {
			var $tr = $("<tr>").appendTo($body);
			$("<input>").attr("type","checkbox").attr("class","check").appendTo($tr);
			$("<td>").text(sell.no).appendTo($tr);
			$("<td>").text(sell.image).appendTo($tr);
			$("<td>").text(sell.username).appendTo($tr);
			$("<td>").text(sell.area).appendTo($tr);
			$("<td>").text(sell.name).appendTo($tr);
			$("<td>").text(sell.price).appendTo($tr);
			$("<td>").text(sell.sell_date).appendTo($tr);
			var $block = $("<input>").attr("type","hidden").attr("id","block"+idx).val(sell.block).appendTo($tr);
			
			
			if($("#block"+idx).val() == '1'){
				var $blockChange = $("<input>").attr("type","hidden").attr("id","changeState"+idx).val('숨김처리').appendTo($tr);
				var $nowState = $("<input>").attr("type","hidden").attr("id","nowState"+idx).val('정상').appendTo($tr);
				
			}else{
				var $blockChange = $("<input>").attr("type","hidden").attr("id","changeState"+idx).val('복원하기').appendTo($tr);
				var $nowState = $("<input>").attr("type","hidden").attr("id","nowState"+idx).val('숨김').appendTo($tr);
				
			}
			
			$("<td>").text($("#nowState"+idx).val()).appendTo($tr);
			$("<button>").attr("class","block").attr("id","button"+idx).val("test").text($("#changeState"+idx).val()).appendTo($tr);
			console.log($("#changeState1"))
			
			$("#button"+idx).on("click", function(){
				var $no = $("<input>").attr("type","hidden").attr("id","no").val(sell.no).appendTo($tr);
				console.log($("#no").val());
				var $block = $("<input>").attr("type","hidden").attr("id","block"+idx).val(sell.block).appendTo($tr);
				console.log($("#block"+idx).val());
				if($("#block"+idx).val() == 1){
					console.log("숨김처리를 한다");
					//block을 0 으로 바꾼다
					$("#block"+idx).val(0);
					//그리고 창을 새로고침을 한다
					//location.reload();  
				}else if($("#block"+idx).val() == 0){
					console.log("숨김처리를 해제를 한다 ");
					//block을 1 으로 바꾼다
					$("#block"+idx).val(1);
					//그리고 창을 새로고침을 한다
					//location.reload();
				}else{
					console.log("이거는 무슨상황일까?");
					//아마도 block이 2인 상황 즉 판매완료된 상황일거 같다
				}
				var block = $("#block"+idx).val();
				var no = $("#no").val();
				var param  = {
					block : block,
					no : no
				}
				$.ajax({ 
					
					url : "/fontExample/api/sellManagement/adminListNew",
					type : "get", 
					data : param,
					success : function(result) {
						location.reload();
						console.log(param)
					}
				});
				
				//으어 컨트롤러에서 호출하든 맵퍼에서 호출하든 sql문을 쓰든 update 를 하면된다고
				
			});
		});
		
		
	}
	
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
					"/fontExample/api/sellmanagement/adminList?pageno=" + (startPage - 1)).text(
					"앞으로").appendTo($li);
		}
		for (var i = startPage; i <= endPage; i++) {
			if (i == page.pageno) {
				var $li = $("<li>").attr("class", "active").appendTo($ul);
				$("<a>").attr("href", "/fontExample/api/sellmanagement/adminList?pageno=" + i)
						.text(i).appendTo($li);
			} else {
				var $li = $("<li>").appendTo($ul);
				$("<a>").attr("href", "/fontExample/api/sellmanagement/adminList?pageno=" + i)
						.text(i).appendTo($li);
			}
		}

		if (endPage < cntOfPage) {
			var $li = $("<li>").attr("class", "next").appendTo($ul);
			$("<a>").attr("href",
					"/fontExample/api/sellmanagement/adminList?pageno=" + (endPage + 1)).text(
					"다음으로").appendTo($li);
		}
	}
	
	$(function() {
		
		$.ajax({ 
			url : "/fontExample/api/sellManagement/adminList",
			method : "get", 
			
			success : function(result) {
				console.log(result);
				printList(result);
				printPage(page);
			}
		});
		
		
	});
	

	/*
	$("#check").click(function(){
		if($("#selectAll").is("checked")){
			$("input[name='checkRow'").prop("checked", true);
		}else{
			$("input[name='checkRow'").prop("checked", false);
		}
	});
	$("name='checkRow'").click(function(){
		if($("input[name='checkRow']:checked").length == 3){
			$("#selectAll").prop("checked",true);
		}else{
			$("#selectAll").prop("checked",false);	
		}
	});
	*/ 
	

		
	/* 으으아ㅡ아으ㅏ아아아아아앙 제발
	function deleteAction(){
		var checkRow = "";
		$("board[name='checkRow']:checked").each(function(){
			checkRow =checkRow + $(this).val()+"," ;
		});
		checkRow = check.substring(0,checkRow.lastIndexOf(","));
		
		if(checkRow == ''){
			alert("대상을 선택하세요");
			return false;
		}
		console.log("### checkRow >>>> {}" + checkRow);
		
		if(confrim("대상들을 삭제 하시겠습니까?")){
			$("input[name=checkRow]:checked").each(function(){
				var value = $(this).val();
				var tr = $("tr[value='"+value+"']");
				//삭제하는 걸 데이터베이스로 해야되는데 tr.remove();
			});
		}else{
			return false;					
		}
	}
	function hideAction(){
		var checkRow = "";
		$("board[name='checkRow']:checked").each(function(){
			checkRow =checkRow + $(this).val()+"," ;
		});
		checkRow = check.substring(0,checkRow.lastIndexOf(","));
		
		if(checkRow == ''){
			alert("대상을 선택하세요");
			return false;
		}
		console.log("### checkRow >>>> {}" + checkRow);
		
		if(confrim("대상들을 숨기시겠습니까?")){
			$("input[name=checkRow]:checked").each(function(){
				var value = $(this).val();
				var tr = $("tr[value='"+value+"']");
				//삭제는 아니라서 숨겼다는 것을 보내야함
				//
			});
		}else{
			return false;					
		}
	}
	*/
</script>
<style>
	.inline{
		display: inline-block;
	}
	.button{
		font-size: 15px;
		width: 100px;
		height: 40px;
		background: gray;
		margin: 10px;
		border-radius: 5px;
		background-color: rgb(255, 182, 193);
		font-weight: bold;
		color: white;
		border: none;
	}
	.radio{
		font-size: 15px;
	}
	#anothertext{
		font-size: 15px;
	}
	thable tr{
		height: 130px;
		text-align: center;
	}
	table th {
		text-align: center;
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
</style>
</head>
<body>
<div>
		<sec:authorize access="hasRole('ROLE_SELLER')">
				<input type="hidden" value="imNotAdmin" id="isAdmin">
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<input type="hidden" value="imAdmin" id="isAdmin"> 
			</sec:authorize>
	</div> 
	<div>
		<div>
			<jsp:include page="/WEB-INF/views/management/managementpage.jsp" />
		</div>
		<div id="a">
			<div id="b"> 판매글 관리 페이지 </div>
			<div id="c"></div>
	<div style="text-align: left">
		<div style="text-align: left;" class="inline">
			판매글 <button id="hideCheck"class="button">체크 숨기기</button> <button id="deleteCheck"class="button">체크 삭제</button> 	
		</div>
		<div class="inline" style="padding-left: 50%">
			<input type="radio" name="size" value="big" id="big">큰 아이콘 &nbsp; <input type="radio" value="small" name="size" id="small">작은 아이콘
		</div>
		
	</div>
	<table style="width: 100%; ">
		<colgroup>
			<col width="5%"/>
			<col width="5%" />
			<col width="15%" />
			<col width="10%" />
			<col width="10%" />
			<col width="20%" />
			<col width="10%" />
			<col width="5%" />
			<col width="5%" />
			<col width="5%" />
		</colgroup>
		
		<thead>
			<tr style="border-bottom: 1px solid; border-top: 1px solid; height: 50px ;">
				<th><input type="checkbox" id="selectAll" name ="selectAll" value="selectAll"></th>
				<th>NO</th>
				<th>사진</th>
				<th>아이디</th>
				<th>거래지역</th>
				<th>제품명</th>
				<th>가격</th>
				<th>등록일</th>
				<th>상태</th>
				<th>제재</th>
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
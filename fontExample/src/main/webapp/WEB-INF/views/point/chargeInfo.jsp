<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>충전 완료</title>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
#main #page {
    width: 570px;
    height: 400px;
    margin: auto;
    margin-top: 3em;
    padding-top: 20px;
    padding-left: 60px;
    padding-right: 60px;
    background-color: white;
    text-align : left;
}
#chargeSubmit {
    margin-top : 10px;
    width : 100%;
}
#accountNumber {
    margin-bottom : 7px;
    border-top : none;
    border-left : none;
    border-right : none;
    border-bottom : 1px solid black;
    width : 100%;
}
#username {
    margin-bottom : 7px;
    border-top : none;
    border-left : none;
    border-right : none;
    border-bottom : 1px solid black;
    width : 100%;
}
#chargeMoney {
    font-size: 12px;
}
#depositLimitTime {
    font-size: 12px;
    padding-top : 5px;
    border-top : 1px solid #DAD3D3;
    margin-left : 5px;
    margin-right : 5px;
}
#chargeInfoH2 {
	text-align : center;
	padding-top : 5px;
	padding-bottom : 5px;
	background-color : #DAD3D3;
}
.chargeInfoDivTopMargin {
	margin-top : 10px;
}
</style>
<script>
 $(function(){
		$.ajax({
			url : "/fontExample/api/point",
			method : "get",
			success : function(result){
				$("#currectMoney").text(result)
			}
		})
		$("#chargeSubmit").on("click",function(){
			location.href = "/fontExample/"
		})
 })
</script>
</head>
<body>
    <div id="main">
        <div id="page">
            <div id="textArea">
				<p>결제가 성공적으로 완료되었습니다</p>
				<p>가상계좌의 경우 결제목록에서 계좌를 확인할 수 있습니다.</p>
				<br>
				<p>보유 포인트 : <span id="currectMoney"></span> point<br>
            </div>
            <button id="chargeSubmit" class="btn btn-default">메인으로</button>
        </div>
    </div>
</body>

</html>
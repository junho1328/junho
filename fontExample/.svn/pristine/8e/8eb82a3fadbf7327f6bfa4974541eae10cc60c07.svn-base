<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>충전 금액 페이지</title>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
#main #page {
    width: 570px;
    height: 400px;
    margin-top: 3em;
    padding-top: 20px;
    background-color: white;
    text-align : left;
}
.addmoney{
	width : 32.7%;
	background-color: #DDDDDD;
	border-radius: 4px;
}
#chargeSubmit {
    margin-top : 10px;
    width : 100%;
}
#inputMoney {
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
#chargeH2 {
	text-align : center;
	padding-top : 5px;
	padding-bottom : 5px;
	background-color: #ffb6c1;
	border-radius: 4px;
	color: white;
}
.chargeDivTopMargin {
	margin-top : 10px;
	text-align: center;
}
.pay{
	width:140px;
}
#chargeTable {
	margin-left : 5px;
}
</style>
<script>
	var onlyNumber = /^[0-9][0-9]*$/;
	var IMP = window.IMP;
	IMP.init('imp56394193');
	function addMoney(money){
		var $money = $("#inputMoney").val();
		if(onlyNumber.test($money)==false){
			$("#inputMoney").val(money);
		} else {
			var $setMoney = parseInt($money) + parseInt(money);
			$("#inputMoney").val($setMoney);
		}
	}
	function charge(method){
		var $money =$("#inputMoney").val();
		if(onlyNumber.test($money)==false){
			console.log($money);
			alert("적합하지 않은 금액입니다 금액을 다시 입력해주세요")
			$("#inputMoney").val("0");
		} else if($money==0 || $money%1000!=0){
			alert("금액은 최소 1000원 이상으로 천원 단위로 입력하셔야 합니다.")
		} else {
			IMP.request_pay({
			    pay_method : method,
			    merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
			    name : '4982 Point',
			    amount : $money,
			    buyer_email : '',
			    buyer_name : '',
			    buyer_tel : '010-1234-5678', //누락되면 이니시스 결제창에서 오류
			}, function(rsp) {
			    if ( rsp.success ) {
					var param = {
							imp_uid	: rsp.imp_uid,
							amount : rsp.paid_amount,
						}
					$.ajax({
						url : "/fontExample/api/payment/complete",
						method : "post",
						async : false,
						data : param,
						success : function(result){
							alert(result.msg);
							if(result.msg=="vbank ready"){
								var msg = "vbank ready"
								location.href = "/fontExample/chargeInfo?msg="+msg
							}
							else if(result.msg=="payment success"){
								var msg = "payment success"
								location.href = "/fontExample/chargeInfo?msg="+msg
							}
						},error:function(xhr){
							var msg = 'Error';
							location.href = "/fontExample/chargeError"
						}
					})
			    } else {
			        var msg = 'Error';
			        location.href = "/fontExample/chargeError"
			    }
			});
		}
	}
	$(function(){
		$(".addmoney").on("click",function(){
			addMoney($(this).val());
		})
		$(".pay").on("click",function(){
			charge($(this).val());
		})
	})
</script>
</head>
<body>
    <div id="main">
        <div id="page">
            <div id="textArea">
                <h2 id="chargeH2">충전</h2><br>
                <span id="chargeMoney">충전금액</span>
                <div>
                    <input id="inputMoney" type="text" name="inputMoney" placeholder="금액을 입력하세요">
                </div>
                <div class="chargeDivTopMargin">
	                <button class="btn addmoney" value="10000">+1만원</button>
	                <button class="btn addmoney" value="20000">+2만원</button>
	                <button class="btn addmoney" value="50000">+5만원</button>
                </div>
            </div>
            <hr>
            <table id="chargeTable">
            	<tbody>
            		<tr>
            			<td><button class="btn btn-default pay" value="card">카드</button></td>
            			<td><button class="btn btn-default pay" value="trans">계좌이체</button></td>
            			<td><button class="btn btn-default pay" value="vbank">가상계좌</button></td>
            			<td><button class="btn btn-default pay" value="phone">휴대폰</button></td>
            		</tr>
            		<tr>
            			<td><button class="btn btn-default pay" value="samsung">Samsung Pay</button></td>
            			<td><button class="btn btn-default pay" value="kpay">KPay</button></td>
            			<td><button class="btn btn-default pay" value="cultureland">문화상품권</button></td>
            			<td><button class="btn btn-default pay" value="smartculture">스마트 문화상품권</button></td>
            		</tr>
            		<tr>
            			<td><button class="btn btn-default pay" value="happymoney">해피머니</button></td>
            			<td><button class="btn btn-default pay" value="booklife">도서문화상품권</button></td>
            		</tr>
            	</tbody>
            </table>
        </div>
    </div>
</body>

</html>
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
	
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user" />
</sec:authorize>

<script>
	$(document).ready(function() {
		var loginId = '${user}';
		if(loginId != ""){
			$("#service_center_menu").css("float", "left");
		}
		$("#service_center_service_1vs1").on("click", function() {
			location.href = "/fontExample/inquiry_write";
		})
		$("#service_center_frequently").click(function() {
			if ($("#frequentlyList").is(":visible")) {
				$("#frequentlyList").slideUp();
			} else {
				$("#frequentlyList").slideDown();
			}
		});

		$("#frequently1").click(function() {
			if ($("#frequentlyList1").is(":visible")) {
				$("#frequentlyList1").slideUp();
			} else {
				$("#frequentlyList1").slideDown();
			}
		});
		$("#frequently2").click(function() {
			if ($("#frequentlyList2").is(":visible")) {
				$("#frequentlyList2").slideUp();
			} else {
				$("#frequentlyList2").slideDown();
			}
		});
		$("#frequently3").click(function() {
			if ($("#frequentlyList3").is(":visible")) {
				$("#frequentlyList3").slideUp();
			} else {
				$("#frequentlyList3").slideDown();
			}
		});
		$("#frequently4").click(function() {
			if ($("#frequentlyList4").is(":visible")) {
				$("#frequentlyList4").slideUp();
			} else {
				$("#frequentlyList4").slideDown();
			}
		});
	});

</script>
<style>
* {
	margin: 0 auto;
	padding: 0;
}

#service_center_menu {
	width: 80%;
	height: 130px;
	padding-top: 5px;
}

#service_center_search {
	display: inline-block;
}

#service_center_search_input {
	margin-left: 20px;
	float: left;
	display: block;
	width: 250px;
	height: 28px;
}

#service_center_service_1vs1 {
	width: 100px;
	height: 28px;
	background-color: #DDDDDD;
	display: inline-block;
	border : 0;
	outline : none;
	border-radius: 4px;
	margin-left : 393px;
	margin-bottom : 5px;
	
}

#service_center_subMenu {
	width: 60%;
	display: contents;
}

.service_center_mainBtn {
	width: 960px;
	height: 40px;
	background-color: white;
	border-top : none;
	border-left : none;
	border-right : none;
	border-bottom : 2px solid #ffb6c1;
	text-align: center;
}

.service_center_subButton {
	width: 960px;
	background-color: white;
	border : 1px solid #DDDDDD;
	outline : none;
}

.questionName {
	margin-top: 8px;
	margin-left: 6px;
	float: left;
	font-size : 14px;
}

#frequentlyList {
/* 	width: 100%; */
}

#frequently_page {
	display: flow-root;
	margin-bottom: 100px;
}

.serialNumber {
	float: left;
	margin-top : 10px;
	margin-bottom : 8px;
	margin-left : 5px;
	margin-right : 30px;
}

.downarrow {
	float: right;
	margin-top: 3.5px;
	margin-right: 10px;
	width : 30px;
}
#e {
	font-family: THE행복열매;
	font-weight: bolder;
	text-align: left;
	font-size: 40px;
	display: inline-block;
	margin-right : 293px;
}

#ea {
	border: 1px solid black;
	margin: 5px;
}
.FAQ_ANSWER {
	text-align: left;
}
#questionName4 {
	font-size : 20px;
	color : darkblue;
}
</style>
</head>
<body>
	<div id="serviceCenterDiv">
		<sec:authorize access="hasRole('ROLE_MEMBER')">
			<div>
				<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" />
			</div>
		</sec:authorize>
		<div id="service_center_menu">
			<div id="e">고객센터</div>
			<button id="service_center_service_1vs1">1:1 문의하기</button>
			<div id="ea"></div>
		</div>
		<div id="service_center_subMenu">
			<button id="service_center_frequently" class="service_center_mainBtn">
				<div>
					<label id="questionName4" class="questionName">자주 묻는 질문</label>
				</div>
			</button>

			<ul id="frequentlyList" class="example01" style="display: none;">
				<li>
					<div id="frequently_page">
						<button id="frequently1" class="service_center_subButton">
							<div>
								<h4 class="serialNumber">1</h4>
								<label id="questionName1" class="questionName">결제하려고 하는데 오류가 납니다.</label>
								<img class="downarrow" src="resources/downarrow.png">
							</div>
						</button>
						<ul id="frequentlyList1" class="example01" style="display: none;">
							<li>
								<pre class="FAQ_ANSWER">
√ 아래와 같은 경우 결제가 완료되지 않습니다:
1. 타임아웃 : 일시적인 오류로 결제 시간초과 상태, 잠시 후 재결제 시도
2. 카드정보 오류 : 카드번호, 비밀번호, CVC 정보 재확인
3. 할부개월수 : 체크카드, 기프트카드, 법인카드는 일시불만 결제 가능
4. 안심클릭, ISP결제 등 결제서비스 오류 : 해당 카드사 문의 카드사연락처확인하기
5. 카드오류 : 한도초과(잔액부족), 사용중지 등인 경우
								</pre>
							</li>
						</ul>
						<button id="frequently2" class="service_center_subButton">
							<div>
								<h4 class="serialNumber">2</h4>
								<label id="questionName2" class="questionName">전담 고객센터 연락처를 알고 싶어요.</label>
								<img class="downarrow" src="resources/downarrow.png">
							</div>
						</button>
						<ul id="frequentlyList2" class="example01" style="display: none;">
							<li>
								<pre class="FAQ_ANSWER">
√ 전담 고객센터 번호

구매고객 : 1566-5701 / 평일 오전9시~오후6시
판매고객 : 1566-5707 / 평일 오전9시~오후6시
스마일배송 : 1644-5718
스마일클럽 : 1522-5700 / 오전9시~오후6시 (연중무휴)
스마일페이 : 1644-0739 / 오전9시~오후11시 (연중무휴)
스마일박스 : 1644-5713
스마일카드: 1522-0080
G9 : 1644-5702
비즈온 : 1588-2194
E-티켓 : 1566-5702
국내/해외여행 : 1566-5705
렌탈전용 : 1644-5716
배달전용 : 1566-5708 / 오전10시~24시
해외배송 : 02-6277-6700
								</pre>
							</li>
						</ul>
						<button id="frequently3" class="service_center_subButton">
							<div>
								<h4 class="serialNumber">3</h4>
								<label id="questionName3" class="questionName">주문취소는 어떻게 하나요?</label>
								<img class="downarrow" src="resources/downarrow.png">
							</div>
						</button>
						<ul id="frequentlyList3" class="example01" style="display: none;">
							<li>
								<pre class="FAQ_ANSWER">
√ 나의쇼핑 > 전체주문내역 > 취소신청 클릭

결제대기, 결제완료, 배송요청 단계에서만 즉시취소가 가능합니다.
상품발송 이후에는 취소가 불가하기 때문에 배송완료일 7일이내에 반품으로 처리해야 합니다. (반품비 구매자 부담)

※ 결제수단별 환불소요 기간
1. 무통장입금 : 스마일캐시로 취소완료 즉시 / 내계좌로 환불 시 취소완료일 +2일(영업일 기준) 소요
2. 신용/체크카드 : 3~5일(영업일 기준) / 체크카드는 승인취소 후 해당계좌로 입금
3. 휴대폰소액결제 (스마일캐시로 환불되는 경우에는 즉시 확인 가능)
   - 결제월과 취소월이 같은 경우 : 3~5일(영업일 기준) 후 승인취소 (휴대폰요금 미청구)
   - 결제월과 취소월이 다른 경우 : 3~5일(영업일 기준) 후 스마일캐시로 환불 (휴대폰요금 합산청구)
								</pre>
							</li>
						</ul>
						<button id="frequently4" class="service_center_subButton">
							<div>
								<h4 class="serialNumber">4</h4>
								<label id="questionName5" class="questionName">무통장입금 주문건 환불은 어떻게 받나요?</label>
								<img class="downarrow" src="resources/downarrow.png">
							</div>
						</button>
						<ul id="frequentlyList4" class="example01" style="display: none;">
							<li>
								<pre class="FAQ_ANSWER">
√  취소/반품 신청 시 스마일캐시 또는 내 계좌로 환불 중 선택
								
스마일캐시 환불은 즉시처리되고 계좌환불은 취소완료일로부터 +1일(영업일 기준) 소요됩니다.
내 계좌로 환불 신청 시 계좌관리 버튼 클릭 후 본인명의 계좌등록 및 수정 가능합니다.

1. 스마일캐시 환불 : 나의쇼핑 > Smile Pay > Smile Cash 내역에서 환불금액 확인 및 출금신청 가능
2. 내 계좌로 환불 : 결제방법에 따라 계좌환불이 불가할 수 있고 나의쇼핑 > 전체주문내역에서 환불내역 확인 가능
※ 환불금에서 차감금액 발생 시 실제 환불금액과 최초 결제금액은 다를 수 있음
※ 환불예정액 또는 보유하고 있는 스마일캐시와 환불예정 금액의 합이 200만원 초과 시 스마일캐시 환불 불가

전체주문내역
Smile Cash 내역
계좌환불 불가 안내
스마일캐시 유의사항
								</pre>
							</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>

</body>
</html>
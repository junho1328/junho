<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<head>
<sec:authorize access="isAuthenticated()">                          <!--  로그인 했을 때 실행  -->
   <sec:authentication property="principal.username" var="user" /> <!-- principal 로그인 되어 있는 정보  -->
</sec:authorize>
 <script>
var loginId = '${user}'
$(document).ready(function(){
	
	var no = location.search.substr(6);
	console.log(no);
	$.ajax({
		url:"/fontExample/sell/findUsername/"+no,
		method : "get",
		success : function(result){
			findUsername = result;
			console.log(result);
			$("#declaration_username").text(result);
		}
	})
	
	$("#Declaration_button").click(function(){
		var params = {
				username : loginId,
				declaration_username : $("#declaration_username").text(),
				reason_no : $("#reason_no").val(),
				content : $("#content").val()
		}
		console.log(params)
		$.ajax({
			url: "/fontExample/api/declaration",
			method: 'post',
			data: params,
			success:function(result) {
				alert("신고가 되었습니다")
				location.href = "/fontExample/";
			},error:function(xhr) {
				alert("오류 발생");
			}
		})
	})
})
</script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>신고하기</title>
    <style>
        * {
            margin: 0 auto;
            padding: 0;
        }


        #reason_no {
            width: 635px;
            height: 45px;
        }

        #content {
            width: 635px;
            height: 100px;
        }

        #Declaration_button {
            width: 635px;
            height: 45px;
            background-color: #3498DB;
            color: white;
        }

        #Declaration_div {
            text-align: center;
        }
    </style>
</head>

<body>
    <h2><a href="#"><img src="resources/logo.png"></a></h2>
    <div id="Declaration_div">
        <br>
        <br>
        <h2>신고하기</h2>
    </div>
    <div>
        <br>
        <br>
        <form id="declarationForm">
        <table>
            <tr>
                <td>
                    <select id="reason_no">
                        <option name="Declaration_Advertising" value="1" >광고(상점홍보,낚시글,도배글)</option>
                        <option name="Declaration_Inaccuracy" value="2">물품정보 부정확</option>
                        <option name="Declaration_Prohibition" value="3">거래 금지 품목</option>
                        <option name="Declaration_Violence" value="4">언어폭력</option>
                        <option name="Declaration_Other" value="5">기타사유</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                   <br><input id="content" type="text" name="content" placeholder=" 신고사유을 적어주세요.">
                </td>

            </tr>
            <tr>
                <td>
               <input id="declaration_username" name="declaration_username" type="hidden">
               
                 
                </td>
            </tr>
        </table>
        </form>
        <br><button id="Declaration_button" type="button">신고</button>
    </div>
</body>
</html>
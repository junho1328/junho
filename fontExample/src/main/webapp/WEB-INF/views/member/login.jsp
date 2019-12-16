<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<script>
	$(document).ready(function() {
						$("#captchaTr").hide();
						var pagename = location.search.substr(1);
						if(pagename == 'login'){
							var msg = "";
							var captcha = "";
						}else{
							var msg = "${msg}";
							var captcha = "${captcha}";
							if(msg!="") {
								$("#alert").text(msg);
								$("#msg").show();
								if(captcha !=""){
									$("#captchaTr").show();
									createCaptcha();
								}
							}	
						}
						
						$("#findPwd_button").click(function() {
											var url = "certification?findPwd";
											var name = "본인확인";
											var option = "width = 620, height = 650, top = 100, left = 200, location = no";
											window.open(url, name, option);
										});
						$("#findId_button").click(function() {
											var url = "certification?findId";
											var name = "본인인증";
											var option = "width = 620, height = 650, top = 100, left = 200, location = no";
											window.open(url, name, option);
										});
						$("#login_login_button").click(function() {
											if($("#captchaTr").is(":visible")){
												validateCaptcha();
											}else{
												loginForm();	
											}
								});
						function loginForm(){
							var username = $("#username").val();
							var password = $("#password").val();
							var form = document.createElement("form");
							 form.setAttribute("charset", "UTF-8");
					         form.setAttribute("method", "post");  //Post 방식
					         form.setAttribute("action", "/fontExample/login"); //요청 보낼 주소
					         
					         var hiddenField = document.createElement("input");
					         hiddenField.setAttribute("type", "hidden");
					         hiddenField.setAttribute("name", "username");
					         hiddenField.setAttribute("value", username);
					         form.appendChild(hiddenField);

					         hiddenField = document.createElement("input");
					         hiddenField.setAttribute("type", "hidden");
					         hiddenField.setAttribute("name", "password");
					         hiddenField.setAttribute("value", password);
					         form.appendChild(hiddenField);

					         document.body.appendChild(form);
					         form.submit();
						}
						$("#password").keypress(function (e) {
					        enterKey(e);
					    });
						$("#cpatchaTextBox").keypress(function (e) {
					        enterKey(e);
					    });
						function enterKey(e){
							if (e.which == 13){
					        	if($("#captchaTr").is(":visible")){
					        		validateCaptcha();
								}else{
									loginForm();	
								}
					        }
						}
						var code;
						function createCaptcha() {
						  //clear the contents of captcha div first 
						  document.getElementById('captcha').innerHTML = "";
						  var charsArray =
						  "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@!#$%^&*";
						  var lengthOtp = 6;
						  var captcha = [];
						  for (var i = 0; i < lengthOtp; i++) {
						    //below code will not allow Repetition of Characters
						    var index = Math.floor(Math.random() * charsArray.length + 1); //get the next character from the array
						    if (captcha.indexOf(charsArray[index]) == -1)
						      captcha.push(charsArray[index]);
						    else i--;
						  }
						  var canv = document.createElement("canvas");
						  canv.id = "captcha";
						  canv.width = 100;
						  canv.height = 50;
						  var ctx = canv.getContext("2d");
						  ctx.font = "25px Georgia";
						  ctx.strokeText(captcha.join(""), 0, 30);
						  //storing captcha so that can validate you can save it somewhere else according to your specific requirements
						  code = captcha.join("");
						  document.getElementById("captcha").appendChild(canv); // adds the canvas to the body element
						}
						function validateCaptcha() {
						  event.preventDefault();
						  debugger
						  if (document.getElementById("cpatchaTextBox").value == code) {
							  loginForm();
						  }else{
						    alert("그림의 문자를 다시 입력해주세요");
						    createCaptcha();
						  }
						}

	});
</script>
<style>
* {
	margin: 0 auto;
	padding: 0;
}
#login_main{
	margin-bottom: 15px;
}
.loginInput {
	width: 300px;
	height: 35px;
}

a {
	color: gray;
}

#login_login_button {
	width: 300px;
	height: 40px;
	color: white;
	border-radius : 5px;
	margin-bottom : 40px;
	background-color: #ffb6c1;
	outline : none;
	font-weight: bold;
	font-size : 20px;
	border: none;
}

#cpatchaTextBox {
    padding: 5px;
    display: inline-block;
    box-sizing: border-box;
    margin-bottom : 5px;
}
#captchaBtn{
  	background-color: #4CAF50;
    color: white;
    padding: 12px 30px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
}
#username,
#password {
	margin-bottom : 20px;
}
#findId_button,
#findPwd_button,
#join_button {
	display: inline-block;
	font-size : 13px;
	margin-top : 5px;
}
.bottom_td {
	text-align : center;
}
#bottom_tr {
	border-top : 1px solid #DDDDDD;
}
#msg {
	background-color: #ffb6c1;
	border : 1px solid #ffb6c1;
	color : black;
}
#chptchaWarP {
	color : red;
	font-size: 13px;
	margin : 0;
}
</style>
</head>

<body>
	<div class="alert alert-success alert-dismissible" id="msg" style="display:none;">
    	<a id="close_button" href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>서버 메시지 </strong><span id="alert"></span>
  	</div>
	<div id="login_main">
		<div id="info">
			<table>
				<tr>
					<td colspan="3">
						<img style="margin-top : 30px; width : 100%;" src="resources/logo.png">
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input id="username" type="text" name="username" class="loginInput" placeholder="아이디를 입력하세요." />
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input id="password" type="password" name="password" class="loginInput" placeholder="비밀번호를 입력하세요." />
					</td>
				</tr>
				<tr id="captchaTr">
					<td colspan="3">
						<p id="chptchaWarP">아래 이미지를 보이는 대로 입력해주세요.</p>
    					<div id="captcha">
    					</div>
    					<input type="text" placeholder="Captcha" id="cpatchaTextBox" class="loginInput"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<button id="login_login_button">로그인</button>
					</td>
				</tr>	
				<tr id="bottom_tr">
					<td class="bottom_td"><a href="#" id="findId_button">아이디 찾기</a></td>
					<td class="bottom_td"><a href="#" id="findPwd_button">비밀번호 찾기</a></td>
					<td class="bottom_td"><a href="/fontExample/join" id="join_button">회원가입</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>

</html>
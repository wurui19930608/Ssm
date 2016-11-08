<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../taglib.jsp" %>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>登录 - 千寻 - Thousands Find</title>
	<link rel="stylesheet" type="text/css" href="${path}/assets/css/register-login.css">
	<style>
		.registe{
			display: none;
		}
	</style>
</head>

<body>
<div id="box"></div>
<div class="cent-box">
	<div class="cent-box-header">
		<h1 class="main-title hide">千寻</h1>
		<h2 class="sub-title">生活热爱分享 - Thousands Find</h2>
	</div>

	<div class="cont-main clearfix">
		<div class="index-tab">
			<div class="index-slide-nav">
				<a href="javascript:void (0);" class="active">登录</a>
				<a href="javascript:void (0);" class="register">注册</a>
				<div class="slide-bar"></div>				
			</div>
		</div>
		<div class="login">
			<div class="login form">
				<div class="group">
					<div class="group-ipt l_mobile">
						<input onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" name="l_mobile" id="l_mobile" class="ipt" placeholder="手机号码" required>
					</div>
					<div class="group-ipt l_password">
						<input type="password" name="l_password" id="l_password" class="ipt" placeholder="输入您的登录密码" required>
					</div>
				</div>
			</div>
			<div class="button">
				<button type="submit" class="login-btn register-btn" id="login">登录</button>
			</div>
			<div class="remember clearfix">
				<label class="remember-me"><span class="icon"><span class="zt"></span></span><input type="checkbox" name="remember-me" id="remember-me" class="remember-mecheck" checked>记住我</label>
				<label class="forgot-password">
					<a href="#">忘记密码？</a>
				</label>
			</div>
		</div>

		<div class="registe">
			<div class="login1 form">
				<div class="group">
					<div class="group-ipt r_mobile">
						<input onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" name="r_mobile" id="r_mobile" class="ipt" placeholder="手机号码" required>
					</div>
					<div class="group-ipt r_username">
						<input type="text" name="r_username" id="r_username" class="ipt" placeholder="输入一个用户名" required>
					</div>
					<div class="group-ipt r_password">
						<input type="password" name="r_password" id="r_password" class="ipt" placeholder="设置登录密码" required>
					</div>
					<%--<div class="group-ipt r_password1">
						<input type="password" name="r_password1" id="r_password1" class="ipt" placeholder="重复密码" required>
					</div>--%>
				</div>
			</div>
			<div class="button">
				<button type="submit" class="login-btn register-btn" id="register">注册</button>
			</div>
		</div>
	</div>
</div>

<div class="footer">

</div>

<script src='${path}/assets/js/particles.js' type="text/javascript"></script>
<script src='${path}/assets/js/background.js' type="text/javascript"></script>
<script src='${path}/assets/js/jquery.min.js' type="text/javascript"></script>
<script src='${path}/assets/js/layer/layer.js' type="text/javascript"></script>
<script>
	/*登录*/
	$("#login").click(function () {
		var mobile = document.getElementById("l_mobile").value;
		var password = document.getElementById("l_password").value;
		var postForm = document.createElement("form");//表单对象
		postForm.method="post" ;
		postForm.action = '${path}/login.do' ;
		var emailInput = document.createElement("input") ; //email input
		emailInput.setAttribute("name", "mobile") ;
		emailInput.setAttribute("value", mobile);
		postForm.appendChild(emailInput) ;
		var pwdInput = document.createElement("input");// password input
		pwdInput.setAttribute("name","password");
		pwdInput.setAttribute("value",password);
		postForm.appendChild(pwdInput);
		document.body.appendChild(postForm) ;
		postForm.submit() ;
		document.body.removeChild(postForm) ;
	});
	/*注册*/
	$("#register").click(function () {
		var userName = document.getElementById("r_username").value;
		var password = document.getElementById("r_password").value;
		var mobile = document.getElementById("r_mobile").value;
		$.ajax({
			url : '${path}/register.do',
			data:{
				userName : userName,
				password : password,
				mobile : mobile
			},
			type : "post",
			success : function(data) {
				alert(data.msg);
				window.location.href = '${path}/toLogin.do';
			},
			error : function() {
				alert("ajax失败！");
			}
		});
	});


	/*记住我*/
	$("#remember-me").click(function(){
		var n = document.getElementById("remember-me").checked;
		if(n){
			$(".zt").show();
		}else{
			$(".zt").hide();
		}
	});
	/*切换开始*/
	$(".active").click(function(){
		$(".login").show();
		$(".registe").hide();
		$(".slide-bar").css("left","0");
	});

	$(".register").click(function(){
		$(".login").hide();
		$(".registe").css("display","block");
		$(this).addClass("active");
		$(".active").removeClass("active");
		$(".slide-bar").css("left","4em");

	});
	/*切换结束*/
</script>
</body>
</html>
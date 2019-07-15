<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="UTF-8">
		<title>会员登录</title>
		<link rel="stylesheet" type="text/css" href="./css/login.css">
		<%@ include file="/web/header.jsp"%>
	</head>
	<body>
		<!-- login -->
		<div class="top center">
			<div class="logo center">
				<a href="./index.jsp" target="_blank"><img src="./image/mistore_logo.png" alt=""></a>
			</div>
		</div>
		<form  method="post" action="" class="layui-form layui-form-pane">
		<div class="login">
			<div class="login_center">
				<div class="login_top">
					<div class="left fl">会员登录</div>
					<div class="right fr">您还不是我们的会员？<a href="./register.jsp" target="_self">立即注册</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="login_main center">
					<div class="username">账号：&nbsp;<input class="shurukuang" type="text" name="code" placeholder="请输入你的账号"/></div>
					<div class="username">密码：&nbsp;<input class="shurukuang" type="password" name="pass" placeholder="请输入你的密码"/></div>
					<div class="username">
						<div class="left fl"><input class="yanzhengma" type="text" name="verification" placeholder="请输入验证码"/></div>
						<div class="right fl"><img class="layui-input" src="/B2C/AuthCodeServlet" alt="刷新" onclick="this.src='/B2C/AuthCodeServlet?'+Math.random();" /></div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="login_submit">
					<input class="submit" type="button" lay-submit lay-filter="login" value="立即登录" >
				</div>
				
			</div>
		</div>
		</form>
		<script type="text/javascript">

formSubmit('/user/login.do','submit(login)','text',function(data){
	alert(data)
	if(data == 1){
		layer.msg('登录成功');
	//	$("input[type='reset']").click();
		location.href = '/B2C/xiaomi/index.jsp';
	}else if(data == 0){
		layer.msg('账号为空');
	}else{
		layer.msg('错误');
	}
})
</script>
		<footer>
			<div class="copyright">简体 | 繁体 | English | 常见问题</div>
			<div class="copyright">小米公司版权所有-京ICP备10046444-<img src="./image/ghs.png" alt="">京公网安备11010802020134号-京ICP证110507号</div>

		</footer>
	</body>
</html>
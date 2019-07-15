<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="UTF-8">
		<title>用户注册</title>
		<link rel="stylesheet" type="text/css" href="./css/login.css">
	<%@ include file="/web/header.jsp"%>
	</head>
	<body>
		<form  method="post" class="layui-form layui-form-pane" action="">
		<div class="regist">
			<div class="regist_center">
				<div class="regist_top">
					<div class="left fl">会员注册</div>
					<div class="right fr"><a href="./index.jsp" target="_self">小米商城</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="regist_main center">
				<div class="username">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:&nbsp;&nbsp;<input class="shurukuang" type="text" name="code" placeholder="请输入你的账号"/><span></span></div>
					<div class="username">用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;<input class="shurukuang" type="text" name="name" placeholder="请输入你的用户名"/><span>请不要输入汉字</span></div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="pass" placeholder="请输入你的密码"/><span>请输入6位以上字符</span></div>
					
					<div class="username">
						<div class="left fl">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="yanzhengma" type="text" name="verification" placeholder="请输入验证码"/></div>
						<div class="right fl"><img class="layui-input" src="/B2C/AuthCodeServlet" alt="刷新" onclick="this.src='/B2C/AuthCodeServlet?'+Math.random();" /></div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="regist_submit">
					<input class="submit" type="button" lay-submit lay-filter="reg" value="立即注册" >
				</div>
				
			</div>
		</div>
		<input type="hidden" name="isManage" value="1" />
		</form>
		
		<script type="text/javascript">
formSubmit('/user/reg.do','submit(reg)','text',function(data){
	if(data == 1){
		layer.msg('用户注册成功');
//		$("input[type='reset']").click();
//		location.href = '/B2C/xiaomi/login.jsp';
	}else if(data == 0){
		layer.msg('账号不存在');
	}else{
		layer.msg('密码错误');
	}
})
		
</script>
</body>
</html>
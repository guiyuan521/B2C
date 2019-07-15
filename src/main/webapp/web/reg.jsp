<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/web/header.jsp" %>
<title>注册界面</title>
</head>
<body>
	<fieldset class="layui-elem-field" 
	style="margin:20px;padding:20px;">
		<legend>欢迎注册</legend>
		<div class="layui-field-box">
		<form class="layui-form layui-form-pane"  method="post" >			
			<div class="layui-form-item">
				<label class="layui-form-label">账号:</label>
				<div class="layui-input-inline">
					<input type="text" name="code" class="layui-input" 
					lay-verify="request" placeholder="请输入账号"  required autocomplete="off"/><br>
				</div>
			</div>
		
			<div class="layui-form-item">
				<label class="layui-form-label">密码:</label>
				<div class="layui-input-inline">
					<input type="password" name="pass" class="layui-input" 
					lay-verify="request" placeholder="请输入密码"  required autocomplete="off"/><br>
				</div>
			</div>
		
			<div class="layui-form-item">
				<label class="layui-form-label">用户名:</label>
				<div class="layui-input-inline">
					<input type="text" name="name" class="layui-input" 
					lay-verify="request" placeholder="请输入用户名"  required autocomplete="off"/><br>
				</div>
			</div>
		
		
			<div class="layui-form-item">
				<label class="layui-form-label">验证码</label>
				<div class="layui-input-inline">
					<img class="layui-input" src="/B2C/AuthCodeServlet" alt="刷新" onclick="this.src='/B2C/AuthCodeServlet?'+Math.random();" />
					<input class="layui-input" type="text" name="verification">
				</div>
			</div>
		
			<div class="layui-form-item">
				<div class="layui-input-inline">
					<input class="layui-btn " type="button" value="注册"  lay-submit lay-filter="reg"/>
					<input class="layui-btn layui-btn-primary" type="reset" value="重置" />
				</div>
					<input class="layui-btn" type="button" value="返回登录" onclick="login()"/> 
			</div>
			<input type="hidden" name="isManage" value="0" />
		</form>
		</div>
	</fieldset>

<script type="text/javascript">
formSubmit('/user/reg.do','submit(reg)','text',function(data){
	if(data == 1){
		layer.msg('管理员注册成功');
		$("input[type='reset']").click();
	}else if(data == 0){
		layer.msg('账号不存在');
	}else{
		layer.msg('密码错误');
	}
})
	function login(){
		location.href="/B2C/web/login.jsp";
	}
		
</script>
</body>
</html>
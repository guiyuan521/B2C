<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/web/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登录</title>
<style type="text/css">
.window{
	width:400px;
	position:absolute;
	margin-left:-50px;
	margin-top:-50px;
	top:30%;
	left:30%;
	display:block;
	z-index:2000;
	background：#fff;
	padding:20 0;
}
</style>
</head>
<body>
<fieldset class="window" style="margin:20px;padding:20px;">
		<legend>登录</legend>
		<div class="layui-field-box">
			<form class="layui-form layui-form-pane"  method="post" >
				<div class="layui-form-item">
					<label class="layui-form-label">账号:</label>
				<div class="layui-input-inline">
					<input type="text" name="code" class="layui-input" /><br>
				</div>
			</div>
		
			<div class="layui-form-item">
				<label class="layui-form-label">密码:</label>
				<div class="layui-input-inline">
					<input type="password" name="pass" class="layui-input" /><br>
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
				<input class="layui-btn" type="button" value="登录" lay-submit lay-filter="login"/>
				<input class="layui-btn layui-btn-primary" type="reset" value="重置" />
			</div>	
				<input name="login" type="button" class="layui-btn" onclick="reg()" value="返回注册"/> 
		</div>	
	</form>
	</div>
</fieldset>
<script type="text/javascript">

formSubmit('/user/login.do','submit(login)','text',function(data){
	alert(data)
	if(data == 1){
		layer.msg('登录成功');
	//	$("input[type='reset']").click();
		location.href = '/B2C/web/main.jsp';
	}else if(data == 0){
		layer.msg('为空');
	}else{
		layer.msg('错误');
	}
})
function reg(){
 	location.href="/B2C/web/reg.jsp";
 }

</script>
</body>
</html>
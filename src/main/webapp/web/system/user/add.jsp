<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/web/header.jsp"%>
<title>用户维护</title>
</head>
<body>
	<fieldset class="layui-elem-field" style="margin: 20px; padding: 15px;">
		<legend>用户维护--添加信息</legend>

		<form class="layui-form" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">账号</label>
				<div class="layui-input-inline">
					<input type="text" name="code" lay-verify="required"
						placeholder="请输入账号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline">
					<input type="password" name="pass" lay-verify="required"
						placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-inline">
					<input type="text" name="name" placeholder="请输入姓名"
						autocomplete="off" class="layui-input">
				</div>
			</div>


			<div class="layui-form-item">
				<label class="layui-form-label"></label>
				<div class="layui-input-inline">
					<input type="button" class="layui-btn" lay-submit
						lay-filter="addUser" value="确定" /> 
					<input type="button" class="layui-btn" onclick="closeThis()" 
							value="取消" />
				</div>
			</div>
			<input type="hidden" name="action" value="add" />
		</form>
	</fieldset>
	<script type="text/javascript">
		formSubmit('/user/add.do', 'submit(addUser)', 'text',
				function(data) {
					if (data == 0) {
						layer.msg('添加成功');
						closeThis(1000);
					} else if (data == 1) {
						layer.msg('账号已存在');
					} else {
						layer.msg('添加失败');
					}
				});
	</script>


</body>
</html>
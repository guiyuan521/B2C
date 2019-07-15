<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/web/header.jsp"%>
<title>添加分类信息</title>
</head>
<body>
	<fieldset class="layui-elem-field" style="margin: 20px; padding: 15px;">
		<legend>商品维护--添加分类</legend>
		<form class="layui-form">
		
			<div class="layui-form-item" >
				<label class="layui-form-label">所属分类</label>
				<div class="layui-input-inline">
					<select name="parentCode" layui-search></select>
				</div>
			</div>
			
			<div class="layui-form-item" >
				<label class="layui-form-label">商品编号</label>
				<div class="layui-input-inline">
					<input type="text" name="code" required lay-verify="required"
						placeholder="请输入商品编号" autocomplete="off" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item" >
				<label class="layui-form-label">商品名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" required lay-verify="required"
						placeholder="请输入商品名称" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item" >
				<label class="layui-form-label">商品描述</label>
				<div class="layui-input-inline">
					<input type="text" name="descr" required lay-verify="required"
					placeholder="请输入商品描述" autocomplete="off" class="layui-input">
				</div>
			</div>


			<div class="layui-form-item" >
				<label class="layui-form-label"></label>
				<div class="layui-input-inline">
					<input type="button" class="layui-btn" lay-submit lay-filter="add"
						value="确定" /> <input type="button" class="layui-btn"
						onclick="closeThis()" value="取消" />
				</div>
			</div>
		</form>
	</fieldset>
<script type="text/javascript">
form.render();//渲染
	formSubmit('/classification/add.do', 'submit(add)', 'text', 
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
ajax("/classification/select.do",{action:'select'},"json",function(data){
	var html = "<option >无</option>";
	$.each(data,function(i,d){
		html+=laytpl($('#opt').html()).render(d);
	})
	$("select[name='parentCode']").html(html);
	form.render()
});
</script>
<script type="text/html" id='opt'>
	<option value='{{d.code}}'> {{d.name}} </option>
</script>
</body>
</html>
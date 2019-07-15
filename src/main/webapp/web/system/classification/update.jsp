<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/web/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品修改</title>
</head>
<body>
<fieldset class="layui-elem-field" style="margin: 20px; padding: 15px;">
		<legend>商品类型维护--修改信息</legend>
		<form class="layui-form" lay-filter="upddic" method="post">	
		
		   <div class="layui-form-item">
				<label class="layui-form-label">所属分类</label>
				<div class="layui-input-inline">
					<select name="parentCode" layui-search>
					</select>
				</div>
			</div>	
				
			<div class="layui-form-item" >
				<label class="layui-form-label">商品编号</label>
				<div class="layui-input-inline">
					<input type="text" name="code"  required lay-verify="required"
						placeholder="请输入商品编号" autocomplete="off"  class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">商品名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" required lay-verify="required"
					  placeholder="请输入商品名称" autocomplete="off" class="layui-input">
				</div>
			</div>
			
            <div class="layui-form-item">
				<label class="layui-form-label">商品描述</label>
				<div class="layui-input-inline">
					<input type="text" name="descr"  required lay-verify="required"
					placeholder="请输入商品描述" autocomplete="off" class="layui-input">
				</div>
			</div>
		
			<div class="layui-form-item">
				<label class="layui-form-label"></label>
				<div class="layui-input-inline">
					<input type="button" class="layui-btn" lay-submit lay-filter="upd" value="确定" /> 
					<input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
				</div>
			</div>		
		</form>
	</fieldset>
<script type="text/javascript">
init()
function init(){
    var code = '<%=request.getParameter("code")%>';
	$.ajax({
        url:con.app+'/classification/search.do',
        data : {code:code},
        dataType : 'json',
        type : 'post',
        success : function(data) {
        	form.val("upddic", 
        		{code: data.code,
        		name: data.name,
        		parentCode: data.parentCode,
        		descr: data.descr})
        }
    })
}
//提交修改
formSubmit('/classification/update.do', 'submit(upd)', 'json', function(data) {
	alert("success")
	if (data == 1) {
        layer.msg('修改成功');
        closeThis(1000);
    } else {
        layer.msg('修改失败');
    }
});
ajax('/classification/select.do','', 'json', function(data){
	var html='';
	$.each(data,function(i,d){
		html+=laytpl($('#opt').html()).render(d);
	})
	$("select[name='parentCode']").html(html);
	form.render();
})
</script>
<script type="text/html" id="opt">
   <option value='{{d.code}}'>{{d.name}}</option>
</script>
<script type="text/javascript">
		layui.use("form", function() {
			var form = layui.form;
			form.render();
		})
</script>

</body>
</html>
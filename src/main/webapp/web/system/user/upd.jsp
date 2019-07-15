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
	<fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>用户维护--修改信息</legend>
    <form class="layui-form" lay-filter="upduser" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="code" lay-verify="required" placeholder="请输入账号" autocomplete="off"
                    class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name"  placeholder="请输入姓名" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" lay-submit lay-filter="updUser" value="修改" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
    </form>
    </fieldset>
<script type="text/javascript">
init();
function init(){
    var code = '<%=request.getParameter("code")%>';  
	ajax('/user/selectByCode.do',{code:code},'json', function(data) {
     form.val("upduser", {name: data.name,code: data.code})
		form.render();//渲染
    })
}
formSubmit('/user/upd.do','submit(updUser)','text', function(data) {
	if (data == 1) {
        layer.msg('修改成功');
        closeThis(1000);
    } else {
        layer.msg('修改失败');
    }
});
</script>

</body>
</html>
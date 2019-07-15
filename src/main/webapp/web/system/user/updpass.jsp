<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/web/header.jsp"%>
<title>修改密码</title>
</head>
<body>
<fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>用户维护--修改密码</legend>
    
    <form class="layui-form" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="code" readonly lay-verify="required" placeholder="请输入账号" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="pass" lay-verify="required" placeholder="请输入新密码" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" lay-submit lay-filter="passUser" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
        <input type="hidden" name="action" value="pasUser" />
    </form>
    </fieldset>
    <script type="text/javascript">
    $("input[name='code']").val('<%=request.getParameter("code")%>');
//     $("input[name='code']").prop("readonly","readonly");

    formSubmit('/user/updPass.do', 'submit(passUser)', 'text', function(data) {
    //	alert(data)
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
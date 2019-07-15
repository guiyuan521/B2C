<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/web/header.jsp" %>
<link rel="stylesheet" src="/web/common/layui/css/layui.css" type="text/css">
<title>后台维护</title>
</head>
<body class="layui-layout-body">
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
				<div class="layui-logo">后台维护</div>
				<ul class="layui-nav layui-layout-right">
					<li class="layui-nav-item">
						<a href="javascript:;"><img src="" class="layui-nav-img" />${user.name}</a>
						<dl class="layui-nav-child">
							<dd><a href="">基本资料</a></dd>
							<dd><a href="">安全设置</a></dd>
						</dl>
					</li>
<!-- 					跳转到自己定义的注销方法，在common.js中 -->
					<li class="layui-nav-item"><a href="javascript:openUrl('/B2C/web/login.jsp');">注销</a></li>
				</ul>
			</div>
			<div class="layui-side layui-bg-black">
				<div class="layui-side-scroll">

					<ul class="layui-nav layui-nav-tree" lay-filter="test">
						<li class="layui-nav-item layui-nav-itemed">
							<a class="" href="javascript:;">系统管理</a>
							<dl class="layui-nav-child">
								<dd><a href="javascript:openUrl('/B2C/web/system/user/list.jsp');">用户信息维护</a></dd>
							</dl>
						</li>
					</ul>
					
					<ul class="layui-nav layui-nav-tree" lay-filter="test">
						<li class="layui-nav-item layui-nav-itemed">
							<a class="" href="javascript:;">商品管理</a>
							<dl class="layui-nav-child">
								<dd><a href="javascript:openUrl('/B2C/web/system/classification/list.jsp');">商品分类维护</a></dd>
								<dd><a href="javascript:openUrl('/B2C/web/system/information/list.jsp');">商品信息维护</a></dd>
							</dl>
						</li>
					</ul>
					<ul class="layui-nav layui-nav-tree" lay-filter="test">
						<li class="layui-nav-item layui-nav-itemed">
							<a class="" href="javascript:;">订单管理</a>
							<dl class="layui-nav-child">
								<dd><a href="javascript:openUrl('/B2C/web/system/order/list.jsp');">订单信息维护</a></dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>

			<div class="layui-body">
				<!-- 内容主体区域 -->
				<div style="padding: 15px;">欢迎登陆</div>
				<iframe name="rightframe" width="98%" height="99%" src="/B2C/web/system/user/list.jsp"></iframe>
			</div>

			<div class="layui-footer">
				<!-- 底部固定区域 -->
				欢迎！！！
			</div>
		</div>
		<script type="text/javascript" src="<%=path %>/layui/layui.all.js"></script>
		<script>
		
// 		site-demo-active是自己定义的一个class
// 		$('site-demo-active').click(function(){
// 			window.open(con.app)+$(this).data('url'),"rightframe")
// 		})
		
			//JavaScript代码区域
			function openUrl(url) {
				window.open(url, "rightframe")
			}
			layui.use('element', function() {
				var element = layui.element;
			});
		</script>
	</body>
</html>
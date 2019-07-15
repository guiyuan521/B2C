<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/web/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息表</title>
</head>
<body>
	<div class="layui-collapse">
		<div class="layui-colla-item">
			<h2 class="layui-colla-title">用户信息</h2>
			<div class="layui-colla-content layui-show">
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 0px; padding: 5px">
					<legend>用户信息-查询条件</legend>
					<form class="layui-form">
						<div class="layui-form-item">
							<label class="layui-form-label">账号</label>
							<div class="layui-input-inline">
								<input type="text" name="code" placeholder="请输入账号"
									autocomplete="off" class="layui-input">
							</div>
							<label class="layui-form-label">姓名</label>
							<div class="layui-input-inline">
								<input type="text" name="name" placeholder="请输入姓名"
									autocomplete="off" class="layui-input">
							</div>
							<label class="layui-form-label"></label> <span> 
							<input type="button" 
								class="layui-btn" lay-submit lay-filter="user_search" value="查询" /> 
							<input type="reset"
								class="layui-btn" value="重置" /> 
							<input type="button"
								class="layui-btn" value="添加" onclick="openUserAdd()" />
							</span>
						</div>
						<input 
							type="hidden" name="action" value="list" /> 
						<input
							type="hidden" name="pageIndex" value="1" /> 
						<input 
							type="hidden" name="pageLimit" value="10" />
					</form>
				</fieldset>
			</div>
		</div>
	</div>
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="10%">
				<col width="30%">
				<col width="30%">
				<col width="30%">
			</colgroup>
			<thead>
				<tr>
					<th>序号</th>
					<th>账号</th>
					<th>姓名</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="user_tbody"></tbody>
		</table>
		<!-- 		写一个div，留作分页使用 -->
		<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>
	</div>
	<script type="text/javascript" src="<%=path%>/layui/layui.all.js"></script>
	<script type="text/javascript">
		// 引用common.js里的formSubmit方法，用于表格的提交 对应查询 lay-filter="user_search"
		//data是java端往网页端返回的数据 data.count data.list
		formSubmit('/user/selectModel.do', 'submit(user_search)', 'json',
				function(data) {
					var curr = $("input[name='pageIndex']").val();
					var limit = $("input[name='pageLimit']").val();
					setPageInfo('pageInfoUser', data.count, curr, limit,
							function(obj, first) {
								$("input[name='pageIndex']").val(obj.curr);
								$("input[name='pageLimit']").val(obj.limit);
								if (!first) {
									refresh();
								}//首次不执行
							})
					var html = ""; //加载表格中数据
					//data.list list里面存放的是java返回来的数据
					$.each(data.list, function(i, dom) {
						var code = dom.code ? dom.code : '';
						var name = dom.name ? dom.name : '';
						var d = {
							i : (i + 1 + (curr - 1) * limit),
							name : name,
							code : code
						};
						html += getlaytpl('#tradd', d);// html += laytpl($("#tradd").html()).render(d);
					});
					$("#user_tbody").html(html);
				});
		refresh();
		function refresh() {
			$("input[value='查询']").click();
		}
		function openUserAdd() {
			openLayer('/web/system/user/add.jsp', refresh)
		}
		function openUserUpd(code) {
			openLayer('/web/system/user/upd.jsp?code=' + code, refresh)
		}
		function openUserPass(code) {
			openLayer('/web/system/user/updpass.jsp?code=' + code, refresh)
		}
		function openPic(code) {
			openLayer('/web/system/user/pic.jsp?code=' + code, refresh)
		}
		function delUser(code) {
			openConfirm(function(index) {
				ajax('/user/del.do', {code:code}, 'text', function(data) {
					if (data == 1) {
						layer.msg('删除成功');
						$("input[name='pageIndex']").val(1);
						refresh();
					} else if (data == 2) {
						layer.msg('删除失败--账号已被使用');
					} else if (data == 3) {
						layer.msg('删除失败--当前账号不允许删除');
					}
				})
			})
		}
	</script>
<script id="tradd" type="text/html">
<tr>
	<td>{{ d.i }}</td>
	<td>{{ d.code }}</td>
	<td>{{ d.name }}</td>
	<td>
    	<input type='button' value='修改'  class='layui-btn' 
           onclick='openUserUpd("{{ d.code }}")'/>&nbsp;

    	<a href="javascript:delUser('{{ d.code }}')" 
      	 class="layui-btn layui-btn-xs layui-btn-danger">
        	<i class="layui-icon layui-icon-delete"></i></a>&nbsp;

    	<input type='button' class='layui-btn' value='重置密码' 
           onclick='openUserPass("{{ d.code }}")'/>&nbsp;
	
	 	 <input type='button' class='layui-btn' value='头像' 
           onclick='openPic("{{ d.code }}")'/>
	</td>
</tr>
</script>
</body>
</html>
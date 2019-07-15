<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/web/header.jsp"%>
<title>商品分类</title>
</head>
<body>
	<div class="layui-collapse">
		<div class="layui-colla-item">
			<h2 class="layui-colla-title">商品信息</h2>
			<div class="layui-colla-content layui-show">
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 0px; padding: 5px">
					<legend>商品信息-查询条件</legend>
					<form class="layui-form">
						<div class="layui-form-item">
							<label class="layui-form-label">编号</label>
							<div class="layui-input-inline">
								<input type="text" name="code" placeholder="请输入编号"
									autocomplete="off" class="layui-input">
							</div>
							<label class="layui-form-label">名称</label>
							<div class="layui-input-inline">
								<input type="text" name="name" placeholder="请输入名称"
									autocomplete="off" class="layui-input">
							</div>
							<label class="layui-form-label">上级编号</label>
							<div class="layui-input-inline">
								<input type="text" name="parentCode" placeholder="请输入上级编号"
									autocomplete="off" class="layui-input">
							</div>
							<label class="layui-form-label">描述</label>
							<div class="layui-input-inline">
								<input type="text" name="descr" placeholder="请输入描述"
									autocomplete="off" class="layui-input">
							</div>
							<label class="layui-form-label"></label> <span> 
							<input type="button" 
								class="layui-btn" lay-submit lay-filter="search" value="查询" /> 
							<input type="reset"
								class="layui-btn" value="重置" /> 
							<input type="button"
								class="layui-btn" value="添加" onclick="openAdd()" />
							</span>
						</div>	
						<input type="hidden" name="pageIndex" value="1" /> 
						<input type="hidden" name="pageLimit" value="10" />
					</form>
				</fieldset>
			</div>
		</div>
	</div>
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="20%">
				<col width="20%">
				<col width="30%">
			</colgroup>
			<thead>
				<tr>
					<th>序号</th>
					<th>编号</th>
					<th>名称</th>
					<th>上级编号</th>
					<th>描述</th>
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
		formSubmit('/classification/selectModel.do', 'submit(search)', 'json',
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
						var parentCode = dom.parentCode ? dom.parentCode : '';
						var descr = dom.descr ? dom.descr : '';
						var d = {
							i : (i + 1 + (curr - 1) * limit),
							name : name,
							code : code,
							parentCode : parentCode,
							descr : descr
						};
						html += getlaytpl('#tradd', d);// html += laytpl($("#tradd").html()).render(d);
					});
					$("#user_tbody").html(html);
				});
		refresh();
		function refresh() {
			$("input[value='查询']").click();
		}
		function openAdd() {
			openLayer('/web/system/classification/add.jsp', refresh)
		}
		function openUpd(code) {
			openLayer('/web/system/classification/update.jsp?code=' + code, refresh)
		}
		function del(code) {
			openConfirm(function(index) {
				ajax('/classification/delete.do', {code:code}, 'text', function(data) {
					if (data == 1) {
						layer.msg('删除成功');
						$("input[name='pageIndex']").val(1);
						refresh();
					} else  {
						layer.msg('删除失败');
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
	<td>{{ d.parentCode }}</td>
	<td>{{ d.descr }}</td>
	<td>
    	<input type='button' value='修改'  class='layui-btn' 
           onclick='openUpd("{{ d.code }}")'/>&nbsp;
    	<a href="javascript:del('{{ d.code }}')" 
      	 class="layui-btn layui-btn-xs layui-btn-danger">
        	<i class="layui-icon layui-icon-delete"></i></a>&nbsp;
	</td>
</tr>
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
		<%@ include file="/web/header.jsp"%>
</head>
<body>
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="20%">
				<col width="20%">
				<col width="20%">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>序号</th>
					<th>订单编号</th>
					<th>商品名称</th>
					<th>购买数量</th>
					<th>价格</th>
				</tr>
			</thead>
			<tbody id="user_tbody"></tbody>
		</table>
	</div>
</body>
<script type="text/javascript">
refresh()
function refresh() {
	var orderCode = '<%= request.getParameter("code")%>';	
	ajax('/orderGoods/list.do',{orderCode:orderCode} ,'json', function(data) {
		console.log(data)
	    var html = "";// 加载表格中数据
		$.each(data.list, function(i, dom) {
			var orderCode = dom.orderCode ? dom.orderCode : '';
			var inforCode = dom.inforCode ? dom.inforCode : '';	
			var sum = dom.sum ? dom.sum : '';
			var price = dom.price  ? dom.price  : '';
			var id = dom.id;
			var d = {
				id:id,
				orderCode : orderCode,
				inforCode : inforCode,
				sum : sum,
				price :price 
			};
			html += getlaytpl('#tradd', d);
		});
		$("#user_tbody").html(html);
	} );
		
	}
	</script>
<script id="tradd" type="text/html">
<tr>
<td>{{ d.id }}</td><td>{{ d.orderCode}}</td><td>{{ d.inforCode}}</td>
<td>{{ d.sum}}</td><td>{{ d.price}}</td>
</tr>
</script>
</html>
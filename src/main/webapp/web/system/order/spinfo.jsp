<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>商品维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>商品维护--修改信息</legend>
    <form class="layui-form" lay-filter="spinfo" method="post">
			
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
        
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
    </form>
    </fieldset>
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
function del(orderCode){
	openConfirm(function(index){
		ajax('/orderGoods/del.do', {orderCode:orderCode}, 'text', function(data){
	        if (data == 1) {
	        	layer.msg('删除成功');
	        	refresh();
	        } else {
                layer.msg('删除失败');
            }
	    })
	})
}
</script>
<script id="tradd" type="text/html">
<tr>
<td>{{ d.id }}</td><td>{{ d.orderCode}}</td><td>{{ d.inforCode}}</td>
<td>{{ d.sum}}</td><td>{{ d.price}}</td>
</tr>
<td>
    <input type='button' value='删除'  class='layui-btn' onclick='del("{{d.orderCode}}")'/>&nbsp;
</td>
</script>
</body>
</html>
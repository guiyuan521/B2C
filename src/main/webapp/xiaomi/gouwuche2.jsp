<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<%@ include file="/web/header.jsp"%>
<title>确认订单</title>
</head>
<body>
<input type="hidden" name="userCode" value="${user.code }">
<div class="banner_x center">
		<a href="./index.jsp" target="_blank"><div class="logo fl"></div></a>

		<div class="gouwuche fr"><a href="./gouwuche.jsp">购物车</a></div>
		<div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
		<div class="dlzc fr">
			<ul>
				<li><a href="./login.jsp" target="_blank">登录</a></li>
				<li>|</li>
				<li><a href="./register.jsp" target="_blank">注册</a></li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	
	<div class="xiantiao"></div>
		<div class="gwcxqbj">
			<div class="gwcxd center">
			
				<div class="top2 center">
					<div class="sub_top fl">
						
					</div>
					<div class="sub_top fl">名称</div>
					<div class="sub_top fl">单价</div>
					<div class="sub_top fl">数量</div>
					<div class="sub_top fl">小计</div>
					<div class="clear"></div>
				</div>
				
				<div id="tbody" ></div>
				
				
			<div class="jiesuandan mt20 center">
			
				<div class="tishi fl ml20">
					<ul>
						
						<li>共<span id="zongshu"></span>件</li>
						<div class="clear"></div>
					</ul>
				</div>
				
				<div class="jiesuan fr">
					<div class="jiesuanjiage fl">合计（不含运费）：<span id="heji"></span></div>
					<div class="jsanniu fr"><input class="jsan" type="button" onclick="tijiao()" lay-submit lay-filter="add" name="jiesuan"  value="确定下单"/></div>
				
					<div class="clear"></div>
				</div>
				
				<div class="clear"></div>	
			</div>
			
		</div>	
	</div>
	
<script type="text/javascript">
var tt= '<%=request.getParameter("ids")==null?"":request.getParameter("ids") %>';
	init();
	function init(){
		if(tt == ''){
			layer.msg('请选择商品');
			location.href = "/B2C/xiaomi/index.jsp";
			return;
		}
		tt_ = tt.split(',');
		
		$.each(tt_,function(i,dom){
				
			ajax("/cart/selectList.do",{id:dom},'json',function(data){
// 			alert(dom)
// 			var code = data.code;
// 			if(code == 2){
// 				layer.msg('请登录');
// 				location.href = "/B2C/xiaomi/login.jsp";
// 				return;
// 			}
			var h1 = "";
			var h2 = 0.0;
			$.each(data.list,function(i,dom){
				var id = dom.id;
			
				//var f = true;
				tt_.forEach(function(x,index){
					if(id == x){
		 				var xiaoji = 0.0;
		 				
		 				xiaoji = xiaoji + parseFloat(getValue(dom.pcost,dom.sum));
		 				xiaoji = xiaoji.toFixed(2);
		 				
						h1 += '<div class="content2 center">';
						h1 += '<div class="sub_content fl "></div>';
						h1 += '<div class="sub_content fl "><img src="/a3/'+dom.purl1+'" width="80px" height="80px"></div>';
						h1 += '<div class="sub_content fl ft20">'+dom.pname+'</div>';
						h1 += '<div class="sub_content fl ">'+dom.pcost+'</div>';
						h1 += '<div class="sub_content fl">'+dom.sum+'</div>';
						h1 += '<div class="sub_content fl">'+xiaoji+'</div>';
						h1 += '<div class="sub_content fl"></div><div class="clear"></div></div>';				
						h2 += parseFloat(xiaoji);						
						$("#tbody").html(h1);			
						$("#zongshu").text(data.list.length)
					}						
				})	
			})
			h2 = h2.toFixed(2);
			$("#heji").html(h2)
		})		
	})
}
		
//计算小计
	function getValue(cost, sum) {
		return Number(parseFloat(cost) * parseFloat(sum)).toFixed(2);
	}

	var userCode = $('input[name="userCode"]').val()
		
	//提交
	function tijiao() {
		ajax('/order/insert.do', {userCode : userCode}, 'text', function(data) {
			var orderCode = data;
 			//alert(data)
			ajax("/cart/selectList.do",{userCode : userCode},'json',function(data2){
				$.each(data2.list, function(i, dom) {
					var id = dom.id;
					var inforCode = dom.inforCode;
					var sum = dom.sum;
					var pcost = dom.pcost;
					$.each(tt_, function(i, dom) {
						if (id == dom) {							
							ajax('/orderGoods/insert.do', {orderCode : orderCode,inforCode : inforCode,sum : sum, price : pcost}, 'json', function(data) {			
								window.location.href = "/B2C/xiaomi/dingdan.jsp";
								
							})		
						}
					})
					shanchu(id) 			
				})
			})
			
		})
	}
	function shanchu(id) {
		ajax('/cart/del.do', {id : id}, 'text', function(data) {

		})
	}

</script>
</body>
</html>
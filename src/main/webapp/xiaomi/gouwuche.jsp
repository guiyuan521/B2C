<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<%@ include file="/web/header.jsp"%>
<title>购物车</title>
</head>
<body>
	<div class="banner_x center">
		<a href="./index.jsp" target="_blank"><div class="logo fl"></div></a>

		<div class="wdgwc fl ml40">我的购物车</div>
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
						<input type="checkbox" value="quanxuan" class="quanxuan" onclick="quanxuan0(this)"/>全选
					</div>
					<div class="sub_top fl">名称</div>
					<div class="sub_top fl">单价</div>
					<div class="sub_top fl">数量</div>
					<div class="sub_top fl">小计</div>
					<div class="sub_top fr">操作</div>
					<div class="clear"></div>
				</div>
				
				<div  id="tbody" >

				
				</div>
			
			<div class="jiesuandan mt20 center">
			
				<div class="tishi fl ml20">
					<ul>
						<li><a href="./liebiao.jsp">继续购物</a></li>
						<li>|</li>
						<li>共<span id="zongshu"></span>件商品，已选择<span id="xuanzhong"></span>件</li>
						<div class="clear"></div>
					</ul>
				</div>
				
				<div class="jiesuan fr">
					<div class="jiesuanjiage fl">合计（不含运费）：<span id="zonge"></span></div>
					<div class="jsanniu fr"><input class="jsan" type="button" name="jiesuan" onclick="tijiao()" value="去结算"/></div>
					<div class="clear"></div>
				</div>
				
				<div class="clear"></div>
				
			</div>
			
		</div>
<script type="text/javascript">
	init();
	function init(){
		ajax("/cart/selectList.do",{},'json',function(data){
			console.log(data)
			var code = data.code;
			if(code == 2){
				layer.msg('请登录');
				location.href = "/B2C/xiaomi/login.jsp";
				return;
			}
			var h1 = "";
			$.each(data.list,function(i,dom){
				var id = dom.id;
				h1 += '<div class="content2 center">';
				h1 += '<div class="sub_content fl "><input type="checkbox" value="'+id+'" class="quanxuan" name="quanxuan" onchange="zonge()"/></div>';
				h1 += '<div class="sub_content fl "><img src="/a3/'+dom.purl1+'" width="80px" height="80px"></div>';
				h1 += '<div class="sub_content fl ft20">'+dom.pname+'</div>';
				h1 += '<div class="sub_content fl ">'+dom.pcost+'</div>';
				h1 += '<div class="sub_content fl"><input class="shuliang" type="number" value="'+dom.sum+'" step="1" min="1" onchange="sumchange(this,'+id+')" ></div>';
				h1 += '<div class="sub_content fl">'+getValue(dom.pcost,dom.sum)+'</div>';
				h1 += '<div class="sub_content fl"><a href="javascript:del('+id+')">×</a></div><div class="clear"></div></div>';
			
				$("#tbody").html(h1);
				$("#zongshu").text(data.list.length)
			})
		})
	}
//计算小计
function getValue(cost,sum){
	return new Number(parseFloat(cost)*parseFloat(sum)).toFixed(2);
}
//修改数量
function sumchange(obj,id){
	var v = obj.value;
	ajax('/cart/updSum.do',{id:id,sum:v},'json',function(data){
		if(data == 1){
			obj.value = v;
			var cost =$(obj).parent().prev().text();
			$(obj).parent().next().text(getValue(cost,v));
			zonge()
		}
	})
}
//全选
function quanxuan0(obj){
	$("input[type='checkbox']").prop('checked',$(obj).prop('checked'));
	zonge();
}
//总计
function zonge(){
	var quanxuan = $("input[name='quanxuan']:checked");
	$("#xuanzhong").text(quanxuan.length);
	var zonge = 0.0;
	quanxuan.each(function(index,domEle){
		var cost =$(this).parent().next().next().next().next().next().text();
		zonge += parseFloat(cost);
	})
	$("#zonge").text(zonge.toFixed(2));
}
//提交
function tijiao(){
	var quanxuan = $("input[name='quanxuan']:checked");
	var ids = [];
	//$.each(quanxuan,function(index,dom){})
	quanxuan.each(function(index,dom){
		ids.push($(this).val())
	})
	if(ids.length == 0){
		layer.msg('请选择商品');
		return;
	}
	location.href = "/B2C/xiaomi/gouwuche2.jsp?ids="+ids;
}
//删除
function del(id){
	ajax('/cart/del.do',{id:id},'json',function(data){
		$("#tbody").html("");
		init();
		
	})
}
//选中删除
function delcheck(){
	$("input[name='quanxuan']:checked").each(function(index,dom){
		del($(this).val())
	})
}
</script>
 
	<footer class="center">			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>
</body>
</html>
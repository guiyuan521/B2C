<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/B2C/xiaomi/css/style.css">
		<%@ include file="/web/header.jsp"%>
<title>商品详情</title>
</head>
<body>
<form action="post" method="">
	<div class="xiangqing">
		<div class="neirong w">
			<div class="xiaomi6 fl">小米6</div>
			<nav class="fr">
				<li><a href="">概述</a></li>
				<li>|</li>
				<li><a href="">变焦双摄</a></li>
				<li>|</li>
				<li><a href="">设计</a></li>
				<li>|</li>
				<li><a href="">参数</a></li>
				<li>|</li>
				<li><a href="">F码通道</a></li>
				<li>|</li>
				<li><a href="">用户评价</a></li>
				<div class="clear"></div>
			</nav>
			<div class="clear"></div>
		</div>	
	</div>
	
		<div  class="jieshao mt20 w" id ="zz">
		
		</div>
	</form>
	
<script type="text/javascript">	

	    var code = '<%=request.getParameter("code")%>';
		ajax('/information/selectModel.do',{code:code},'json', function(data) {
	        var html = "";	
	       		$.each(data.list,function(i,dom){
	        		var code = dom.code;
	        		ajax("/prodpic/findPic.do",{code:code},"json",function(data){
	        			$.each(data,function(j,ddd){
	        				html += "<div class='left fl'><img src='/a3/"+ddd.url+"' width='500px' height='500px'></div>";
	        				html += "<div class='right fr'><div class='h3 ml20 mt20'>"+dom.name+"</div>";
	        				html += "<div class='ft20 ml20 mt20'>选择版本</div><div class='xzbb ml20 mt10'><div class='banben fl'><a><span>"+dom.descr+"</span></a></div><div class='clear'></div></div>";
	        				html += "<div class='xqxq mt20 ml20'><div class='top1 mt10'><div class='left1 fl'>"+dom.descr+"</div><div class='right1 fr'>"+dom.price+"</div><div class='clear'></div></div><div class='bot mt20 ft20 ftbc'>总计："+dom.price+"元</div></div>";
	        				html += "<div class='xiadan ml20 mt20'><input class='jrgwc' type='button' name='jrgwc' onclick='gw()' value='加入购物车' /></div></div><div class='clear'></div>";
	        				$("#zz").html(html);
	        			})
	        		})
	        			
	        	})
	    })
		
	  function gw(){
// 			alert(code)
	 		ajax('/cart/add.do',{inforCode:code},'text',function(data){
			if(data == 2){
				layer.msg('请登录');
				location.href = "/B2C/xiaomi/login.jsp";
			}else if(data == 1){
				layer.msg('添加成功');
				location.href = "/B2C/xiaomi/gouwuche.jsp";
			}else{
				layer.msg('添加失败');
			}
		})
	}
// 	$("input[name='jrgwc']").click(function(){
// 		ajax('/cart/add.do',{productCode:code},'text',function(data){
// 			if(data == 2){
// 				layer.msg('请登录');
// 				location.href = "/B2C/xiaomi/login.jsp";
// 			}else if(data == 1){
// 				layer.msg('添加成功');
// 			}else{
// 				layer.msg('添加失败');
// 			}
// 		})
// 	})

</script>
</body>
</html>
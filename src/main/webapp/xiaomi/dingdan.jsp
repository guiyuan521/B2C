<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单</title>
<%@ include file="/web/header.jsp"%>
<link rel="stylesheet" type="text/css" href="./css/style.css">

</head>
<body>
<input type="hidden" name="userCode" value="${user.code }">
<header>
			<div class="top center">	
				<div class="right fr">
					<div class="gouwuche fr"><a href="./gouwuche.jsp">购物车</a></div>
					<div class="fr">
						<ul>
<%-- 						<% --%>
<!--  							Object obj = session.getAttribute("user"); -->
<!--  							if(obj==null){ -->
<%-- 						%> --%>
<!-- 						<li><a href="">登录</a></li> -->
<!-- 						<li><a href="">注册</a></li> -->
<%-- 						<%}else{UserModel userCrm = (UserModel)obj; %> --%> 
<%-- 						<li><a href="javascript:dingdan();">我的订单[<%=userCrm.getName() %>]</a></li> --%>
<!-- 						<li>|</li> -->
<!-- 						<li><a href="javascript:goLogout();">注销</a></li> -->
<%-- 						<%} %> --%>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
	<!--end header -->
	<!-- start banner_x -->
		
<!-- end banner_x -->
<!-- self_info -->
	<div class="grzxbj">
		<div class="selfinfo center">
		<div class="lfnav fl">
			<div class="ddzx">订单中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
					<li><a href="">意外保</a></li>
					<li><a href="">团购订单</a></li>
					<li><a href="">评价晒单</a></li>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="./self_info.html">我的个人中心</a></li>
					<li><a href="">消息通知</a></li>
					<li><a href="">优惠券</a></li>
					<li><a href="">收货地址</a></li>
				</ul>
			</div>
		</div>
		
		<div class="rtcont fr">
			<div class="ddzxbt">交易订单</div>
					
			<div class="ddxq" id = "main">
<!-- 				<div class="ddspt fl"><img src="/a3/'+{{dom.purl1}}+'" alt=""></div> -->
<!-- 				<div class="ddbh fl">订单号:1705205643098724</div> -->
<!-- 				<div class="ztxx fr"> -->
<!-- 					<ul> -->
<!-- 						<li>已发货</li> -->
<!-- 						<li>￥2499.00</li> -->
<!-- 						<li>2017/05/20 13:30</li> -->
<!-- 						<li><a href="">订单详情></a></li> -->
<!-- 						<div class="clear"></div> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 				<div class="clear"></div> -->
			</div>
			
			<div class="clear"></div>
		</div>
		
	</div>
</div>
<script type="text/javascript">
<%-- var orderCode='<%=request.getParameter("orderCode")==null?"":request.getParameter("orderCode") %>';  --%>
 var userCode=$("input[name='userCode']").val();
init()
function init(){
	//var userCode=$("input[name='userCode']").val();
	ajax('/order/user.do',{userCode:userCode},'json',function(data){
		var h1 = "";
		$.each(data,function(i,dom){	
			var code = dom.code;
			var time = dom.time;
			var state = dom.state;
			var sum = dom.sum;
			var d={code:code,sum:sum,time:time,state:state}
			
			h1 +='<div class="ddspt fl"><img src="/B2C/web/common/image/qq.jpg" width="80px" height="80px" alt=""></div>';
			h1 +='<div class="ddbh fl" >订单号:'+d.code+'</div>';
			h1 += '<div class="ztxx fr"><ul><li>'+d.state+'</li><li>数量:'+d.sum+'</li>';
			h1 += '<li >'+d.time+'</li><li><a href="javascript:dingdanxiangqing(\''+d.code+'\');">'+'订单详情'+'</a></li>';
			h1 += '<div class="clear"></div></ul></div><div class="clear"></div>';	
					
			$("#main").html(h1);				
		})
			
	})
}
function dingdanxiangqing(code) {
	location.href="/B2C/xiaomi/dingdanxiangqing.jsp?code="+code+"";
}

</script>
	
</body>
</html>
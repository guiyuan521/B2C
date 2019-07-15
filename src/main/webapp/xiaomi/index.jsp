<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>小米商城</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<%@ include file="/web/header.jsp"%>
	</head>
	<body>
	<!-- start header -->
		<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li><a href="http://www.mi.com/" target="_blank">小米商城</a></li>
						<li>|</li>
						<li><a href="">MIUI</a></li>
						<li>|</li>
						<li><a href="">米聊</a></li>
						<li>|</li>
						<li><a href="">游戏</a></li>
						<li>|</li>
						<li><a href="">多看阅读</a></li>
						<li>|</li>
						<li><a href="">云服务</a></li>
						<li>|</li>
						<li><a href="">金融</a></li>
						<li>|</li>
						<li><a href="">小米商城移动版</a></li>
						<li>|</li>
						<li><a href="">问题反馈</a></li>
						<li>|</li>
						<li><a href="">Select Region</a></li>

					</ul>
				</div>
				<div class="right fr">
					<div class="gouwuche fr"><a href="./gouwuche.jsp">购物车</a></div>
					<div class="fr">
						<ul>
							<li><a href="./login.jsp" target="_blank">${user.name}登录</a></li>
							<li>|</li>
							<li><a href="./register.jsp" target="_blank" >注册</a></li>
							<li>|</li>
							<li><a href="">消息通知</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
	<!--end header -->

<!-- start banner_x -->
		<div class="banner_x center">
			<a href="./index.jsp" target="_blank"><div class="logo fl"></div></a>
			<a href=""><div class="ad_top fl"></div></a>
			<div class="nav fl">
				<ul>
					<li><a href="./liebiao.jsp" target="_blank">小米手机</a></li>
					<li><a href="">红米</a></li>
					<li><a href="">平板·笔记本</a></li>
					<li><a href="">电视</a></li>
					<li><a href="">盒子·影音</a></li>
					<li><a href="">路由器</a></li>
					<li><a href="">智能硬件</a></li>
					<li><a href="">服务</a></li>
					<li><a href="">社区</a></li>
				</ul>
			</div>
			<div class="search fr">
				<form action="/B2C/xiaomi/liebiao.jsp" method="post">
					<div class="text fl">
						<input type="text" class="shuru"  name = "name" placeholder="小米6&nbsp;小米MIX现货">
					</div>
					<div class="submit fl">
						<input type="submit" class="sousuo" value="搜索"/>
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
		
		<div class="danpin center" id="liebiao">
			
<!-- 			<div class="biaoti center">小米明星单品</div> -->
<!-- 			<div class="main center"> -->
<!-- 				<div class="mingxing fl"> -->
<!-- 					<div class="sub_mingxing"><a href=""><img src="./image/pinpai1.png" alt=""></a></div> -->
<!-- 					<div class="pinpai"><a href="">小米MIX</a></div> -->
<!-- 					<div class="youhui">5月9日-21日享花呗12期分期免息</div> -->
<!-- 					<div class="jiage">3499元起</div> -->
<!-- 				</div> -->
<!-- 			</div>	 -->


		</div>	
			
<!-- end banner_x -->

	<!-- start banner_y -->
	
		<div class="banner_y center">
		
		
		<div class="layui-carousel" id="test1" style="float: right;">
			<div carousel-item>
				<div>
					<img src="/B2C/xiaomi/image/banner.jpg" style="width: 992px;height: 460px"/>
				</div>
				<div>
				<img src="./image/banner2.jpg" style="width: 992px;height: 460px"/>
				</div>
				<div>
				<img src="./image/xiaomi5.jpg" style="width: 992px;height: 460px"/>
				</div>
				

			</div>
		</div>
	
		
		
		
		
		
			<div id="fenlei" class="nav">			

<!-- 				<ul> -->
<!-- 					<li> -->
					
<!-- 						<a href="">手机</a> -->
<!-- 						<div class="pop"> -->
<!-- 							<div class="left fl"> -->
<!-- 								<div> -->
<!-- 									<div class="xuangou_left fl"> -->
<!-- 										<a href=""> -->
<!-- 											<div class="img fl"><img src="./image/xm6_80.png" alt=""></div> -->
<!-- 											<span class="fl">小米6</span> -->
<!-- 											<div class="clear"></div> -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 									<div class="xuangou_right fr"><a href="./xiangqing.html" target="_blank">选购</a></div> -->
<!-- 									<div class="clear"></div> -->
<!-- 								</div>									 -->
<!-- 							</div> -->
							
<!-- 							<div class="ctn fl"> -->
<!-- 								<div> -->
<!-- 									<div class="xuangou_left fl"> -->
<!-- 										<a href=""> -->
<!-- 											<div class="img fl"><img src="./image/xm5-80.jpg" alt=""></div> -->
<!-- 											<span class="fl">小米手机5</span> -->
<!-- 											<div class="clear"></div> -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 									<div class="xuangou_right fr"><a href="">选购</a></div> -->
<!-- 									<div class="clear"></div> -->
<!-- 								</div> -->
<!-- 							</div> -->
							
<!-- 							<div class="right fl"> -->
<!-- 								<div> -->
<!-- 									<div class="xuangou_left fl"> -->
<!-- 										<a href=""> -->
<!-- 											<div class="img fl"><img src="./image/compare.jpg" alt=""></div> -->
<!-- 											<span class="fl">对比手机</span> -->
<!-- 											<div class="clear"></div> -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 									<div class="xuangou_right fr"><a href="">选购</a></div> -->
<!-- 									<div class="clear"></div> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 						</div> -->
<!-- 					</li> -->
<!-- 				</ul> -->
			</div>
		</div>
			
<script type="text/javascript">

	ajax('/classification/select.do',{parentCode:'type1'},'json',fenleishow)
 		function fenleishow(data){
//			var html = "";
 	 		var html2 = "";
	 		$.each(data,function(i,dom){
			var code = dom.code;
			var t1 = "<ul><li><a href ='/B2C/xiaomi/liebiao.jsp?name=&parentCode="+dom.code+"'>"+dom.name+"</a>"
	 		var t2 = "<div class = 'pop' id='div_"+code+"'></div>";
//	 		html += t1+"</li></ul>";
 	 		html2 += t1 + t2 + "</li>";
	 	})
//		$("#fenlei").html(html);
	 	$("#fenlei").html(html2);
	 	
	 $.each(data,function(i,dom){
	 	var code = dom.code;
	 	ajax('/classification/select.do',{parentCode:code},'json',function(data){
	 				  						 
	 		var h = '';
			$.each(data,function(index,dom){ 
				 if (index == 0) {
						h += '<div class="left fl">';
					}
					if (index == 2) {
						h += '</div><div class="ctn fl">';
					}
				if (index == 4) {
					h += '</div><div class="right fl">';
				}
			 	h += '<div><div class="xuangou_left f1">';
				h += "<a href='/B2C/xiaomi/liebiao.jsp?name="+dom.name+"'>";
				h += '<div class="img f1">'+'<img src="./image/xm6_80.png" /></div>';
				h += '<span class="fl">'+dom.name+'</span>'+'<div class="clear"></div>'+'</a></div>';
				h += '<div class="xuangou_right fr">';
				h +='<a href="/B2C/xiaomi/liebiao.jsp?name='+dom.name+'" target="_blank">'+"选购"+'</a></div>'+'<div class="clear"></div>'+'</div>';		 			
			 });
			 $("#div_"+code).html(h); 	 				 
	 	 })
	  });
	 		
}
	
// function fenlei(code,i){
// 	location.href = con.front +"/liebiao.jsp?type"+i+"="+code;
// }

</script>
<script type="text/javascript">
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#test1',
				width : '992px' //设置容器宽度
				,
				height : '460px',
				arrow : 'always' //始终显示箭头
				,
				anim : 'fade '//切换动画方式
				//, autoplay: false
				,
				interval : 2000,

			});
		});
	</script>


		<div class="sub_banner center">
			<div class="sidebar fl">
				<div class="fl"><a href=""><img src="./image/hjh_01.gif"></a></div>
				<div class="fl"><a href=""><img src="./image/hjh_02.gif"></a></div>
				<div class="fl"><a href=""><img src="./image/hjh_03.gif"></a></div>
				<div class="fl"><a href=""><img src="./image/hjh_04.gif"></a></div>
				<div class="fl"><a href=""><img src="./image/hjh_05.gif"></a></div>
				<div class="fl"><a href=""><img src="./image/hjh_06.gif"></a></div>
				<div class="clear"></div>
			</div>
			
			<div class="datu fl"><a href=""><img src="./image/hongmi4x.png" alt=""></a></div>
			<div class="datu fl"><a href=""><img src="./image/xiaomi5.jpg" alt=""></a></div>
			<div class="datu fr"><a href=""><img src="./image/pinghengche.jpg" alt=""></a></div>
			<div class="clear"></div>
			
		</div>
	<!-- end banner -->

	<!-- start danpin -->
		<div class="danpin center">
			
			<div class="biaoti center">小米明星单品</div>
			<div class="main center">
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href=""><img src="./image/pinpai1.png" alt=""></a></div>
					<div class="pinpai"><a href="">小米MIX</a></div>
					<div class="youhui">5月9日-21日享花呗12期分期免息</div>
					<div class="jiage">3499元起</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href=""><img src="./image/pinpai2.png" alt=""></a></div>
					<div class="pinpai"><a href="">小米5s</a></div>
					<div class="youhui">5月9日-10日，下单立减200元</div>
					<div class="jiage">1999元</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href=""><img src="./image/pinpai3.png" alt=""></a></div>
					<div class="pinpai"><a href="">小米手机5 64GB</a></div>
					<div class="youhui">5月9日-10日，下单立减100元</div>
					<div class="jiage">1799元</div>
				</div>
				<div class="mingxing fl"> 	
					<div class="sub_mingxing"><a href=""><img src="./image/pinpai4.png" alt=""></a></div>
					<div class="pinpai"><a href="">小米电视3s 55英寸</a></div>
					<div class="youhui">5月9日，下单立减200元</div>
					<div class="jiage">3999元</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href=""><img src="./image/pinpai5.png" alt=""></a></div>
					<div class="pinpai"><a href="">小米笔记本</a></div>
					<div class="youhui">更轻更薄，像杂志一样随身携带</div>
					<div class="jiage">3599元起</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="peijian w">
			<div class="biaoti center">配件</div>
			<div class="main center">
				<div class="content">
					<div class="remen fl"><a href=""><img src="./image/peijian1.jpg"></a>
					</div>
					<div class="remen fl">
						<div class="xinpin"><span>新品</span></div>
						<div class="tu"><a href=""><img src="./image/peijian2.jpg"></a></div>
						<div class="miaoshu"><a href="">小米6 硅胶保护套</a></div>
						<div class="jiage">49元</div>
						<div class="pingjia">372人评价</div>
						<div class="piao">
							<a href="">
								<span>发货速度很快！很配小米6！</span>
								<span>来至于mi狼牙的评价</span>
							</a>
						</div>
					</div>
					<div class="remen fl">
						<div class="xinpin"><span style="background:#fff"></span></div>
						<div class="tu"><a href=""><img src="./image/peijian3.jpg"></a></div>
						<div class="miaoshu"><a href="">小米手机4c 小米4c 智能</a></div>
						<div class="jiage">29元</div>
						<div class="pingjia">372人评价</div>
					</div>
					<div class="remen fl">
						<div class="xinpin"><span style="background:red">享6折</span></div>
						<div class="tu"><a href=""><img src="./image/peijian4.jpg"></a></div>
						<div class="miaoshu"><a href="">红米NOTE 4X 红米note4X</a></div>
						<div class="jiage">19元</div>
						<div class="pingjia">372人评价</div>
						<div class="piao">
							<a href="">
								<span>发货速度很快！很配小米6！</span>
								<span>来至于mi狼牙的评价</span>
							</a>
						</div>
					</div>
					<div class="remen fl">
						<div class="xinpin"><span style="background:#fff"></span></div>
						<div class="tu"><a href=""><img src="./image/peijian5.jpg"></a></div>
						<div class="miaoshu"><a href="">小米支架式自拍杆</a></div>
						<div class="jiage">89元</div>
						<div class="pingjia">372人评价</div>
						<div class="piao">
							<a href="">
								<span>发货速度很快！很配小米6！</span>
								<span>来至于mi狼牙的评价</span>
							</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="content">
					<div class="remen fl"><a href=""><img src="./image/peijian6.png"></a>
					</div>
					<div class="remen fl">
						<div class="xinpin"><span style="background:#fff"></span></div>
						<div class="tu"><a href=""><img src="./image/peijian7.jpg"></a></div>
						<div class="miaoshu"><a href="">小米指环支架</a></div>
						<div class="jiage">19元</div>
						<div class="pingjia">372人评价</div>
						<div class="piao">
							<a href="">
								<span>发货速度很快！很配小米6！</span>
								<span>来至于mi狼牙的评价</span>
							</a>
						</div>
					</div>
					<div class="remen fl">
						<div class="xinpin"><span style="background:#fff"></span></div>
						<div class="tu"><a href=""><img src="./image/peijian8.jpg"></a></div>
						<div class="miaoshu"><a href="">米家随身风扇</a></div>
						<div class="jiage">19.9元</div>
						<div class="pingjia">372人评价</div>
					</div>
					<div class="remen fl">
						<div class="xinpin"><span style="background:#fff"></span></div>
						<div class="tu"><a href=""><img src="./image/peijian9.jpg"></a></div>
						<div class="miaoshu"><a href="">红米4X 高透软胶保护套</a></div>
						<div class="jiage">59元</div>
						<div class="pingjia">775人评价</div>
					</div>
					<div class="remenlast fr">
						<div class="hongmi"><a href=""><img src="./image/hongmin4.png" alt=""></a></div>
						<div class="liulangengduo"><a href=""><img src="./image/liulangengduo.png" alt=""></a></div>					
					</div>
					<div class="clear"></div>
				</div>				
			</div>
		</div>
		<footer class="mt20 center">			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>

</body>
</html>
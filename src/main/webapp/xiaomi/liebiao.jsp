<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/B2C/xiaomi/css/style.css">
		<%@ include file="/web/header.jsp"%>
		
<title>商品列表</title>
</head>
<body>
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
						<input type="text" class="shuru"  name = "name"  placeholder="小米6&nbsp;小米MIX现货">
					</div>
					<div class="submit fl">
						<input type="submit" class="sousuo" value="查询"/>
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
		
		<input type="hidden" name="pageIndex" value="1" />
		<input type="hidden" name="pageLimit" value="10" />
		<div id="pageInfoUser" style="text-align: right;padding-right: 30px"></div>
		
<script type="text/javascript" src="/B2C/web/common/layui/layui.all.js"></script>
<script type="text/javascript" src="/B2C/web/common/js/common.js"></script>		
<script type="text/javascript">	
<%
	String name = request.getParameter("name");
	if(name != null){
%>
	var name = '<%=request.getParameter("name")%>';
	ajax("/information/selectModel.do" , {name:name,pageIndex:1,pageLimit:10} , "json" , showdescr)
<%	}else{	%>
		showdescr2();
<%	}	%>

function showdescr(data){
	var curr = $("input[name='pageIndex']").val();
    var limit = $("input[name='pageLimit']").val();
    setPageInfo('pageInfoUser',data.count,curr,limit,function(obj, first){
	     $("input[name='pageIndex']").val(obj.curr);
        $("input[name='pageLimit']").val(obj.limit); 
    })
	var html = "";
    html += "<div class='biaoti center' >列表详情</div><div class='main center'>"
	$.each(data.list, function(i,dom){
		//console.log(dom)
		var code = dom.code;
		ajax("/prodpic/findPic.do" , {code:code} , "json" , function(data){
			$.each(data , function(j,ddd){
				html += "<div class='mingxing fl style='border:2px solid #fff;width:230px;cursor:pointer;' onmouseout='this.style.border=\"2px solid #fff\"' onmousemove=\"this.style.border='2px solid red'\">";
				html += "<div class='sub_mingxing'><a href='./xiangqing.jsp?code="+code+"' target='_blank'><img src='/a3/"+ddd.url+"' alt=''></a></div>";
				html += "<div class='pinpai'><a href='./xiangqing.jsp?code="+code+"' target='_blank'>"+dom.name+"</a></div>";
				html += "<div class='youhui'>"+dom.descr+"</div>";
				html += "<div class='jiage'>"+dom.price+"元</div></div>";
				$("#liebiao").html(html);
			})
		})	
	});	
}

function showdescr2(){
	<%-- 	var count = '<%=request.getAttribute("count")%>'; --%>
			var list = '<%=request.getAttribute("list")%>';	
			var html = "";
		    html += "<div class='biaoti center' >列表详情</div><div class='main center'>"
			$.each(JSON.parse(list),function(i,dom){
				var code = dom.code;
				ajax("/prodpic/findPic.do",{code:code} ,"json" , function(data){
					$.each(data, function(j,ddd){
						html += "<div class='mingxing fl style='border:2px solid #fff;width:230px;cursor:pointer;' onmouseout='this.style.border=\"2px solid #fff\"' onmousemove=\"this.style.border='2px solid red'\">";
						html += "<div class='sub_mingxing'><a href='./xiangqing.jsp?code="+code+"' target='_blank'><img src='/a3/"+ddd.url+"' alt=''></a></div>";
						html += "<div class='pinpai'><a href='./xiangqing.jsp?code="+code+"' target='_blank'>"+dom.name+"</a></div>";
						html += "<div class='youhui'>"+dom.descr+"</div>";
						html += "<div class='jiage'>"+dom.price+"元</div></div>";
						$("#liebiao").html(html);
					})
				})	
			});	
		}

</script>	
		
</body>
</html>
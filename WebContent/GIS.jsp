<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="Bean.DBBean" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html">
<meta name="author" content="Jake Rocheleau">
<link rel="stylesheet" href="CSS/main.css">
<script type="text/javascript" src="JS/jquery.min.js"></script>
<script type="text/javascript" src="JS/menu.js"></script>
<script type="text/javascript" src="jquery-1.8.2.min.js"></script>
<title>调用百度地图</title>
</head>
<body>

<div id="pgcontainer">
  <header>
    <div id="navbar">
      <a href="#" class="menubtn">menu</a>
      <!-- use captain icon for toggle menu -->
      <div id="hamburgermenu">
        <ul>
          <li>
          <%
			String uname=request.getSession().getAttribute("uname").toString();
			String paswd=request.getSession().getAttribute("paswd").toString();//获取cookie,为后面的页面保存用户的信息
          %>
			<a href="#">欢迎登陆，用户<%=uname %></a>
          <!-- 到这里实现了用户的信息登陆和保存 -->
          </li>
          <li><a href="UserInfo.jsp">用户信息</a></li>
          <li><a href="BusInfo.jsp">车辆查询</a></li>
          <li><a href="StationInfo.jsp">站点查询</a></li>
          <li><a href="LineQuery.jsp">出行查询</a></li>          
          <li><a href="GIS.jsp">GIS地图定位及查询</a></li>
          <li><a href="Umessage.jsp">用户留言</a></li>
        </ul>
      </div>
      	<h1 style="color:#ff8000">城市公交线路信息查询系统</h1>
    </div>
    <div class="overlay"></div>
  </header>
  
  
  
  <div id="content">
<section class="LiKoH_contact">
		<div class="contact">
			<div class="contactmain" data-scroll-reveal="enter bottom over 1s and move 300px after 0.3s">
				<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Tugd2eWYmyK8GIys6jv17Vbd40Uc2cSn"></script>
				<br>
				<center>
			    <div id="l-map" style="width:96%;height:800px;font-size:12px;border-radius:20px" ></div></center>
			    <div id="r-result" style="font-size:20px;font-weight:bold;text-align:center">关键字检索:<input type="text" id="suggestId" size="20" value="百度" style="width:150px;" /></div>
				<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
				<script type="text/javascript">
				var sContent ="<font color='#f10'>联络地址</font><br>姓名：计科1502吴小龙<br><br>邮编：000000<br><br>电话：17715879373";
				var map = new BMap.Map("l-map");          			// 创建地图实例
				var point = new BMap.Point(119.406561,32.348519);  	// 创建点坐标，定位到扬子津校区
				map.centerAndZoom(point, 15);    
				map.enableScrollWheelZoom();             		// 初始化地图，设置中心点坐标和地图级别
 
				map.addControl(new BMap.NavigationControl());    
				map.addControl(new BMap.ScaleControl());    
				map.addControl(new BMap.OverviewMapControl());    
				map.addControl(new BMap.MapTypeControl());  
 
				var mapType1 = new BMap.MapTypeControl({mapTypes: [BMAP_NORMAL_MAP,BMAP_HYBRID_MAP]});

				var overView = new BMap.OverviewMapControl();
				var overViewOpen = new BMap.OverviewMapControl({isOpen:true, anchor: BMAP_ANCHOR_BOTTOM_RIGHT});
				//添加地图类型和缩略图
 
				map.addControl(mapType1);     //2D图，卫星图

				map.addControl(overView);     //添加默认缩略地图控件
				map.addControl(overViewOpen);   //右下角，打开
 
				var navigationControl = new BMap.NavigationControl({
				// 靠左上角位置
				anchor: BMAP_ANCHOR_TOP_LEFT,
				// LARGE类型
				type: BMAP_NAVIGATION_CONTROL_LARGE,
				// 启用显示定位
				enableGeolocation: true // 会多出一个点
				});
				map.addControl(navigationControl);
				// 添加定位控件
				var geolocationControl = new BMap.GeolocationControl();
				geolocationControl.addEventListener("locationSuccess", function(e){
				// 定位成功事件
				var address = '';
				address += e.addressComponent.province;
				address += e.addressComponent.city;
				address += e.addressComponent.district;
				address += e.addressComponent.street;
				address += e.addressComponent.streetNumber;
				});
				geolocationControl.addEventListener("locationError",function(e){
				// 定位失败事件
				alert(e.message);
				});
				map.addControl(geolocationControl);
 
				var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
						{"input" : "suggestId"
						,"location" : map
					});

					ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
					var str = "";
						var _value = e.fromitem.value;
						var value = "";
						if (e.fromitem.index > -1) {
							value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
						}    
						str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
						
						value = "";
						if (e.toitem.index > -1) {
							_value = e.toitem.value;
							value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
						}    
						str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
						G("searchResultPanel").innerHTML = str;
					});

					var myValue;
					ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
					var _value = e.item.value;
						myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
						G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
						
						setPlace();
					});

					function setPlace(){
						map.clearOverlays();    //清除地图上所有覆盖物
						function myFun(){
							var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
							map.centerAndZoom(pp, 18);
							map.addOverlay(new BMap.Marker(pp));    //添加标注
						}
						var local = new BMap.LocalSearch(map, { //智能搜索
						  onSearchComplete: myFun
						});
						local.search(myValue);
					}
					//以上是下拉菜单功能
				
				</script>
			</div>
		</div>
	</section>
			

</div><!-- @end #pgcontainer -->
</body>
</html>
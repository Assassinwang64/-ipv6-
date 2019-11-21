<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
	<title>浏览器定位及经纬度解析</title>
	<style type="text/css">
		body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#l-map{height:100%;width:100%;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=bDBkqihsjRDq1CXmCrL2lD3fpRIvQfCK"></script>
</head>
<body>
	<div id="l-map"></div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var point = null;
	var map = new BMap.Map("l-map");
	map.centerAndZoom(new BMap.Point(116.395645,39.929986), 7);
	map.enableScrollWheelZoom(true);
	//获取浏览器定位
	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(res){
		if(res){
			//alert(JSON.stringify(res.point));
			point = res.point;
			analysis(res.point);
			// map.centerAndZoom(new BMap.Point(res.point.lng,res.point.lat),12);
		}
	});
	//解析经纬度
	function analysis(pt){
		var geoc = new BMap.Geocoder();
		geoc.getLocation(new BMap.Point(pt.lng,pt.lat),function(res){
                    
			//alert(res.addressComponents.province+res.addressComponents.city+res.addressComponents.district);
			map.centerAndZoom(res.address,12);
			geoc.getPoint(res.address, function(pt){
				pt && addMarker(new BMap.Point(pt.lng, pt.lat),new BMap.Label( res.address , {offset:new BMap.Size(20,-10)}));
			}, "中国");
			// map.addOverlay(new BMap.Marker(pt.lng,pt.lat),new BMap.Label(res.address, {offset:new BMap.Size(20,-10)}));
		});
	}
	function addMarker(point,label){// 编写自定义函数,创建标注
		var marker = new BMap.Marker(point);
		map.addOverlay(marker);
		marker.setLabel(label);
		// marker.setAnimation(BMAP_ANIMATION_BOUNCE);//图标动画
	}
</script>
<%
    String str="";
    %>
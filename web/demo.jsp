<%-- 
    Document   : demo
    Created on : 2019-3-3, 16:47:16
    Author     : lzk
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Language" content="zh-CN" />
		<meta charset="utf-8">
		<title>地区选择</title>
		<meta name="Author" content="topoadmin" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, minimal-ui">
		<link rel="stylesheet" type="text/css" href="address-master/dist/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="address-master/dist/amazeui.address.css" />

	</head>

	<body>
			<button type="button" id="address1" class="am-btn am-btn-block am-margin-bottom-sm">
				<i class="am-icon am-icon-home"></i> 选择地址
			</button>
		<form class="am-form am-padding-sm">
			<div class="am-form-group am-input-group" id="address2">
				<span class="am-input-group-label">
					<i class="am-icon am-icon-home"></i>
					<span class="am-padding-horizontal-xs">地址2</span>
				</span>
				<input readonly type="text" name="nickname"  placeholder="请选择地址" required="" value="">
			</div>
		</form>

		<form class="am-form am-padding-sm">
			<div class="am-form-group am-input-group" id="address3">
				<span class="am-input-group-label">
					<i class="am-icon am-icon-home"></i>
					<span class="am-padding-horizontal-xs">地址3</span>
				</span>
				<input readonly type="text" name="nickname" class="am-form-field am-radius" placeholder="请选择地址" required="" value="">
			</div>
		</form>

		<script src="address-master/dist/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="address-master/dist/amazeui.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="address-master/dist/iscroll.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="address-master/dist/address.js" type="text/javascript" charset="utf-8"></script>

		<script type="text/javascript">
			$(function() {
				document.addEventListener('touchmove', function (e) {
					e.preventDefault();
				}, false);
				//	自定义输出
				$("#address1").address({
					customOutput: true,
					selectEnd: function(json,address) {
						for(var key in json) {
							$("#address1-form").find("input[name='" + key + "']").val(json[key]);
						}
					}
				}).on("provTap",function(event,activeli){
					console.log(activeli.text());
				}).on("cityTap",function(event,activeli){
					console.log(activeli.text());
				})
				
				//	带底部的
				$("#address2").address({
					prov: "广东省",
					city: "清远市",
					district: "阳山县",
					scrollToCenter: true,
					footer: true,
					selectEnd: function(json) {
						console.log(JSON.stringify(json));
					}
				});
				
				//	配置级联层数
				$("#address3").address({
					prov: "广东省",
					city: "中山市",
					scrollToCenter: true,
					selectNumber: 2,
				});
				
				//	配置级联层数
				$("#address4").address({
					prov: "海南省",
					scrollToCenter: true,
					selectNumber: 1,
				});

			});
		</script>
	</body>

</html>
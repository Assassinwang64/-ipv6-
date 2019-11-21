
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection" %>

<%@page import="java.util.Properties" %>
<%@page import="javax.mail.Message" %>
<%@page import="javax.mail.Transport" %>
<%@page import="javax.mail.Session" %>
<%@page import="javax.mail.internet.InternetAddress" %>
<%@page import="javax.mail.internet.MimeMessage" %>

<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.RequestDispatcher" %>
<%@page import=" java.util.Date" %>
<%@page import=" java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>Based On RBAC System</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="alternate icon" type="image/png" href="assets/i/favicon.png">
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  
  <link rel="stylesheet" type="text/css" href="address-master/dist/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="address-master/dist/amazeui.address.css" />
                
<link rel="stylesheet" href="css/jquery-labelauty.css">
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery-labelauty.js"></script>
  <script language="javascript">
      function sub(){
      document.getElementById("f1").submit();
      }
</script>
  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="am-g">
    <h1>Based On RBAC System</h1>
  
  </div>
  <hr />
</div>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    <h3>注册</h3>
    <hr>
    <div class="am-btn-group">
      <a href="#" class="am-btn am-btn-secondary am-btn-sm"> Github</a>
      <a href="#" class="am-btn am-btn-success am-btn-sm"> Google+</a>
      <a href="#" class="am-btn am-btn-primary am-btn-sm"> stackOverflow</a>
    </div>
    <br>
    <br>

    <form id="f1" name="reg_form" action="user_register_op.jsp" method="post" onsubmit="return Verify()" class="am-form">
        <label for="password">角色:</label>
        <select name="role" id=""> 
                      <%
                           request.setCharacterEncoding("utf-8");
            Statement stmt5=null,stmt6=null;
            Connection conn=null;
            ResultSet rs5=null,rs6=null;
             String se=(String)session.getAttribute("username");
            conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
            try{
                stmt5=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                stmt6=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                System.out.println("数据库链接成功");
            }catch(SQLException e){
                e.printStackTrace();
            }
            rs5=stmt5.executeQuery("select * from myweb.tb_role");
            while(rs5.next()){
                          Integer sta=rs5.getInt("r_status");
                          String str=rs5.getString("r_name");
                          Integer rid=rs5.getInt("r_id");
                          if(sta.equals(1)){          
                              %>
                              <option value="<%=rid%>"><%=str%></option> 
                       <%   }
                      }
                      %>
              
                  </select> 
        <br>
      <label for="password">用户名:</label>
      <input type="text" name="username"  value="">
      <br>
      <label for="email">邮箱:</label>
      <input type="email" name="mailbox" id="email" value="">
      <br>
      <label for="password">密码:</label>
      <input type="password" name="password" id="password" value="">
      <br>
      <label for="password">再次输入密码:</label>
      <input type="password" name="passwordre" id="password" value="">
      <label for="password">描述:</label>
      <input type="text" name="userdescription"  value="">
      <br>
        


			<div class="am-form-group am-input-group" id="address2">
				<span class="am-input-group-label">
					<i class="am-icon am-icon-home"></i>
					<span class="am-padding-horizontal-xs">地址1</span>
				</span>
				<input readonly type="text" name="address1"  placeholder="请选择地址" required="" value="">
			</div>
                  <div class="am-form-group am-input-group" id="address3">
				<span class="am-input-group-label">
					<i class="am-icon am-icon-home"></i>
					<span class="am-padding-horizontal-xs">地址2</span>
				</span>
				<input readonly type="text" name="address2" class="am-form-field am-radius" placeholder="请选择地址" required="" value="">
			</div>
                  
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

			});
		</script>
     
      <br />
      <div class="am-cf">
        <input type="submit" onclick="sub();" name="Submit" value="点击注册" class="am-btn am-btn-primary am-btn-sm am-fl">
        <a href="index.html"  class="am-btn am-btn-secondary am-btn-sm"> 登录页 ^_^</a>
      </div>
    </form>
    <hr>
    <p class="am-padding-left">© 2018 Lan &copy;版权所有 <a href="mailto:demo.com">mail me:jakelan123@163.com</a></p>
  </div>
</div>
</body>
</html>


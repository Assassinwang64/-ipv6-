
<%@page contentType="text/html" pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Based On RBAC System</title>
	<link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/animate.min.css">
</head>
<body background="img/bg.jpg">

<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
      <script language="javascript">
      function sub(){
      document.getElementById("f1").submit();
      }
      </script>
<div class="logo_box"><br/><br/><br/><br/><br/><br/><br/><br/>

	<img data-wow-duration="800ms" data-wow-delay="500ms" class="wow bounceInDown animated" id="imglogo" src="img/logo.png" alt="CampusMall">
	<form action="mainpagere.jsp" name="f" id="f1" method="post">
		<div data-wow-duration="800ms" class="wow slideInLeft animated">
		<div class="input_outer" >
			<span class="u_user"></span>
			<input name="username" placeholder="���������¼" class="text" style="color: #ffffff">
		</div>
		</div>
		<div data-wow-duration="800ms" class="wow slideInRight animated">
		<div class="input_outer">
			<span class="us_uer"></span>
		<input type="password" name="password" placeholder="��������" class="text">
		</div>
		</div>
		<div data-wow-duration="800ms" data-wow-delay="500ms" class="wow bounceInDown animated">
                    <div class="mb2"><a class="act-but submit" onclick="sub();" style="color: #000000">��¼</a></div>
                <input name="savesid" value="0" id="check-box" class="checkbox" type="checkbox"><span style="color: #ffffff">��ס�û���?</span>
			<a href="retrievePwd.html" class="login-fgetpwd" style="color: #ffffff">�������룿</a>


			<div class="sas">
				<a href="user_register.jsp" style="color: #ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ûע���˺ţ�</a>
			</div>
		</div>
	</form>


</div>

</body>
</html>

<%-- 
    Document   : admin-index
    Created on : 2019-3-2, 16:52:57
    Author     : lzk
--%>
<%@page import="java.util.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>
<%@page import="p1.Address" %>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!doctype html>
<html class="no-js fixed-layout">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Based On RBAC System</title>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  
  <link rel="stylesheet" href="css/jquery-labelauty.css">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/jquery-labelauty.js"></script>


 <script language="javascript">
      function sub(){
      document.getElementById("f1").submit();
      }
      function resetBtn(fm){
      fm.reset();
     return false;
      }
      function resetBtn(fm){
      fm.reset();
     return false;
      }
</script>
<script language="javascript">
      function confirmd() {  
            var msg = "您真的确定要删除吗？  请确认！";  
            if (confirm(msg)==true){  
                document.getElementById("f2").submit();
                //return true;  
            }else{  
                return false;  
            }  
        }
      function sub(){
      document.getElementById("f2").submit();
      }
      function resetBtn(fm){
      fm.reset();
     return false;
      }
      function sub2(){
      document.getElementById("f2").submit();
      }
      function resetBtn(fm){
      fm.reset();
     return false;
      }
</script>
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->
<script>
$(function(){
	$(':input').labelauty();
});
</script>
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
<script language="javascript">
      function del(){
      }
</script>
<style>
ul { list-style-type: none;}
li { display: inline-block;}
li { margin: 10px 0;}
input.labelauty + label { font: 12px "Microsoft Yahei";}
</style>

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <strong>智能家居</strong> <small>权限管理系统</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

 <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li><a href="javascript:;"></a></li>
      <%
    String nowuser1=(String)session.getAttribute("username");
%>
      <li><a href="javascript:;"> 用户 <span class="am-badge am-badge-warning"><%=nowuser1%></span></a></li>
      <li><a href="javascript:;"><span class="am-icon-envelope-o"></span> 拓展块 <span class="am-badge am-badge-warning">1</span></a></li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> 拓展块 <span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="#"><span class="am-icon-user"></span> 资料</a></li>
          <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
          <li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>
        </ul>
      </li>
      <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
    <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="admin_index.html"><span class="am-icon-home"></span> 首页</a></li>
        <li class="admin-parent">
          <a id="collapse-click" class="am-cf"><span class="am-icon-file"></span> 个人 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
            <li><a href="admin_map.jsp" class="am-cf"><span class="am-icon-puzzle-piece"></span> 您的位置</a></li>
            <li><a href="#" class="am-cf"><span class="am-icon-calendar"></span> 系统日志</a></li>
          </ul>
          <script>
              $("#collapse-nav").slideUp();
              $("#collapse-click").click(function(){
                  $("#collapse-nav").slideToggle();
              });
           
          </script>
        </li>
        <li class="admin-parent">
          <a id="role_manage" class="am-cf" data-am-collapse="{target: '#role_manage_detail'}"><span class="am-icon-file"></span> 角色管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="role_manage_detail">
            <li><a href="admin_role_add.jsp" class="am-cf"><span class="am-icon-check"></span> 添加角色</a></li>
            <li><a href="admin_role_edit.jsp" class="am-cf"><span class="am-icon-check"></span> 编辑角色</a></li>
            <li><a href="admin_role_delete.jsp" class="am-cf"><span class="am-icon-check"></span> 删除角色</a></li>
            <li><a href="admin_role_lock.jsp" class="am-cf"><span class="am-icon-check"></span> 锁定角色</a></li>
            <li><a href="admin_role_unlock.jsp" class="am-cf"><span class="am-icon-check"></span> 解锁角色</a></li>
            <li><a href="admin_role_list.jsp" class="am-cf"><span class="am-icon-check"></span> 角色列表</a></li>
          </ul>
          <script>
              $("#role_manage_detail").slideUp();
              $("#role_manage").click(function(){
                  $("#role_manage_detail").slideToggle();
              });
           
          </script>
        </li>
        <li class="admin-parent">
          <a id="user_manage" class="am-cf" data-am-collapse="{target: '#user_nav'}"><span class="am-icon-file"></span> 用户管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="user_nav">

            <li><a href="admin_user_lock.jsp" class="am-cf"><span class="am-icon-check"></span> 锁定用户</a></li>
            <li><a href="admin_user_unlock.jsp" class="am-cf"><span class="am-icon-check"></span> 解锁用户</a></li>
            <li><a href="admin_user_list.jsp" class="am-cf"><span class="am-icon-check"></span> 用户列表</a></li>
          </ul>
           <script>
              $("#user_nav").slideUp();
              $("#user_manage").click(function(){
                  $("#user_nav").slideToggle();
              });
           
          </script>
        </li>
        <li class="admin-parent">
          <a id="ja" class="am-cf" data-am-collapse="{target: '#ja_manage'}"><span class="am-icon-file"></span> 家居管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="ja_manage">
            <li><a href="admin_intelligentHome_add.jsp" class="am-cf"><span class="am-icon-check"></span> 添加家居</a></li>
            <li><a href="admin_intelligentHome_edit.jsp"><span class="am-icon-check"></span>编辑家居</a></li>
            <li><a href="admin_intelligentHome_delete.jsp"><span class="am-icon-check"></span> 删除家居</a></li>
            <li><a href="admin_intelligentHomeResource_add.jsp" class="am-cf"><span class="am-icon-check"></span> 添加家居权限</a></li>
            <li><a href="admin_intelligentHomeResource_edit.jsp"><span class="am-icon-check"></span>编辑家居权限</a></li>
            <li><a href="admin_intelligentHomeResource_delete.jsp"><span class="am-icon-check"></span> 删除家居权限</a></li>
            <li><a href="admin_intelligentHome_list.jsp"><span class="am-icon-check"></span> 家居列表</a></li>
          </ul>
           <script>
              $("#ja_manage").slideUp();
              $("#ja").click(function(){
                  $("#ja_manage").slideToggle();
              });
          </script>
        </li>
        <li><a href="admin_mylog.jsp"><span class="am-icon-table"></span> 登录历史</a></li>
        <li><a href="logout.jsp"><span class="am-icon-sign-out"></span> 注销</a></li>
      </ul>

      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><span class="am-icon-bookmark"></span> 公告</p>
          <p>时光静好，与君语；细水流年，与君同。</p>
        </div>
      </div>

      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><span class="am-icon-tag"></span> welcome</p>
          <p>Welcome to the System</p>
        </div>
      </div>
    </div>
  </div>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">家居权限删除</strong> / <small>模块</small></div>
      </div>
<div class="admin-content">
    <div class="admin-content-body">

      <hr/>
      
    <form id="f2" action="admin_intelligentHomeResource_delete_op.jsp" method="post" name="delete" class="am-form am-form-horizontal">
      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">



        </div>

        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
  <br/>
<div class="am-form-group">
 <%
        String nowuser=(String)session.getAttribute("username");
        %>
<%
    request.setCharacterEncoding("utf-8");
        Statement stmt=null,stmt2=null,stmt3=null,stmt4=null;//语句对象
        Connection conn=null;//结果集对象
        ResultSet rs=null,rs2=null,rs3=null,rs4=null;
        conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
        try{
            stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt2=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt3=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt4=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);

            System.out.println("数据库链接成功");
        }catch(SQLException e){
            e.printStackTrace();
        }
        rs3=stmt3.executeQuery("select * from myweb.tb_intelligent_home_resource");  
        Integer uid=0;
        
    %><br>
        <ul class="dowebok">
<% while(rs3.next()){
    %>
    <li><input type="radio" name="radio1"  value="<%=rs3.getInt("IHRId")%>" data-labelauty="权限ID：<%=rs3.getInt("IHRId")%>&nbsp;名称：<%=rs3.getString("IHName")%>" style="padding-left:500px;" ></li>

 <%  }
    %>
        </ul>             
       &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<button type="button" onclick="sub();" name="Submit" value="提交" class="am-btn am-btn-primary">点击删除</button><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

</div>

            <div class="am-form-group">
              <div class="am-u-sm-9 am-u-sm-push-3" style="padding-left:270px;">
              </div>
            </div>
        </div>
      </div>
                          </form>

    </div>

    <footer class="admin-content-footer">
      <hr>
      <p class="am-padding-left">© 2018 Lan &copy;版权所有 <a href="mailto:demo.com">mail me:jakelan123@163.com</a></p>
    </footer>
  </div>
  <!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>



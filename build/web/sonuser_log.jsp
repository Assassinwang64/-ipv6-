
<%-- 
    Document   : admin-index
    Created on : 2019-3-2, 16:52:57
    Author     : lzk
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.RequestDispatcher" %>
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
<script src="js/jquery-1.8.3.min.js"></script>
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
      document.getElementById("f1").submit();
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

<%
          String nowuser=(String)session.getAttribute("username");
        Statement stq=null,stmtq=null,stmt2q=null,stmt3q=null,stmt4q=null,stmt5q=null,stmt6q=null,stmt7q=null,stmt8q=null,stmt9q=null,stmt10q=null;//语句对象
        Connection connq=null;//结果集对象
        ResultSet rq=null,rsq=null,rs2q=null,rs3q=null,rs4q=null,rs5q=null,rs6q=null,rs7q=null,rs8q=null,rs9q=null,rs10q=null;
        connq=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
        try{
            stq=connq.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmtq=connq.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt2q=connq.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt3q=connq.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt4q=connq.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt5q=connq.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt6q=connq.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt7q=connq.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt8q=connq.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt9q=connq.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt10q=connq.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            System.out.println("SQL linked success");
        }catch(SQLException e){
            e.printStackTrace();
        }
        rs3q=stmt3q.executeQuery("select * from myweb.tb_user where u_name='"+nowuser+"'");  
        Integer uid=0;
        Integer isfather= 0;
        if(rs3q.next()){
            uid=rs3q.getInt("u_id");
            isfather=rs3q.getInt("isFather");
        }
        
        String sql="select * from myweb.tb_resource_user where u_id="+ uid;
        rsq=stmtq.executeQuery(sql);//
        rs2q=stmt2q.executeQuery(sql);//
        rs3q=stmt3q.executeQuery(sql);//
        rs4q=stmt4q.executeQuery(sql);//
        rs5q=stmt5q.executeQuery(sql);//
        rs6q=stmt6q.executeQuery(sql);//
        rs7q=stmt7q.executeQuery(sql);//
        rs8q=stmt8q.executeQuery(sql);//
        rs9q=stmt9q.executeQuery(sql);//
        rs10q=stmt10q.executeQuery(sql);//
        Integer n=0;
    %>
<div class="am-cf admin-main">
  <!-- sidebar start -->
    <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="fauser_index.jsp"><span class="am-icon-home"></span> 首页</a></li>
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 个人 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
            <li><a href="fauser_map.jsp" class="am-cf"><span class="am-icon-puzzle-piece"></span> 您的位置</a></li>
            <li><a href="#" class="am-cf"><span class="am-icon-calendar"></span> 系统日志</a></li>
          </ul>
        </li>
        <% 
                    
                    while(rsq.next()){
                        Integer f=rsq.getInt("s_id");
                        if(f.equals(2)){n=1;}
                    System.out.println("n11"+n);
                    }
                    if(n.equals(1)){
                    %>
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 用户管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <%
                    }
                    %>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
              <% 
                    n=0;
                    while(rs2q.next()){
                        Integer f=rs2q.getInt("s_id");
                        if(f.equals(5)){n=1;}
                    System.out.println("n22"+n);
                    }System.out.println("n22"+n);
                    if(n.equals(1)){
                    %>
            <li><a href="fauser_user_add.jsp" class="am-cf"><span class="am-icon-check"></span> 添加用户</a></li>
            <%
                    }
                    %>
            <% 
                    n=0;
                    while(rs3q.next()){
                        Integer f=rs3q.getInt("s_id");
                        if(f.equals(6)){n=1;}
                    }
                    if(n.equals(1)){
                    %>
            <li><a href="fauser_user_edit.jsp" class="am-cf"><span class="am-icon-check"></span> 编辑用户</a></li>
            <%
                    }
                    %>
            <% 
                    n=0;
                    while(rs4q.next()){
                        Integer f=rs4q.getInt("s_id");
                        if(f.equals(7)){n=1;}
                    }
                    if(n.equals(1)){
                    %>
            <li><a href="fauser_user_delete.jsp" class="am-cf"><span class="am-icon-check"></span> 删除用户</a></li>
            <%
                    }
                    %>
            <% 
                    n=0;
                    while(rs5q.next()){
                        Integer f=rs5q.getInt("s_id");
                        if(f.equals(9)){n=1;}
                    }
                    if(n.equals(1)){
                    %>
            <li><a href="fauser_user_lock.jsp" class="am-cf"><span class="am-icon-check"></span> 锁定用户</a></li>
            <%
                    }
                    %>
            <% 
                    n=0;
                    while(rs6q.next()){
                        Integer f=rs6q.getInt("s_id");
                        if(f.equals(10)){n=1;}
                    }
                    if(n.equals(1)){
                    %>
            <li><a href="fauser_user_unlock.jsp" class="am-cf"><span class="am-icon-check"></span> 解锁用户</a></li>
            <%
                    }
                    %>
            <% 
                    n=0;
                    while(rs7q.next()){
                        Integer f=rs7q.getInt("s_id");
                        if(f.equals(8)){n=1;}
                    }
                    if(n.equals(1)){
                    %>
            <li><a href="fauser_user_list.jsp" class="am-cf"><span class="am-icon-check"></span> 用户列表</a></li>
            <%
                    }
                    %>
          </ul>
        </li>
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 家居管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
              <% 
                    n=0;
                    while(rs8q.next()){
                        Integer f=rs8q.getInt("s_id");
                        if(f.equals(25)){n=1;}
                    }
                    if(n.equals(1)){
                    %>
            <li><a href="fauser_intelligentHome_Application.jsp" class="am-cf"><span class="am-icon-check"></span> 申请家居</a></li>
            <%
                    }
                    %>
            <% 
                    n=0;
                    while(rs9q.next()){
                        Integer f=rs9q.getInt("s_id");
                        if(f.equals(26)){n=1;}
                    }
                    if(n.equals(1)){
                    %>
            <li><a href="fauser_intelligentHome_delete.jsp"><span class="am-icon-check"></span> 删除家居</a></li>
            <%
                    }
                    %>
            <% 
                    n=0;
                    while(rs10q.next()){
                        Integer f=rs10q.getInt("s_id");
                        if(f.equals(30 )){n=1;}
                    }
                    if(n.equals(1)&&isfather.equals(1)){
                    %>
            <li><a href="fauser_intelligentHome_apply_list.jsp"><span class="am-icon-check"></span> 家居操作</a></li>
            <%
                    }
else if(n.equals(1)&&isfather.equals(0)){
                    %>
            <li><a href="sonuser_intelligentHome_apply_list.jsp"><span class="am-icon-check"></span> 家居操作</a></li>
            <%}%>
          </ul>
        </li>
        <%if(isfather.equals(1)){%>
        <li><a href="fauser_log.jsp"><span class="am-icon-table"></span> 登录历史</a></li>
        <%
                    }
else if(isfather.equals(0)){
                    %>
        <li><a href="sonuser_log.jsp"><span class="am-icon-table"></span> 登录历史</a></li>
         <%}%>
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg"></strong>用户列表 / <small>模块</small></div>
      </div>
<div class="admin-content">
    <div class="admin-content-body">   
      <div class="am-g">
      <%
%>
<%
    request.setCharacterEncoding("utf-8");
            Statement stmt=null,stmt2=null,stmt3=null;
            Connection conn=null;
            ResultSet rs=null,rs2=null,rs3=null;
             String se=(String)session.getAttribute("username");
            conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
            try{
                stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                stmt2=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                stmt3=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                System.out.println("数据库链接成功");
            }catch(SQLException e){
                e.printStackTrace();
            }
           rs2=stmt2.executeQuery("select u_id from myweb.tb_user where u_name='"+nowuser+"'");
           Integer nowfa_id=0,now_id=0;
            if(rs2.next()){
                nowfa_id=rs2.getInt("u_id");
                now_id=rs2.getInt("u_id");
            }
            Integer flag=1;Integer value=0;
            rs3=stmt3.executeQuery("select id,username,time,position,IP,userid from myweb.logininfo where userid="+now_id);
        %>

      </div>
            <div class="am-form-group">
              <div class="am-u-sm-9">

                  

          <table class="am-table am-table-bd am-table-striped admin-content-table">
            <thead>
            <tr>
              <th>ID</th><th>用户</th><th>用户ID</th><th>时间</th><th>位置</th><th>IP</th>
            </tr>
            </thead>
            <tbody>
                
                <% while(rs3.next()){
        %><tr>
<td><%=rs3.getInt("id")%></td>
<td><%=rs3.getString("username")%></td>
<td><%=rs3.getInt("userid")%></td>
<td><span class="am-badge am-badge-success"><%=rs3.getString("time")%></span></td>
<td><%=rs3.getString("position")%>&nbsp;&nbsp;</td>
<td><%=rs3.getString("IP")%></td>
</tr>
    <%
        }
    %>
            </tbody>
          </table>
              </div>
            </div>
        </div>
      </div>
        
        

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



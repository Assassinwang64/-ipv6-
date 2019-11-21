
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
        Statement st=null,stmt=null,stmt2=null,stmt3=null,stmt4=null,stmt5=null,stmt6=null,stmt7=null,stmt8=null,stmt9=null,stmt10=null;//语句对象
        Connection conn=null;//结果集对象
        ResultSet r=null,rs=null,rs2=null,rs3=null,rs4=null,rs5=null,rs6=null,rs7=null,rs8=null,rs9=null,rs10=null;
        conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
        try{
            st=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt2=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt3=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt4=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt5=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt6=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt7=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt8=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt9=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt10=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            System.out.println("SQL linked success");
        }catch(SQLException e){
            e.printStackTrace();
        }
        rs3=stmt3.executeQuery("select * from myweb.tb_user where u_name='"+nowuser+"'");  
        Integer uid=0;
        Integer isfather= 0;
        if(rs3.next()){
            uid=rs3.getInt("u_id");
            isfather=rs3.getInt("isFather");
        }
        
        String sql="select * from myweb.tb_resource_user where u_id="+ uid;
        rs=stmt.executeQuery(sql);//
        rs2=stmt2.executeQuery(sql);//
        rs3=stmt3.executeQuery(sql);//
        rs4=stmt4.executeQuery(sql);//
        rs5=stmt5.executeQuery(sql);//
        rs6=stmt6.executeQuery(sql);//
        rs7=stmt7.executeQuery(sql);//
        rs8=stmt8.executeQuery(sql);//
        rs9=stmt9.executeQuery(sql);//
        rs10=stmt10.executeQuery(sql);//
        Integer n=0;
    %>
<div class="am-cf admin-main">
  <!-- sidebar start -->
    <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="fauser_index.jsp"><span class="am-icon-home"></span> 首页</a></li>
        <li class="admin-parent">
         <a class="am-cf" data-am-collapse="{target: '#fuser_me'}"><span class="am-icon-file"></span> 个人 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="fuser_me">
            <li><a href="fauser_map.jsp" class="am-cf"><span class="am-icon-puzzle-piece"></span> 您的位置</a></li>
            <li><a href="#" class="am-cf"><span class="am-icon-calendar"></span> 系统日志</a></li>
          </ul>
        </li>
        <% 
                    
                    while(rs.next()){
                        Integer f=rs.getInt("s_id");
                        if(f.equals(2)){n=1;}
                    System.out.println("n11"+n);
                    }
                    if(n.equals(1)){
                   %>
        <li class="admin-parent">
           <a class="am-cf" data-am-collapse="{target: '#fuser_manage'}"><span class="am-icon-file"></span> 用户管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="fuser_manage">
              <% 
                    n=0;
                    while(rs2.next()){
                        Integer f=rs2.getInt("s_id");
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
                    while(rs3.next()){
                        Integer f=rs3.getInt("s_id");
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
                    while(rs4.next()){
                        Integer f=rs4.getInt("s_id");
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
                    while(rs5.next()){
                        Integer f=rs5.getInt("s_id");
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
                    while(rs6.next()){
                        Integer f=rs6.getInt("s_id");
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
                    while(rs7.next()){
                        Integer f=rs7.getInt("s_id");
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
          <a class="am-cf" data-am-collapse="{target: '#fuser_jiaju'}"><span class="am-icon-file"></span> 家居管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
           <%
                    }
                    %>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="fuser_jiaju">
              <% 
                    n=0;
                    while(rs8.next()){
                        Integer f=rs8.getInt("s_id");
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
                    while(rs9.next()){
                        Integer f=rs9.getInt("s_id");
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
                    while(rs10.next()){
                        Integer f=rs10.getInt("s_id");
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong> / <small>模块</small></div>
      </div>

      <ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
        <li><a href="#" class="am-text-success"><span class="am-icon-btn am-icon-file-text"></span><br/>####<br/></a></li>
        <li><a href="fauser_intelligentHome_apply_list.jsp" class="am-text-warning"><span class="am-icon-btn am-icon-briefcase"></span><br/>家居操作<br/></a></li>
        <li><a href="#" class="am-text-danger"><span class="am-icon-btn am-icon-recycle"></span><br/>####<br/></a></li>
        <%if(isfather.equals(1)){%>
        <li><a href="fauser_log.jsp" class="am-text-secondary"><span class="am-icon-btn am-icon-user-md"></span><br/>登录历史<br/></a></li>
         <%
                    }
else if(isfather.equals(0)){
                    %>
        <li><a href="sonuser_log.jsp" class="am-text-secondary"><span class="am-icon-btn am-icon-user-md"></span><br/>登录历史<br/></a></li>
        <%}%>
      </ul>


      <div class="am-g">
        <div class="am-u-md-6">
          <div class="am-panel am-panel-default">
            <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-1'}">当前授权<span class="am-icon-chevron-down am-fr" ></span></div>
            <div class="am-panel-bd am-collapse am-in" id="collapse-panel-1">
              <ul class="am-list admin-content-file">
                <li>
                  <strong><span class="am-icon-upload"></span> 当前授权收回进度</strong>
                  <p>当前授权收回进度</p>
                  <div class="am-progress am-progress-striped am-progress-sm am-active">
                    <div class="am-progress-bar am-progress-bar-success" style="width: 82%">82%</div>
                  </div>
                </li>
                <li>
                  <strong><span class="am-icon-check"></span> 权限详情</strong>
                  <p>权限详情</p>
                </li>
                <li>
                  <strong><span class="am-icon-check"></span> 授权已用时间</strong>
                  <p>授权已用时间</p>
                </li>
              </ul>
            </div>
          </div>
          <div class="am-panel am-panel-default">
            <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-2'}">信任应用<span class="am-icon-chevron-down am-fr" ></span></div>
            <div id="collapse-panel-2" class="am-in">
              <table class="am-table am-table-bd am-table-bdrs am-table-striped am-table-hover">
                <tbody>
                <tr>
                  <th class="am-text-center">应用商标</th>
                  <th>应用平台</th>
                  <th>信任度</th>
                </tr>
                <tr>
                  <td class="am-text-center"><img src="assets/i/examples/admin-chrome.png" alt=""></td>
                  <td>Google Chrome</td>
                  <td>安全</td>
                </tr>
                <tr>
                  <td class="am-text-center"><img src="assets/i/examples/admin-firefox.png" alt=""></td>
                  <td>Mozilla Firefox</td>
                  <td>安全</td>
                </tr>
                <tr>
                  <td class="am-text-center"><img src="assets/i/examples/admin-ie.png" alt=""></td>
                  <td>Internet Explorer</td>
                  <td>安全</td>
                </tr>
                <tr>
                  <td class="am-text-center"><img src="assets/i/examples/admin-opera.png" alt=""></td>
                  <td>Opera</td>
                  <td>安全</td>
                </tr>
                <tr>
                  <td class="am-text-center"><img src="assets/i/examples/admin-safari.png" alt=""></td>
                  <td>Safari</td>
                  <td>安全</td>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="am-u-md-6">
          <div class="am-panel am-panel-default">
            <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-4'}">当前任务 task<span class="am-icon-chevron-down am-fr" ></span></div>
            <div id="collapse-panel-4" class="am-panel-bd am-collapse am-in">
              <ul class="am-list admin-content-task">
                <li>
                  <div class="admin-task-meta"> Posted on 25/1/2120 by John Clark</div>
                  <div class="admin-task-bd">
                    The starting place for exploring business management; helping new managers get started and experienced managers get better.
                  </div>
                  <div class="am-cf">
                    <div class="am-btn-toolbar am-fl">
                      <div class="am-btn-group am-btn-group-xs">
                        <button type="button" class="am-btn am-btn-default"><span class="am-icon-check"></span></button>
                        <button type="button" class="am-btn am-btn-default"><span class="am-icon-pencil"></span></button>
                        <button type="button" class="am-btn am-btn-default"><span class="am-icon-times"></span></button>
                      </div>
                    </div>
                    <div class="am-fr">
                      <button type="button" class="am-btn am-btn-default am-btn-xs">详情</button>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="admin-task-meta"> Posted on 25/1/2120 by 呵呵呵</div>
                  <div class="admin-task-bd">
                    The starting place for exploring business management; helping new managers get started and experienced managers get better.
                  </div>
                  <div class="am-cf">
                    <div class="am-btn-toolbar am-fl">
                      <div class="am-btn-group am-btn-group-xs">
                        <button type="button" class="am-btn am-btn-default"><span class="am-icon-check"></span></button>
                        <button type="button" class="am-btn am-btn-default"><span class="am-icon-pencil"></span></button>
                        <button type="button" class="am-btn am-btn-default"><span class="am-icon-times"></span></button>
                      </div>
                    </div>
                    <div class="am-fr">
                      <button type="button" class="am-btn am-btn-default am-btn-xs">详情</button>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>

          <div class="am-panel am-panel-default">
            <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-3'}">温馨提示<span class="am-icon-chevron-down am-fr" ></span></div>
            <div class="am-panel-bd am-collapse am-in am-cf" id="collapse-panel-3">
              <ul class="am-comments-list admin-content-comment">
                <li class="am-comment">
                  <a href="#"><img src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/96/h/96" alt="" class="am-comment-avatar" width="48" height="48"></a>
                  <div class="am-comment-main">
                    <header class="am-comment-hd">
                      <div class="am-comment-meta"><a href="#" class="am-comment-author">**</a> *** <time>****</time></div>
                    </header>
                    <div class="am-comment-bd"><p>遵循 “移动优先（Mobile First）”、“渐进增强（Progressive enhancement）”的理念，可先从移动设备开始开发网站，逐步在扩展的更大屏幕的设备上，专注于最重要的内容和交互，很好。</p>
                    </div>
                  </div>
                </li>

                <li class="am-comment">
                  <a href="#"><img src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/96/h/96" alt="" class="am-comment-avatar" width="48" height="48"></a>
                  <div class="am-comment-main">
                    <header class="am-comment-hd">
                      <div class="am-comment-meta"><a href="#" class="am-comment-author">**</a> *** <time>****</time></div>
                    </header>
                    <div class="am-comment-bd"><p>有效减少为兼容旧浏览器的臃肿代码；基于 CSS3 的交互效果，平滑、高效。AMUI专注于现代浏览器（支持HTML5），不再为过时的浏览器耗费资源，为更有价值的用户提高更好的体验。</p>
                    </div>
                  </div>
                </li>

              </ul>
              <ul class="am-pagination am-fr admin-content-pagination">
                <li class="am-disabled"><a href="#">&laquo;</a></li>
                <li class="am-active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&raquo;</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>

    <footer class="admin-content-footer">
      <hr>
      <p class="am-padding-left">? 2018 Lan &copy;版权所有 <a href="mailto:demo.com">mail me:lan@163.com</a></p>
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



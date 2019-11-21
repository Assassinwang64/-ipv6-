
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong> / <small>模块</small></div>
      </div>

      <ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
        <li><a href="admin_role_list.jsp" class="am-text-success"><span class="am-icon-btn am-icon-file-text"></span><br/>角色列表<br/></a></li>
        <li><a href="admin_intelligentHome_list.jsp" class="am-text-warning"><span class="am-icon-btn am-icon-briefcase"></span><br/>家居列表<br/></a></li>
        <li><a href="admin_user_list.jsp" class="am-text-danger"><span class="am-icon-btn am-icon-recycle"></span><br/>用户列表<br/></a></li>
        <li><a href="admin_mylog.jsp" class="am-text-secondary"><span class="am-icon-btn am-icon-user-md"></span><br/>登录历史<br/></a></li>
      </ul>


      <div class="am-g">
        <div class="am-u-md-6">
          <div class="am-panel am-panel-default">
            <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-1'}">当前<span class="am-icon-chevron-down am-fr" ></span></div>
            <div class="am-panel-bd am-collapse am-in" id="collapse-panel-1">
              <ul class="am-list admin-content-file">
                <li>
                  <strong><span class="am-icon-upload"></span> 当前进度</strong>
                  <p>当前进度</p>
                  <div class="am-progress am-progress-striped am-progress-sm am-active">
                    <div class="am-progress-bar am-progress-bar-success" style="width: 82%">82%</div>
                  </div>
                </li>
                <li>
                  <strong><span class="am-icon-check"></span> 详情</strong>
                  <p>详情</p>
                </li>
                <li>
                  <strong><span class="am-icon-check"></span> 已用时间</strong>
                  <p>已用时间</p>
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
            <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-4'}"> task<span class="am-icon-chevron-down am-fr" ></span></div>
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
      <p class="am-padding-left">© 2018 Lan &copy;版权所有 <a href="mailto:demo.com">mail me:lan@163.com</a></p>
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
<script src="assets/js/amazeui.min.js">
    $("#collapse-nav").collapse('close');
    $("#role_manage_detail").collapse('close');
    $("#user_nav").collapse('close');
</script>
<script src="assets/js/app.js"></script>
</body>
</html>



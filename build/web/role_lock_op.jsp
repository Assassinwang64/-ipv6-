<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.*" %>
<%@page import="java.lang.Integer  " %>
<%@page import="javax.servlet.RequestDispatcher" %>
<%@page contentType="text/html" pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>Based On RBAC System</title>
        <link rel="stylesheet" type="text/css" href="web.css">
    </head>
    <body>
<%!RequestDispatcher dispatcher;%>
        <%
            request.setCharacterEncoding("utf-8");
         //request.setCharacterEncoding("GB2312");
         String radiostr=request.getParameter("radio1");
         Statement stmt=null;
         Connection conn=null;
         ResultSet rs=null;
         String se=(String)session.getAttribute("username");
         conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
         try{
                stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                System.out.println("数据库链接成功");
            }catch(SQLException e){
                e.printStackTrace();
            }
         java.lang.String strConn;
         java.sql.Statement sqlStmt=null;
         java.sql.ResultSet sqlRst=null;
          PreparedStatement Stmt=null;
          Class.forName("com.mysql.jdbc.Driver");
          conn=java.sql.DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
          sqlStmt=conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY);
          Stmt=conn.prepareStatement("update myweb.tb_role set r_status=0 where r_id="+radiostr);
          Stmt.executeUpdate(); 
         dispatcher=request.getRequestDispatcher("admin_role_lock.jsp");
                dispatcher.forward(request, response); 
         %>
    </body>
</html>
    
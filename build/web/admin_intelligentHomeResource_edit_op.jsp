<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.RequestDispatcher" %>
<%@page import=" java.util.Date" %>
<%@page import=" java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>Based On RBAC System</title>
        <link rel="stylesheet" type="text/css" href="web.css">
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String nowuser=(String)session.getAttribute("username");
%>
        <%
            request.setCharacterEncoding("utf-8");
            Statement stmt=null,stmt2=null,stmt7=null;//语句对象
            ResultSet rs=null,rs2=null,rs7=null;

            Connection conn=null;
            PreparedStatement pstmt=null,pstmt2=null;
            FileInputStream fis=null;
             conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
        try{
            stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt2=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt7=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            System.out.println("数据库链接成功");
        }catch(SQLException e){
            e.printStackTrace();
        }

            
            String radioid=request.getParameter("radio1");
            String ihname=request.getParameter("IHRName");
            String ihdes=request.getParameter("IHRDescription");
            PreparedStatement Stmt=null,Stmt2=null,pstmt3=null;
            Stmt=conn.prepareStatement("update myweb.tb_intelligent_home_resource set IHName='"+ihname+"'"+" where IHRId="+radioid);
            Stmt.executeUpdate(); 
            Stmt=conn.prepareStatement("update myweb.tb_intelligent_home_resource set IHDescription='"+ihdes+"'"+" where IHRId="+radioid);
            Stmt.executeUpdate(); 
            //request.setCharacterEncoding("GB2312");
 

            RequestDispatcher dispatcher=request.getRequestDispatcher("admin_intelligentHomeResource_edit.jsp");
                dispatcher.forward(request, response); 
            %>
    </body>
</html>
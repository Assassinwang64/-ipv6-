<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.*" %>
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
        <h1>Hello World!</h1>
        <%
            request.setCharacterEncoding("utf-8");
            String radiostr=request.getParameter("radio1");
            int usid=Integer.parseInt(radiostr);
            String un=(String)session.getAttribute("username");
            if(radiostr!=""){
            Connection conn=null;
            Statement stmt=null;
            PreparedStatement pstmt=null,pstmt2=null;
            FileInputStream fis=null;
            conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
            try{
                stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                System.out.println("数据库链接成功");
            }catch(SQLException e){
                e.printStackTrace();
            }
            ResultSet rs=null;
            pstmt=conn.prepareStatement("delete from myweb.tb_user where u_id="+usid);
            pstmt.executeUpdate();
            pstmt2=conn.prepareStatement("delete from myweb.tb_role_user where u_id="+usid);
            pstmt2.executeUpdate();
            out.print("<script>alert('角色删除成功...'); </script>");
            out.print("<script>window.location='fauser_user_delete.jsp' </script>");
            }
            %>
    </body>
</html>
    
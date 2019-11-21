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
            String operate=request.getParameter("operate");
            String opuid=request.getParameter("uid");
            String opihid=request.getParameter("ihid");
            System.out.println(operate);
            System.out.println(opuid);
            System.out.println(opihid);
%>
        <%
            request.setCharacterEncoding("utf-8");
            Connection conn=null;
            conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
   
            
            PreparedStatement Stmt=null;
            Stmt=conn.prepareStatement("update myweb.tb_user_ih set user_ih_operate_char='"+operate+"' "+"where u_id="+opuid +" and ih_id="+opihid);
            Stmt.executeUpdate(); 
           //request.setCharacterEncoding("GB2312");
 

            RequestDispatcher dispatcher=request.getRequestDispatcher("sonuser_intelligentHome_apply_list.jsp");
                dispatcher.forward(request, response); 
            %>
    </body>
</html>
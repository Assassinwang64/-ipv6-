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
            Statement stmt=null,stmt2=null;//语句对象
            ResultSet rs=null,rs2=null;
            int ihidadd=0;
            Connection conn=null;
            PreparedStatement pstmt=null;
            FileInputStream fis=null;
             conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
        try{
            stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt2=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            System.out.println("数据库链接成功");
        }catch(SQLException e){
            e.printStackTrace();
        }
            String sql3="select * from myweb.logid where description='user_ih_idadd'";
            rs=stmt.executeQuery(sql3);
            if(rs.next())
            {
            ihidadd=rs.getInt("number");
            }
            
            ihidadd++;System.out.println(ihidadd);
            
            String radiostr=request.getParameter("radio1");
            int radioint=Integer.parseInt(radiostr);
            String sql4="select u_id from myweb.tb_user where u_name='"+nowuser+"'";
            rs2=stmt2.executeQuery(sql4);
            Integer usid=0;
            if(rs2.next())
            {
            usid=rs2.getInt("u_id");
            }

            pstmt=conn.prepareStatement("insert into myweb.tb_user_ih(id,u_id,ih_id,user_ih_operate,user_ih_operate_char) values(?,?,?,?,?)");
            pstmt.setInt(1,ihidadd);
            pstmt.setInt(2,usid);
            pstmt.setInt(3,radioint);
            int a=0;
            pstmt.setInt(4,a);
            pstmt.setString(5,"初始状态");
            pstmt.executeUpdate();
            
            PreparedStatement Stmt=null,pstmt3=null;
            Stmt=conn.prepareStatement("update myweb.logid set number="+ihidadd+" where description='user_ih_idadd'");
            Stmt.executeUpdate(); 
            request.setCharacterEncoding("GB2312");
 

            RequestDispatcher dispatcher=request.getRequestDispatcher("fauser_intelligentHome_Application.jsp");
                dispatcher.forward(request, response); 
            %>
    </body>
</html>
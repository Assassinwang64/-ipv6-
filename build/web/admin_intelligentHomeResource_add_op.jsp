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
            int ihrid=0;
            int ihstaop=0;
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
            String sql3="select * from myweb.logid where description='intelligenthomeresource_idadd'";
            String sql32="select * from myweb.logid where description='operate_status_idadd'";
            rs=stmt.executeQuery(sql3);
            rs2=stmt2.executeQuery(sql32);
            if(rs.next())
            {
            ihrid=rs.getInt("number");
            }
            if(rs2.next())
            {
            ihstaop=rs2.getInt("number");
            }
            
            ihrid++;System.out.println(ihrid);
            ihstaop++;System.out.println(ihstaop);
            
            String ihname=request.getParameter("IHRName");
            String ihdes=request.getParameter("IHRDescription");
            String opstaid="";
            SimpleDateFormat formater=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String roct=formater.format(new Date());
            int rostatus=0;
            String rocreator=nowuser;
            if(ihname!=""&&ihdes!=""){
            pstmt=conn.prepareStatement("insert into myweb.tb_intelligent_home_resource(IHRId,IHName,IHDescription,ih_operate_status) values(?,?,?,?)");
            pstmt.setInt(1,ihrid);
            pstmt.setString(2,ihname);
            pstmt.setString(3,ihdes);
            pstmt.setInt(4,ihstaop);
   
            pstmt.executeUpdate();
            }
            PreparedStatement Stmt=null,Stmt2=null,pstmt3=null;
            Stmt=conn.prepareStatement("update myweb.logid set number="+ihrid+" where description='intelligenthomeresource_idadd'");
            Stmt.executeUpdate(); 
            Stmt=conn.prepareStatement("update myweb.logid set number="+ihstaop+" where description='operate_status_idadd'");
            Stmt.executeUpdate(); 
            //request.setCharacterEncoding("GB2312");
 

            RequestDispatcher dispatcher=request.getRequestDispatcher("admin_intelligentHomeResource_add.jsp");
                dispatcher.forward(request, response); 
            %>
    </body>
</html>
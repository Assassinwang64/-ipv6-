<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.Integer" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.RequestDispatcher" %>
<%@page import=" java.util.Date" %>
<%@page import=" java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
            Statement stmt=null,stmt7=null;//语句对象
            ResultSet rs=null,rs7=null;
            int intelligenthomeid=0;
            Connection conn=null;
            PreparedStatement pstmt=null;
            FileInputStream fis=null;
             conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
        try{
            stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt7=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            System.out.println("数据库链接成功");
        }catch(SQLException e){
            e.printStackTrace();
        }
            String sql3="select * from myweb.logid where description='intelligenthome_idadd'";
            rs=stmt.executeQuery(sql3);
            if(rs.next())
            {
            intelligenthomeid=rs.getInt("number");
            }
            
            intelligenthomeid++;System.out.println(intelligenthomeid);
            
            String ihname=request.getParameter("IHName");
            String ihdes=request.getParameter("IHDescription");
            Integer ihId = new Integer(request.getParameter("IHId"));
            SimpleDateFormat formater=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String ct=formater.format(new Date());
            int status=0;
            String creator=nowuser;
            if(ihname!=""&&ihdes!=""){
            pstmt=conn.prepareStatement("insert into myweb.tb_intelligent_home(IHId,IHName,IHDescription,IHCreateTime,IHStatus,IHCreator) values(?,?,?,?,?,?)");
            pstmt.setInt(1,ihId);
            pstmt.setString(2,ihname);
            pstmt.setString(3,ihdes);
            pstmt.setString(4,ct);
            pstmt.setInt(5,status);
            pstmt.setString(6,creator);
            pstmt.executeUpdate();
            }
            /*
            PreparedStatement Stmt=null,pstmt3=null;
            Stmt=conn.prepareStatement("update myweb.logid set number="+intelligenthomeid+" where description='intelligenthome_idadd'");
            Stmt.executeUpdate(); 
            //request.setCharacterEncoding("GB2312");
            String resourceid=new String();
            String[] paramValues=request.getParameterValues("checkbox1");
            for(int i=0;i<paramValues.length;i++)
           {
             int ihresource_ih_idadd=0;
            String sqlsu="select * from myweb.logid where description='ihresource_ih_idadd'";
            rs7=stmt7.executeQuery(sqlsu);
            if(rs7.next())
            {
            ihresource_ih_idadd=rs7.getInt("number");
            }
            ihresource_ih_idadd++;System.out.println(ihresource_ih_idadd);
            
            PreparedStatement Stmt33=null;
            Stmt33=conn.prepareStatement("update myweb.logid set number="+ihresource_ih_idadd+" where description='ihresource_ih_idadd'");
            Stmt33.executeUpdate(); 
            
            resourceid=paramValues[i];
             Integer sid=Integer.parseInt(resourceid);
             pstmt3=conn.prepareStatement("insert into myweb.tb_ihresource_ih(id,ihresource_id,ih_id) values(?,?,?)");
             pstmt3.setInt(1,ihresource_ih_idadd);
             pstmt3.setInt(2,sid);
             pstmt3.setInt(3,intelligenthomeid);
             pstmt3.executeUpdate();
         }
            */
            RequestDispatcher dispatcher=request.getRequestDispatcher("admin_intelligentHome_add.jsp");
            dispatcher.forward(request, response); 
            %>
    </body>
</html>
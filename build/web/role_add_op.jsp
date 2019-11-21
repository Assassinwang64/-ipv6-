<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.lang.Integer" %>
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
            Statement stmt=null,stmt7=null;//语句对象
            ResultSet rs=null,rs7=null;
           // int roleid=0;
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
        /*
            String sql3="select * from myweb.logid where description='role_idadd'";
            rs=stmt.executeQuery(sql3);
            if(rs.next())
            {
            roleid=rs.getInt("number");
            }
            roleid++;System.out.println(roleid);
            */
                int roleid=Integer.parseInt(request.getParameter("roleidadd"));
            String roname=request.getParameter("rolename");
            String rodes=request.getParameter("roledescription");
            SimpleDateFormat formater=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String roct=formater.format(new Date());
            int rostatus=0;
            String rocreator=nowuser;
            if(roname!=""&&rodes!=""){
            pstmt=conn.prepareStatement("insert into myweb.tb_role(r_id,r_name,r_description,r_create_time,r_status,r_creator) values(?,?,?,?,?,?)");
            pstmt.setInt(1,roleid);
            pstmt.setString(2,roname);
            pstmt.setString(3,rodes);
            pstmt.setString(4,roct);
            pstmt.setInt(5,rostatus);
            pstmt.setString(6,rocreator);
            pstmt.executeUpdate();
            }
            
            /*
            PreparedStatement Stmt=null,pstmt3=null;
            Stmt=conn.prepareStatement("update myweb.logid set number="+roleid+" where description='role_idadd'");
            Stmt.executeUpdate(); 
            request.setCharacterEncoding("GB2312");
            String resourceid=new String();
            String[] paramValues=request.getParameterValues("checkbox1");
            for(int i=0;i<paramValues.length;i++)
           {
             int source_role_idadd=0;
            String sqlsu="select * from myweb.logid where description='source_role_idadd'";
            rs7=stmt7.executeQuery(sqlsu);
            if(rs7.next())
            {
            source_role_idadd=rs7.getInt("number");
            }
            source_role_idadd++;System.out.println(source_role_idadd);
            
            PreparedStatement Stmt33=null;
            Stmt33=conn.prepareStatement("update myweb.logid set number="+source_role_idadd+" where description='source_role_idadd'");
            Stmt33.executeUpdate(); 
            
            resourceid=paramValues[i];
             Integer sid=Integer.parseInt(resourceid);
             pstmt3=conn.prepareStatement("insert into myweb.tb_resource_role(id,s_id,r_id) values(?,?,?)");
             pstmt3.setInt(1,source_role_idadd);
             pstmt3.setInt(2,sid);
             pstmt3.setInt(3,roleid);
             pstmt3.executeUpdate();
         }
*/
            RequestDispatcher dispatcher=request.getRequestDispatcher("admin_role_add.jsp");
                dispatcher.forward(request, response); 
            %>
    </body>
</html>
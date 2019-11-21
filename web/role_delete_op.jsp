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
        <%
            request.setCharacterEncoding("utf-8");
            String roidstr=request.getParameter("roleid");
            int roid=Integer.parseInt(roidstr);
            String un=(String)session.getAttribute("username");
            if(roidstr!=""){
            Connection conn=null;
            Statement stmt=null;
            PreparedStatement pstmt=null;
            FileInputStream fis=null;
            conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
            try{
                stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                System.out.println("数据库链接成功");
            }catch(SQLException e){
                e.printStackTrace();
            }
        ResultSet rs=null;

        String sql="select * from myweb.tb_role_user";/* where r_id="+roid*/
        rs=stmt.executeQuery(sql);
        Integer a=0,b=0;
        if(rs.next())
        {
        a=rs.getInt("r_id");System.out.println(a);
        if(a.equals(roid)){b=111;System.out.println("roid:"+roid);}
        rs.next();
        }
        if(b.equals(0))
        {
            pstmt=conn.prepareStatement("delete from myweb.tb_role where r_id="+roid);
            pstmt.executeUpdate();
            out.print("<script>alert('角色删除成功...'); </script>");
            out.print("<script>window.location='admin_role_delete.jsp' </script>");
        }
        else{
            out.print("<script>alert('该角色存在用户！ 不能删除...'); </script>");
            out.print("<script>window.location='admin_role_delete.jsp' </script>");
        }
            }
            %>
    </body>
</html>
    
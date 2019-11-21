
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.Properties" %>
<%@page import="javax.mail.Message" %>
<%@page import="javax.mail.Transport" %>
<%@page import="javax.mail.Session" %>
<%@page import="javax.mail.internet.InternetAddress" %>
<%@page import="javax.mail.internet.MimeMessage" %>
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
        <%
            String nowuser=(String)session.getAttribute("username");
%>
        <%
            request.setCharacterEncoding("utf-8");
            Statement stmt=null,stmt2=null,stmt3=null,stmt6=null,stmt7=null,stmt8=null;//语句对象
            ResultSet rs=null,rs2=null,rs3=null,rs6=null,rs7=null,rs8=null;
            int userid=0;
            Connection conn=null;
            PreparedStatement pstmt=null,pstmt2=null,pstmt3=null;
            FileInputStream fis=null;
             conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
        try{
            stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt2=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt3=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt6=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt7=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt8=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            System.out.println("数据库链接成功");
        }catch(SQLException e){
            e.printStackTrace();
        }
            String sql3="select * from myweb.logid where description='user_idadd'";
            rs=stmt.executeQuery(sql3);
            if(rs.next())
            {
            userid=rs.getInt("number");
            }
            
            userid++;System.out.println(userid);
            
            String sql4="select u_id from myweb.tb_user where u_name='"+nowuser+"'";
            rs2=stmt2.executeQuery(sql4);
            Integer usfaid=0;
            if(rs2.next())
            {
            usfaid=rs2.getInt("u_id");
            }
            
            int rsidadd=0;
            String sql5="select * from myweb.logid where description='role_user_idadd'";
            rs3=stmt3.executeQuery(sql5);
            if(rs3.next())
            {
            rsidadd=rs3.getInt("number");
            }
            
            rsidadd++;System.out.println(rsidadd);
            
            
            String usname=request.getParameter("username");
            String pw=request.getParameter("password");
            String pwre=request.getParameter("passwordre");
            String usdes=request.getParameter("userdescription");
            String mail=request.getParameter("mailbox");
            String address1=request.getParameter("address1");
            String address2=request.getParameter("address2");
            SimpleDateFormat formater=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String usct=formater.format(new Date());
            int uslocked=0;
            int usisfa=0;
            String rocreator=nowuser;
            if(usname.compareTo("")!=0&&pw.compareTo("")!=0&&pwre.compareTo("")!=0&&pw.compareTo(pwre)==0&&mail.compareTo("")!=0){
             
                String sql6="select * from myweb.tb_user where u_mailbox='"+mail+"'";
            rs6=stmt6.executeQuery(sql6);
            if(rs6.next()==false){  
                Properties prop = new Properties();
            Properties properties = new Properties();
            prop.setProperty("mail.host", "smtp.163.com");
            prop.setProperty("mail.transport.protocol", "smtp");
            prop.setProperty("mail.smtp.auth", "true");
            prop.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            //1、创建session
            Session sess = Session.getInstance(prop);
            //开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
            sess.setDebug(true);
            //2、通过session得到transport对象
            Transport ts = sess.getTransport();
             //3、使用邮箱的用户名和连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
            ts.connect("smtp.163.com", "jakelan123@163.com", "lan1526468657");
         
            //创建邮件对象
            MimeMessage mess = new MimeMessage(sess);
            //指明邮件的发件人
            String umb=request.getParameter("mailbox");
            mess.setFrom(new InternetAddress(umb));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(umb));
            //邮件的标题
            mess.setSubject("权限管理系统信息");
            //邮件的内容

            mess.setContent("用户："+usname+"  系统分配ID："+userid+"  注册成功", "text/html;charset=UTF-8");
            //4、创建邮件
            Message mes=mess;
            Integer su=1;
            //5、发送邮件
            try{
                ts.sendMessage(mes, mes.getAllRecipients());
                ts.close();
                
            }catch(Exception e){
                e.printStackTrace();
                out.println("怎么会有错");
                //out.print("<script>alert('此邮箱已经注册...请更换邮箱'); </script>");
                //out.print("<script>window.location='user_register.html' </script>");
                su=0;
            }
            
            if(su.equals(1)){
  
            pstmt=conn.prepareStatement("insert into myweb.tb_user(u_id,u_name,u_password,u_description,u_create_time,u_creator_name,u_locked,isFather,u_mailbox,u_father_id,u_address) values(?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setInt(1,userid);
            pstmt.setString(2,usname);
            pstmt.setString(3,pw);
            pstmt.setString(4,usdes);
            pstmt.setString(5,usct);
            pstmt.setString(6,nowuser);
            pstmt.setInt(7,uslocked);
            pstmt.setInt(8,usisfa);
            pstmt.setString(9,mail);
            pstmt.setInt(10,usfaid);
            pstmt.setString(11,address2);
            pstmt.executeUpdate();
            
            
            int rid=0;
            String sql8="select * from myweb.tb_role_user where u_id="+ usfaid;
            rs8=stmt8.executeQuery(sql8);
            if(rs8.next()){
                rid=rs8.getInt("r_id");
            }
            
            
            pstmt2=conn.prepareStatement("insert into myweb.tb_role_user(id,r_id,u_id) values(?,?,?)");
            pstmt2.setInt(1,rsidadd);
            pstmt2.setInt(2,rid);
            pstmt2.setInt(3,userid);
            pstmt2.executeUpdate();
            
            PreparedStatement Stmt2=null;
            Stmt2=conn.prepareStatement("update myweb.logid set number="+rsidadd+" where description='role_user_idadd'");
            Stmt2.executeUpdate(); 
            
            PreparedStatement Stmt=null;
            Stmt=conn.prepareStatement("update myweb.logid set number="+userid+" where description='user_idadd'");
            Stmt.executeUpdate(); 
            
            //////////////////////////////////////////////////////////////////////////////////////
            
            
            
            /////////////////////////////////////////////////////////////////////////
            request.setCharacterEncoding("GB2312");
            String resourceid=new String();
            String[] paramValues=request.getParameterValues("checkbox1");
         for(int i=0;i<paramValues.length;i++)
         {
             int source_user_idadd=0;
            String sqlsu="select * from myweb.logid where description='source_user_idadd'";
            rs7=stmt7.executeQuery(sqlsu);
            if(rs7.next())
            {
            source_user_idadd=rs7.getInt("number");
            }
            source_user_idadd++;System.out.println(source_user_idadd);
            
            PreparedStatement Stmt33=null;
            Stmt33=conn.prepareStatement("update myweb.logid set number="+source_user_idadd+" where description='source_user_idadd'");
            Stmt33.executeUpdate(); 
            
            
             resourceid=paramValues[i];
             Integer sid=Integer.parseInt(resourceid);
             pstmt3=conn.prepareStatement("insert into myweb.tb_resource_user(id,s_id,u_id) values(?,?,?)");
             pstmt3.setInt(1,source_user_idadd);
             pstmt3.setInt(2,sid);
             pstmt3.setInt(3,userid);
             pstmt3.executeUpdate();
         }
            RequestDispatcher dispatcher=request.getRequestDispatcher("fauser_user_add.jsp");
                dispatcher.forward(request, response); 
            }
            else if(su.equals(0)){
                out.print("<script>alert('此邮箱不可用...请更换邮箱'); </script>");
                out.print("<script>window.location='fauser_user_add.jsp' </script>");
            }
            }
            else{
                out.print("<script>alert('此邮箱已被注册...请更换邮箱'); </script>");
                out.print("<script>window.location='fauser_user_add.jsp' </script>");
            }
            }
            else if(usname.compareTo("")==0){
                out.print("<script>alert('用户名不能为空'); </script>");
                out.print("<script>window.location='fauser_user_add.jsp' </script>");
            }else if(pw.compareTo("")==0){
                out.print("<script>alert('密码不能为空'); </script>");
                out.print("<script>window.location='fauser_user_add.jsp' </script>");
            }else if(pwre.compareTo("")==0){
                out.print("<script>alert('密码不能为空'); </script>");
                out.print("<script>window.location='fauser_user_add.jsp' </script>");
            }
                        else if(pw.compareTo(pwre)!=0){
                out.print("<script>alert('两次密码输入不一致'); </script>");
                out.print("<script>window.location='fauser_user_add.jsp' </script>");
            }
                         else if(mail.compareTo("")==0){
                out.print("<script>alert('邮箱不能为空'); </script>");
                out.print("<script>window.location='fauser_user_add.jsp' </script>");
            }
            %>
    </body>
</html>
    
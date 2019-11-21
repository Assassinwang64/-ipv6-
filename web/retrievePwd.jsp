<%@page import="java.util.Properties" %>
<%@page import="javax.mail.Message" %>
<%@page import="javax.mail.Transport" %>
<%@page import="javax.mail.Session" %>
<%@page import="javax.mail.internet.InternetAddress" %>
<%@page import="javax.mail.internet.MimeMessage" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>Based On RBAC System</title>
        <link rel="stylesheet" type="text/css" href="web3.css">
    </head>
    <body>
        <h1>你的密码已发送到你的邮箱</h1><br>
        <%
            request.setCharacterEncoding("utf-8");
            //发邮件必备
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
            String umb=request.getParameter("usermailbox");
            mess.setFrom(new InternetAddress(umb));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(umb));
            //邮件的标题
            mess.setSubject("你的密码妥善保管");
            //邮件的内容
            Statement stmt=null;
            Connection conn=null;
            ResultSet rs=null;
            conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
            try{
                stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                System.out.println("数据库链接成功");
            }catch(SQLException e){
                e.printStackTrace();
            }
            //将用户名是？？的在数据库里查询出来
            String sql="select u_password from myweb.tb_user where u_mailbox='"+umb+"'";//数据库查询语句
            out.println(sql);  
            rs=stmt.executeQuery(sql);
            rs.next();
            mess.setContent(rs.getString("u_password"), "text/html;charset=UTF-8");
            //4、创建邮件
            Message mes=mess;
            //5、发送邮件
            try{
                ts.sendMessage(mes, mes.getAllRecipients());
                ts.close();
            }catch(Exception e){
                e.printStackTrace();
                out.println("怎么会有错");
            }
            try{
                if(rs!=null)
                    rs.close();
            }catch(SQLException e){
                e.printStackTrace();
                out.println("关闭Resultset对象失败");
            }finally{
                try{
                if(conn!=null)
                    conn.close();
            }catch(SQLException e){
                out.println("关闭Connection对象失败");
                e.printStackTrace();
            }finally{
                try{
                    if(stmt!=null)
                        stmt.close();
                }catch(SQLException e){
                    out.println("关闭Statement对象失败");
                    e.printStackTrace();
                }
                }
            }
            %>
        <a href="index.html">
            返回登录界面
        </a>
    </body>
</html>

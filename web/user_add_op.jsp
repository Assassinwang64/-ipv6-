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
            Statement stmt=null,stmt2=null,stmt3=null,stmt6=null;//������
            ResultSet rs=null,rs2=null,rs3=null,rs6=null;
            int userid=0;
            Connection conn=null;
            PreparedStatement pstmt=null,pstmt2=null;
            FileInputStream fis=null;
             conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
        try{
            stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt2=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt3=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt6=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            System.out.println("���ݿ����ӳɹ�");
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
            //1������session
            Session sess = Session.getInstance(prop);
            //����Session��debugģʽ�������Ϳ��Բ鿴��������Email������״̬
            sess.setDebug(true);
            //2��ͨ��session�õ�transport����
            Transport ts = sess.getTransport();
             //3��ʹ��������û����������ʼ��������������ʼ�ʱ����������Ҫ�ύ������û����������smtp���������û��������붼ͨ����֤֮����ܹ����������ʼ����ռ��ˡ�
            ts.connect("smtp.163.com", "jakelan123@163.com", "lan1526468657");
         
            //�����ʼ�����
            MimeMessage mess = new MimeMessage(sess);
            //ָ���ʼ��ķ�����
            String umb=request.getParameter("mailbox");
            mess.setFrom(new InternetAddress(umb));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(umb));
            //�ʼ��ı���
            mess.setSubject("Ȩ�޹���ϵͳ��Ϣ");
            //�ʼ�������

            mess.setContent("�û���"+usname+"  ϵͳ����ID��"+userid+"  ע��ɹ�", "text/html;charset=UTF-8");
            //4�������ʼ�
            Message mes=mess;
            Integer su=1;
            //5�������ʼ�
            try{
                ts.sendMessage(mes, mes.getAllRecipients());
                ts.close();
                
            }catch(Exception e){
                e.printStackTrace();
                out.println("��ô���д�");
                su=0;
            }
            if(su.equals(1)){
            pstmt=conn.prepareStatement("insert into myweb.tb_user(u_id,u_name,u_password,u_description,u_create_time,u_creator_name,u_locked,isFather,u_mailbox,u_father_id) values(?,?,?,?,?,?,?,?,?,?)");
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
            pstmt.executeUpdate();
            int rid=1;//���ӹ���Ա
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
            out.print("<script>alert('ע��ɹ�'); </script>");
            out.print("<script>window.location='user_manage.jsp' </script>");
            }
            else if(su.equals(0)){
                out.print("<script>alert('�����䲻����...���������'); </script>");
                out.print("<script>window.location='user_add.jsp' </script>");
            }
            }
            else{
                out.print("<script>alert('�������ѱ�ע��...���������'); </script>");
                out.print("<script>window.location='user_add.jsp' </script>");
            }
            }

            else if(usname.compareTo("")==0){
                out.print("<script>alert('�û�������Ϊ��'); </script>");
                out.print("<script>window.location='user_add.jsp' </script>");
            }else if(pw.compareTo("")==0){
                out.print("<script>alert('���벻��Ϊ��'); </script>");
                out.print("<script>window.location='user_add.jsp' </script>");
            }else if(pwre.compareTo("")==0){
                out.print("<script>alert('���벻��Ϊ��'); </script>");
                out.print("<script>window.location='user_add.jsp' </script>");
            }
                        else if(pw.compareTo(pwre)!=0){
                out.print("<script>alert('�����������벻һ��'); </script>");
                out.print("<script>window.location='user_add.jsp' </script>");
            }
                         else if(mail.compareTo("")==0){
                out.print("<script>alert('���䲻��Ϊ��'); </script>");
                out.print("<script>window.location='admin_user_add.jsp' </script>");
            }
            %>
    </body>
</html>
    
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
        <h1>��������ѷ��͵��������</h1><br>
        <%
            request.setCharacterEncoding("utf-8");
            //���ʼ��ر�
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
            String umb=request.getParameter("usermailbox");
            mess.setFrom(new InternetAddress(umb));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(umb));
            //�ʼ��ı���
            mess.setSubject("����������Ʊ���");
            //�ʼ�������
            Statement stmt=null;
            Connection conn=null;
            ResultSet rs=null;
            conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
            try{
                stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                System.out.println("���ݿ����ӳɹ�");
            }catch(SQLException e){
                e.printStackTrace();
            }
            //���û����ǣ����������ݿ����ѯ����
            String sql="select u_password from myweb.tb_user where u_mailbox='"+umb+"'";//���ݿ��ѯ���
            out.println(sql);  
            rs=stmt.executeQuery(sql);
            rs.next();
            mess.setContent(rs.getString("u_password"), "text/html;charset=UTF-8");
            //4�������ʼ�
            Message mes=mess;
            //5�������ʼ�
            try{
                ts.sendMessage(mes, mes.getAllRecipients());
                ts.close();
            }catch(Exception e){
                e.printStackTrace();
                out.println("��ô���д�");
            }
            try{
                if(rs!=null)
                    rs.close();
            }catch(SQLException e){
                e.printStackTrace();
                out.println("�ر�Resultset����ʧ��");
            }finally{
                try{
                if(conn!=null)
                    conn.close();
            }catch(SQLException e){
                out.println("�ر�Connection����ʧ��");
                e.printStackTrace();
            }finally{
                try{
                    if(stmt!=null)
                        stmt.close();
                }catch(SQLException e){
                    out.println("�ر�Statement����ʧ��");
                    e.printStackTrace();
                }
                }
            }
            %>
        <a href="index.html">
            ���ص�¼����
        </a>
    </body>
</html>

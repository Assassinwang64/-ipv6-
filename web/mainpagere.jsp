<%@page import="java.util.Properties" %>
<%@page import="javax.mail.Message" %>
<%@page import="javax.mail.Transport" %>
<%@page import="javax.mail.Session" %>
<%@page import="javax.mail.internet.InternetAddress" %>
<%@page import="javax.mail.internet.MimeMessage" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="GBK"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.RequestDispatcher" %>
<%@page import="p1.Address" %>
<%@page import=" java.text.SimpleDateFormat" %>
<%@page import=" java.util.Date" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>Based On RBAC System</title>
    </head>
    <body>
    </body>
    <%!RequestDispatcher dispatcher;%>
    <%
        Statement stmt=null,stmt2=null,stmt3=null,stmt4=null,stmtlog=null;//������
        Connection conn=null;//���������
        ResultSet rs=null,rs2=null,rs3=null,rs4=null,rslog=null,rslog2=null;
        PreparedStatement pstmt=null;
        conn=DriverManager.getConnection("jdbc:mysql://localhost/myweb","jakelan","lzk205445");
        try{
            stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt2=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt3=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt4=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmtlog=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            System.out.println("���ݿ����ӳɹ�");
        }catch(SQLException e){
            e.printStackTrace();
        }
        String un=null;
        String mb=request.getParameter("username");
        String pw=request.getParameter("password");
        String sql="select * from myweb.tb_user where u_mailbox='"+mb+"'";
        rs=stmt.executeQuery(sql);
        int uid=0;
        int loguid=0;
        String tablepw=null;
        String umailbox=null;
        Integer isfa=100;
        if(rs.next())
        {
            umailbox=rs.getString("u_mailbox");
        tablepw=rs.getString("u_password");
        uid=rs.getInt("u_id");
        isfa=rs.getInt("isFather");
        loguid=rs.getInt("u_id");
        un=rs.getString("u_name");
        }
        String hour="";  
        int rid=0;
        String sql2="select * from myweb.tb_role_user where u_id="+uid;
        rs2=stmt2.executeQuery(sql2);
        if(rs2.next())
        {
        rid=rs2.getInt("r_id");
        }
        String sqllog="select * from myweb.logininfo where userid="+uid;
        String pos="";
        rslog=stmtlog.executeQuery(sqllog);
        if(rslog.next())
        {
            pos=rslog.getString("position");//��¼��¼�ĵ�һ�� ��Ϊ��ע��ʱ�Զ���ȡ��ַ ����tb_user�� ��¼ʱ���ȡ�ĵ�ַ�Ƚ�  
        }
        System.out.println(pos);
        
        Address address = new Address();  
        String addr=address.getAddress();
        System.out.println("addr"+addr);
        
        if(pw.equals(tablepw)&&rid==1)
        {
            HttpSession sess = request.getSession();
            sess.setAttribute("username", un);
            ArrayList users=(ArrayList)getServletContext().getAttribute("user");
           //�����ѵ�¼�û��б�
            if(users==null)
            {
                users=new ArrayList();
                users.add(un);
                getServletContext().setAttribute("user", users);
                dispatcher=request.getRequestDispatcher("admin_index.jsp");
                dispatcher.forward(request, response); 
            }
            else if(users.contains(un))  
            {
                request.setAttribute("m","���û��Ѿ���½!!!");  
                RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response); 
                //return; 
            }
            else
            {
                String loginip=request.getRemoteAddr();
                pstmt=conn.prepareStatement("insert into myweb.logininfo(username,IP,time,position,id,userid,fa_id) values(?,?,?,?,?,?,?)");
                if(request.getLocalAddr().toString().contains("0:0:0:0:0:0:0:1"))
                    //����˺Ϳͻ�����һ̨����
                { loginip=/*request.getScheme()+"://*/"127.0.0.1:"+request.getLocalPort();}
                else// request.getScheme() ���ص�ǰ����ʹ�õ�Э�飻���磬һ��Ӧ�÷���http;SSL����https;
                { loginip = /*request.getScheme() + "://" +*/request.getLocalAddr() + ":" + request.getLocalPort();}
                SimpleDateFormat formater=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String strCurrentTime=formater.format(new Date());
                hour = strCurrentTime.substring(11, 13);
                Integer ihour=Integer.parseInt(hour);
                System.out.println("���ڵ�Сʱ��"+hour);
                if(ihour>=18||ihour<=6){
                Properties prop = new Properties();
                Properties properties = new Properties();
                prop.setProperty("mail.host", "smtp.163.com");
                prop.setProperty("mail.transport.protocol", "smtp");
                prop.setProperty("mail.smtp.auth", "true");
                prop.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                //1������session
                Session sess2 = Session.getInstance(prop);
                //����Session��debugģʽ�������Ϳ��Բ鿴��������Email������״̬
                sess2.setDebug(true);
                //2��ͨ��session�õ�transport����
                Transport ts = sess2.getTransport();
                //3��ʹ��������û����������ʼ��������������ʼ�ʱ����������Ҫ�ύ������û����������smtp���������û��������붼ͨ����֤֮����ܹ����������ʼ����ռ��ˡ�
                ts.connect("smtp.163.com", "jakelan123@163.com", "lan1526468657");
                //�����ʼ�����
                MimeMessage mess2 = new MimeMessage(sess2);
                //ָ���ʼ��ķ�����
                String umb=umailbox;
                mess2.setFrom(new InternetAddress(umb));
                mess2.setRecipient(Message.RecipientType.TO, new InternetAddress(umb));
                //�ʼ��ı���
                mess2.setSubject("Ȩ�޹���ϵͳ��Ϣ ҹ���¼��ʾ��");
               //�ʼ�������
                mess2.setContent("ҹ���¼��ʾ�� ��¼ʱ�䣺"+strCurrentTime, "text/html;charset=UTF-8");
                //4�������ʼ�
                Message mes2=mess2;
                Integer su=1;
                //5�������ʼ�
                try{
                    ts.sendMessage(mes2, mes2.getAllRecipients());
                    ts.close();   
                }catch(Exception e){
                    e.printStackTrace();
                    out.println("��ô���д�");
                    su=0;
                }
                }               
               if(pos.equals(addr)==false)   {//��������˻�ȡ��ַҪ�ĺ��ͺ���
                     Properties prop = new Properties();
               Properties properties = new Properties();
               prop.setProperty("mail.host", "smtp.163.com");
               prop.setProperty("mail.transport.protocol", "smtp");
               prop.setProperty("mail.smtp.auth", "true");
               prop.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
               //1������session*
               Session sess2 = Session.getInstance(prop);
               //����Session��debugģʽ�������Ϳ��Բ鿴��������Email������״̬
               sess2.setDebug(true);
               //2��ͨ��session�õ�transport����
               Transport ts = sess2.getTransport();
                //3��ʹ��������û����������ʼ��������������ʼ�ʱ����������Ҫ�ύ������û����������smtp���������û��������붼ͨ����֤֮����ܹ����������ʼ����ռ��ˡ�
               ts.connect("smtp.163.com", "jakelan123@163.com", "lan1526468657");
               //�����ʼ�����
               MimeMessage mess2 = new MimeMessage(sess2);
               //ָ���ʼ��ķ�����
               String umb=umailbox;
               mess2.setFrom(new InternetAddress(umb));
               mess2.setRecipient(Message.RecipientType.TO, new InternetAddress(umb));
               //�ʼ��ı���
               mess2.setSubject("Ȩ�޹���ϵͳ��Ϣ ��ص�¼��ʾ��");
               //�ʼ�������
               mess2.setContent("��ص�¼��ʾ�� ��¼ʱ�䣺"+strCurrentTime+"   ��¼�ص㣺"+"��ǰ��ȡ��ַ", "text/html;charset=UTF-8");
               //4�������ʼ�
               Message mes2=mess2;
               //5�������ʼ�
               try{
                   ts.sendMessage(mes2, mes2.getAllRecipients());
                   ts.close();   
               }catch(Exception e){
                   e.printStackTrace();
                   out.println("��ô���д�");
               }
               }  
               int logid=5;
               String sql3="select * from myweb.logid where description='idadd'";
               rs3=stmt3.executeQuery(sql3);
               if(rs3.next())
               {
               logid=rs3.getInt("number");
               }
               logid++;System.out.println(logid);
               String nowuser=(String)session.getAttribute("username");
               rs4=stmt4.executeQuery("select u_father_id from myweb.tb_user where u_name='"+nowuser+"'");
               Integer nowfa_id=0;
               if(rs4.next()){
                   nowfa_id=rs4.getInt("u_father_id");
               }
               pstmt.setString(1,un);
               pstmt.setString(2,loginip);
               pstmt.setString(3,strCurrentTime);
               pstmt.setString(4,"���ͺ���");
               pstmt.setInt(5,logid);
               pstmt.setInt(6,loguid);
               pstmt.setInt(7,nowfa_id);
               pstmt.executeUpdate();
               PreparedStatement Stmt=null;
               Stmt=conn.prepareStatement("update myweb.logid set number="+logid+" where description='idadd'");
               Stmt.executeUpdate(); 
               users.add(un);
               getServletContext().setAttribute("user",users);  
               dispatcher=request.getRequestDispatcher("admin_index.jsp");
               dispatcher.forward(request, response); 
               }
            
           }
        else if(pw.equals(tablepw)&&rid!=1)
        {
            HttpSession sess = request.getSession();
            sess.setAttribute("username", un);
            ArrayList users=(ArrayList)getServletContext().getAttribute("user");
           //�����ѵ�¼�û��б�
            if(users==null)
            {
                users=new ArrayList();
                users.add(un);
                getServletContext().setAttribute("user", users);
                dispatcher=request.getRequestDispatcher("fauser_index.jsp");
                dispatcher.forward(request, response); 
            }
            else if(users.contains(un))  
            {
                request.setAttribute("m","���û��Ѿ���½!!!");  
                RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response); 
                //return; 
            }
            else
            {
                String loginip=request.getRemoteAddr();
                pstmt=conn.prepareStatement("insert into myweb.logininfo(username,IP,time,position,id,userid,fa_id) values(?,?,?,?,?,?,?)");
                if(request.getLocalAddr().toString().contains("0:0:0:0:0:0:0:1"))
                    //����˺Ϳͻ�����һ̨����
                { loginip=/*request.getScheme()+"://*/"127.0.0.1:"+request.getLocalPort();}
                else// request.getScheme() ���ص�ǰ����ʹ�õ�Э�飻���磬һ��Ӧ�÷���http;SSL����https;
                { loginip = /*request.getScheme() + "://" +*/request.getLocalAddr() + ":" + request.getLocalPort();}
                
                
                SimpleDateFormat formater=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String strCurrentTime=formater.format(new Date());
                //System.out.println(strCurrentTime);
                
                hour = strCurrentTime.substring(11, 13);
                Integer ihour=Integer.parseInt(hour);
                System.out.println("���ڵ�Сʱ��"+hour);
                
                if(ihour>=17||ihour<=6){
                    
                    Properties prop = new Properties();
                    Properties properties = new Properties();
                    prop.setProperty("mail.host", "smtp.163.com");
                    prop.setProperty("mail.transport.protocol", "smtp");
                    prop.setProperty("mail.smtp.auth", "true");
                    prop.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                    //1������session
                    Session sess2 = Session.getInstance(prop);
                    //����Session��debugģʽ�������Ϳ��Բ鿴��������Email������״̬
                    sess2.setDebug(true);
                    //2��ͨ��session�õ�transport����
                    Transport ts = sess2.getTransport();
                     //3��ʹ��������û����������ʼ��������������ʼ�ʱ����������Ҫ�ύ������û����������smtp���������û��������붼ͨ����֤֮����ܹ����������ʼ����ռ��ˡ�
                    ts.connect("smtp.163.com", "jakelan123@163.com", "lan1526468657");
                    //�����ʼ�����
                    MimeMessage mess2 = new MimeMessage(sess2);
                    //ָ���ʼ��ķ�����
                    String umb=umailbox;
                    mess2.setFrom(new InternetAddress(umb));
                    mess2.setRecipient(Message.RecipientType.TO, new InternetAddress(umb));
                    //�ʼ��ı���
                    mess2.setSubject("Ȩ�޹���ϵͳ��Ϣ ҹ���¼��ʾ��");
                    //�ʼ�������
                    mess2.setContent("ҹ���¼��ʾ�� ��¼ʱ�䣺"+strCurrentTime, "text/html;charset=UTF-8");
                    //4�������ʼ�
                    Message mes2=mess2;
                    Integer su=1;
                    //5�������ʼ�
                    try{
                        ts.sendMessage(mes2, mes2.getAllRecipients());
                        ts.close();  
                    }catch(Exception e){
                        e.printStackTrace();
                        out.println("��ô���д�");
                        su=0;
                    }
                }
                if(pos.equals(addr)==false)   {//��������˻�ȡ��ַҪ�ĺ��ͺ���
                    Properties prop = new Properties();
                    Properties properties = new Properties();
                    prop.setProperty("mail.host", "smtp.163.com");
                    prop.setProperty("mail.transport.protocol", "smtp");
                    prop.setProperty("mail.smtp.auth", "true");
                    prop.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                    //1������session*
                    Session sess2 = Session.getInstance(prop);
                    //����Session��debugģʽ�������Ϳ��Բ鿴��������Email������״̬
                    sess2.setDebug(true);
                    //2��ͨ��session�õ�transport����
                    Transport ts = sess2.getTransport();
                     //3��ʹ��������û����������ʼ��������������ʼ�ʱ����������Ҫ�ύ������û����������smtp���������û��������붼ͨ����֤֮����ܹ����������ʼ����ռ��ˡ�
                    ts.connect("smtp.163.com", "jakelan123@163.com", "lan1526468657");
                   //�����ʼ�����
                    MimeMessage mess2 = new MimeMessage(sess2);
                    //ָ���ʼ��ķ�����
                    String umb=umailbox;
                    mess2.setFrom(new InternetAddress(umb));
                   mess2.setRecipient(Message.RecipientType.TO, new InternetAddress(umb));
                    //�ʼ��ı���
                    mess2.setSubject("Ȩ�޹���ϵͳ��Ϣ ��ص�¼��ʾ��");
                    //�ʼ�������
                    mess2.setContent("��ص�¼��ʾ�� ��¼ʱ�䣺"+strCurrentTime+"   ��¼�ص㣺"+"��ǰ��ȡ��ַ", "text/html;charset=UTF-8");
                    //4�������ʼ�
                    Message mes2=mess2;
                    //5�������ʼ�
                    try{
                        ts.sendMessage(mes2, mes2.getAllRecipients());
                        ts.close();
                    }catch(Exception e){
                        e.printStackTrace();
                        out.println("��ô���д�");
                    }
                }
            int logid=5;
            String sql3="select * from myweb.logid where description='idadd'";
            rs=stmt.executeQuery(sql3);
            if(rs.next())
            {
            logid=rs.getInt("number");
            }
            logid++;System.out.println(logid);
            String nowuser=(String)session.getAttribute("username");
            rs4=stmt4.executeQuery("select u_father_id from myweb.tb_user where u_name='"+nowuser+"'");
            Integer nowfa_id=0;
            if(rs4.next()){
                nowfa_id=rs4.getInt("u_father_id");
            }
            pstmt.setString(1,un);
            pstmt.setString(2,loginip);
            pstmt.setString(3,strCurrentTime);
            pstmt.setString(4,"���ͺ���");
            pstmt.setInt(5,logid);
            pstmt.setInt(6,loguid);
            pstmt.setInt(7,nowfa_id);
            pstmt.executeUpdate();
            PreparedStatement Stmt=null;
            Stmt=conn.prepareStatement("update myweb.logid set number="+logid+" where description='idadd'");
            Stmt.executeUpdate(); 
            users.add(un);
            getServletContext().setAttribute("user",users);  
            dispatcher=request.getRequestDispatcher("fauser_index.jsp");
            dispatcher.forward(request, response); 
            }
        }
        
        else{
            dispatcher=request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response); 
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
        <%--
             String user=request.getParameter("username");
             session.setAttribute("username", user);
        String nowuser=(String)session.getAttribute("username");
        //out.print("��ǰ�û���"+nowuser+"<hr/>");
        ArrayList users=(ArrayList)getServletContext().getAttribute("user");
            if(users==null)
            {
                users=new ArrayList();
                users.add(user);
                getServletContext().setAttribute("user", users);
                
            }
            else if(users.contains(user))  
            {
                //request.setAttribute("m","���û��Ѿ���½!!!");  
                RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response); 
                //return; 
            }
            else
            {
                users.add(user);
                getServletContext().setAttribute("user",users);  
                RequestDispatcher dispatcher=request.getRequestDispatcher("mainpage.jsp");
                dispatcher.forward(request, response); 
            }
        --%>
</html>

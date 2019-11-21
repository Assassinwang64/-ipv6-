<%@page contentType="text/html" pageEncoding="GBK"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.RequestDispatcher" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>Based On RBAC System</title>
        <link rel="stylesheet" type="text/css" href="web2.css">
    </head>
    <body>
        <% 
            ArrayList users=(ArrayList)getServletContext().getAttribute("user");
            String us=(String) session.getAttribute("username");
            users.remove(us);
            session.setAttribute("users", users);//注销用户
            session.invalidate();
            out.print("<script>window.location='index.html' </script>");
        %>
    </body>

</html>

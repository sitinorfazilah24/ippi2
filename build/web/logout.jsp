<%-- 
    Document   : logout
    Created on : May 19, 2017, 1:42:42 PM
    Author     : Fujitsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
    </body>
</html>

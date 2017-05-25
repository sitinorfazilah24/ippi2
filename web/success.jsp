<%-- 
    Document   : success
    Created on : May 1, 2017, 2:46:49 AM
    Author     : Fujitsu
--%>
<%@page import="javax.servlet.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String fname="";
            
            Class.forName("org.postgresql.Driver");
    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-1","postgres","P@ssw0rd");
    PreparedStatement ps = con.prepareStatement("select * from userobject where username='"+request.getSession().getAttribute("userid")+"'");
               ResultSet rs=ps.executeQuery();
        %>
        <%
while (rs.next()) {
%>
        <h1>Welcome,<%=rs.getString(4)%></h1>
        <%}
        %>
    </body>
</html>

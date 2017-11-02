<%-- 
    Document   : authentication
    Created on : Apr 4, 2017, 12:10:11 PM
    Author     : Siti Norfazilah
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.*"%>

<%@ page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authentication</title>
    </head>
    <body>
        <% 
            
            String id =request.getParameter("user");
            String fin=request.getParameter("pass");
            String fname="";
            Statement stmt=null;
            //out.println(id);
            //out.println(fin);
           %> 
           <%   
           //try{
               
               Class.forName("org.postgresql.Driver");
               Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");
               PreparedStatement ps = con.prepareStatement("select * from userobject where username=? and password=? and status='Active' ;");
                ps.setString(1, id);
                ps.setString(2, fin);
                
                ResultSet rs=ps.executeQuery();
                
         if(rs.next()){
            request.getSession().setAttribute("userid", id);
             response.sendRedirect("Dashboard.jsp");
         }
         else{
             response.sendRedirect("index.jsp");
         }       
       
            //}catch(SQLException e){}
                
                %>
    </body>
</html>

<%-- 
    Document   : addbooks-sub
    Created on : Nov 10, 2017, 11:01:08 PM
    Author     : mohdr
--%>
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
    String studid = (String)session.getAttribute("studid");
    Class.forName("org.postgresql.Driver");
    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");
    
    String bookid= request.getParameter("bookid");
    String title= request.getParameter("title");
    String form= request.getParameter("form");
    String publisher= request.getParameter("publisher");
    String price= request.getParameter("price");
    
    
    
    
    String queryText = null;

            
                queryText = "insert into public.books values ('" + bookid + "','" + form + "','" + title + "','" + publisher + "','" + price + "','Active')";
                
                try {

                       Statement stat = con.createStatement();
                       ResultSet rst = stat.executeQuery(queryText);
                       rst.close();
                       stat.close();
                       con.close();
                   } catch (Exception e) {e.printStackTrace(); }
                
          
        response.sendRedirect("addbooks.jsp");
%>
    </body>
</html>

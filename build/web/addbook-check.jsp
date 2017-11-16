<%-- 
    Document   : addbook-check
    Created on : Nov 14, 2017, 11:23:50 PM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <body>
        <%
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");

            String check= request.getParameter("bookid");
            



            String queryText = null;

            
                queryText = "SELECT bookid FROM public.books WHERE bookid = '" + check + "'";
                
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

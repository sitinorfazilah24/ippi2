<%-- 
    Document   : addbooks-del
    Created on : Nov 11, 2017, 1:18:05 AM
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

            String del= request.getParameter("title");
            



            String queryText = null;

            
                queryText = "DELETE FROM public.books WHERE title = '" + del + "'";
                
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

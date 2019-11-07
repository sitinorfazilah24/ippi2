<%-- 
    Document   : newcard4
    Created on : Nov 30, 2017, 7:40:02 PM
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

            String title= request.getParameter("title");
            String id= request.getParameter("id");
            



            String queryText = null;

            
                queryText = "UPDATE public.books SET  status='Active' WHERE id='"+id+"' AND title='"+title+"'";
                
                try {
                       Statement stat = con.createStatement();
                       ResultSet rst = stat.executeQuery(queryText);
                       
                       
                       
                       rst.close();
                       stat.close();
                       con.close();
                   } catch (Exception e) {e.printStackTrace(); }
        
          
        response.sendRedirect("newcard.jsp");
        %>
    </body>
</html>

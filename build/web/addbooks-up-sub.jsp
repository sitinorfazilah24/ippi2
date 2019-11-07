<%-- 
    Document   : addbooks-up-sub
    Created on : Nov 12, 2017, 12:57:52 AM
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

            String bookid= request.getParameter("bookid");
            String title= request.getParameter("title");
            String form= request.getParameter("form");
            String publisher= request.getParameter("publisher");
            String price= request.getParameter("price");
            String up= request.getParameter("up");
            



            String queryText = null;

            
                queryText = "UPDATE public.books SET title='" + title + "', forms ='" + form + "', publisher='" + publisher + "', price='" + price + "', dateadd=current_date WHERE title='" + up + "'  ";
                
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

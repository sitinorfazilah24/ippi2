<%-- 
    Document   : testjq
    Created on : Nov 30, 2017, 11:32:49 PM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");




            String queryText = null;

            
                queryText = "SELECT * FROM public.books WHERE status='Active'";
                
                try {
                       Statement stat = con.createStatement();
                       ResultSet rst = stat.executeQuery(queryText);
                       while(rst.next()){
                           %>
                    <tr>
                        <td ><%=rst.getString("title")%></td><br>

                    </tr>
                <%
                       }
                       
                       
                       rst.close();
                       stat.close();
                       con.close();
                   } catch (Exception e) {e.printStackTrace(); }
        
          
        %>

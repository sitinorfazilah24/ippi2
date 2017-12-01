<%-- 
    Document   : newcard2
    Created on : Nov 29, 2017, 6:20:49 AM
    Author     : mohdr
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <div class="container form-group">
        <div class="panel panel-default">
            <table class="table">

                    <tr>
                        <th><b>Books identification</b></th>
                        <th><b>Form</b></th>
                        <th><b>Books Title</b></th>
                        <th><b>Publisher</b></th>
                        <th><b>Price</b></th>
                        <th><b>Status</b></th>
                        <th><b>Total Books</b></th>
                        <th><b>Action</b></th>
                    </tr>
                
        
         <%
             
        String driverName = "org.postgresql.Driver";
        String connectionUrl = "jdbc:postgresql://localhost:5432/";
        String dbName = "spbt-I";
        String userId = "postgres";
        String password = "12345";
            
            Statement statement = null;
            ResultSet resultSet = null;
   
        Connection con2 = DriverManager.getConnection(connectionUrl+dbName, userId, password);
    
        try {
        Class.forName(driverName);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }
    
    

        try{
        
        statement=con2.createStatement();
        String sql ="SELECT DISTINCT bookid, forms, title, publisher, price, status FROM public.books WHERE status='Active'";

        resultSet = statement.executeQuery(sql);
        int i=0,x=0;
        while(resultSet.next()){
//            String bookid =resultSet.getString("bookid");

                try{ 
                    String queryText ="SELECT * FROM public.books WHERE title='"+resultSet.getString("title")+"' AND status='Active'";
                    Statement statt = con2.createStatement();
                    ResultSet rstt = statt.executeQuery(queryText);
                    
                    while(rstt.next()){
                        x=rstt.getRow();
                    }
                    
                    } catch (Exception e) {
                    e.printStackTrace();
                    }
                
                    String id="";
                    
                    try {
                        String sql2 = "SELECT * FROM public.books WHERE title='"+resultSet.getString("title")+"' AND status='Active' LIMIT 1 ";
                        Statement stat3 = con2.createStatement();
                        ResultSet rst3 = stat3.executeQuery(sql2);
                        while(rst3.next()){
                            id=rst3.getString("id");
                        }
                    } catch (Exception e) {e.printStackTrace(); }
                    
                %>
                    <tr>
                    
            
                    <td name="bookid"><%=resultSet.getString("bookid")%></td>
                    <td><%=resultSet.getString("forms") %></td>
                    <td><%=resultSet.getString("title") %></td>
                    <td><%=resultSet.getString("publisher")%></td>
                    <td><%=resultSet.getString("price") %></td>
                    <td><%=resultSet.getString("status") %></td>
                    <td><%=x %></td>
                    <td>
                        
                        <a class="btn btn-primary" onclick="myFunction()" href="http://localhost:8080/SPBTSystem/newcard3.jsp?title=<%=resultSet.getString("title")%>&id=<%=id%>" role="button">Activate</a> 
                    </td>
                    </tr>
                <%
                   i++;
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        %>
        </table>
        </div>
        </div>

                
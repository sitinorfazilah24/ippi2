<%-- 
    Document   : addbooks-sub2
    Created on : Nov 12, 2017, 12:41:47 AM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <div class="container form-group">
        <div class="panel panel-default">
            <table class="table">

                    <tr>
                        <th><b>Form</b></th>
                        <th><b>Books Title</b></th>
                        <th><b>Publisher</b></th>
                        <th><b>Price</b></th>
                        <th><b>Date Added</b></th>
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
        String sql ="SELECT DISTINCT forms, title, publisher, price, dateadd FROM public.books";

        resultSet = statement.executeQuery(sql);
        int i=0,x=0;
        while(resultSet.next()){
//            String bookid =resultSet.getString("bookid");

                try{ 
                    String queryText ="SELECT * FROM public.books WHERE title='"+resultSet.getString("title")+"'";
                    Statement statt = con2.createStatement();
                    ResultSet rstt = statt.executeQuery(queryText);
                    
                    while(rstt.next()){
                        x=rstt.getRow();
                    }
                    
                    } catch (Exception e) {
                    e.printStackTrace();
                    }
                %>
                <!--<form method="post" action="http://localhost:8080/SPBTSystem/addbooks-del.jsp">-->
                    <tr>
                    
            
                    <td><%=resultSet.getString("forms") %></td>
                    <td><%=resultSet.getString("title") %></td>
                    <td><%=resultSet.getString("publisher")%></td>
                    <td><%=resultSet.getString("price") %></td>
                    <td><%=resultSet.getString("dateadd") %></td>
                    <td><%=x %></td>
                    <td>
                        
                    <a class="btn btn-primary" href="http://localhost:8080/SPBTSystem/addbooks-up.jsp?up=<%=resultSet.getString("title")%>" role="button">update</a>   
                    <a class="btn btn-primary" href="http://localhost:8080/SPBTSystem/addbooks-del.jsp?title=<%=resultSet.getString("title")%>" role="button">delete</a>
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

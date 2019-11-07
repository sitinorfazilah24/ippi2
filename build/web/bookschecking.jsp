<%-- 
    Document   : bookschecking
    Created on : Dec 4, 2017, 12:41:19 AM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SPBT-i</title>
<!--        <link rel="stylesheet" href="assets/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->
        <%@ include file="header.jsp"%>
        <%@ include file="footer.jsp"%>
    </head>
    <body>
        <%@ include file="navbar.jsp"%>
        
        <div class="container-fluid margintop-60">
          <div class="row">
              <%@ include file="sidebar.jsp"%>
              
            <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
<div class="container form-group">
    <h2 align="center"><font><strong>Books Database</strong></font></h2>
            <div class="group">
                <input id="adds" type="submit" class="button" value="Reset ID">
            </div>
        <div class="panel panel-default">
            <table class="table">

                    <tr>
                        <th><b>Books identification</b></th>
                        <th><b>Form</b></th>
                        <th><b>Books Title</b></th>
                        <th><b>Publisher</b></th>
                        <th><b>Price</b></th>
                        <th><b>Status</b></th>
                        <th><b>ID</b></th>
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
                    String queryText ="SELECT * FROM public.books ";
                    Statement statt = con2.createStatement();
                    ResultSet rstt = statt.executeQuery(queryText);
                    
                    while(rstt.next()){
                        
                    
                   
                %>
                <!--<form method="post" action="http://localhost:8080/SPBTSystem/addbooks-del.jsp">-->
                    <tr>
                    
            
                    <td ><%=rstt.getString("bookid")%></td>
                    <td><%=rstt.getString("forms") %></td>
                    <td><%=rstt.getString("title") %></td>
                    <td><%=rstt.getString("publisher")%></td>
                    <td><%=rstt.getString("price") %></td>
                    <td><%=rstt.getString("status") %></td>
                    <td><%=rstt.getString("id") %></td>
                    
                    </tr>
                <%
                  
                    }
                    } catch (Exception e) {
                    e.printStackTrace();
                    }
        

       
        %>
        </table>
        </div>
        </div>
</main>
          </div>
        </div>
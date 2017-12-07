<%-- 
    Document   : fine3
    Created on : Dec 3, 2017, 11:44:23 PM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container form-group">
    <h2 align="center"><font><strong>Books done payment</strong></font></h2>
        <div class="panel panel-default">
            <table class="table" style="width:100%;text-align:left;border-collapse:collapse;background-color:Navy;color:white;">

                    <tr>
                        <th><b>Student ID</b></th>
                        <th><b>Books ID</b></th>
                        <th><b>Books Title</b></th>
                        <th><b>Returned Date</b></th>
                        <th><b>Reason</b></th>
                    </tr>
                
        
         <%
//             String studid=request.getParameter("studid");
        String driverName1 = "org.postgresql.Driver";
        String connectionUrl1 = "jdbc:postgresql://localhost:5432/";
        String dbName1 = "spbt-I";
        String userId1 = "postgres";
        String password1 = "12345";
            
            Statement statement1 = null;
            ResultSet resultSet1 = null;
   
        Connection con = DriverManager.getConnection(connectionUrl1+dbName1, userId1, password1);
    
        try {
        Class.forName(driverName1);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }
    
    

        try{
        
        statement1=con.createStatement();
        String sql ="SELECT * FROM public2.booksborrow WHERE borrow_status='Returned' AND fine_status != '' AND studid='"+studid+"'";

        resultSet1 = statement1.executeQuery(sql);
        int i=0,x=0;
        while(resultSet1.next()){
//            String bookid =resultSet.getString("bookid");

               
                %>
                <!--<form method="post" action="http://localhost:8080/SPBTSystem/addbooks-del.jsp">-->
                    <tr>
                    
                    <td ><%=resultSet1.getString("studid")%></td>
                    <td ><%=resultSet1.getString("bookid")%></td>
                    <td><%=resultSet1.getString("title") %></td>
                    <td><%=resultSet1.getString("return_date") %></td>
                    <td><%=resultSet1.getString("fine_status")%></td>
                    
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

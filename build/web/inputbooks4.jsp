<%-- 
    Document   : inputbooks4
    Created on : Nov 20, 2017, 11:17:51 PM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container-fluid">
            <h5 align="center"><font><strong>Books Borrow</strong></font></h5>
            <div class="panel panel-default">
                <table class="table table-dark">
                    <thead>
                    <tr>
                        <th scope="col">Books List</th>
                        <th scope="col">Borrow Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    
                    
        <%
        String form2 = (String)session.getAttribute("form1");
        String studid1 = (String)session.getAttribute("studid");
        String driverName1 = "org.postgresql.Driver";
        String connectionUrl = "jdbc:postgresql://localhost:5432/";
        String dbName = "spbt-I";
        String userId = "postgres";
        String password = "12345";

        try {
        Class.forName(driverName1);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }

        Connection connection1 = null;
        Statement statement1 = null;
        ResultSet resultSet1 = null;
        %>
        
        <%
        try{ 
        connection1 = DriverManager.getConnection(connectionUrl+dbName, userId, password);
        statement1=connection1.createStatement();
        String sql ="SELECT * FROM public2.booksborrow WHERE borrow_status = 'Not return' AND studid='"+studid1+"'";

        resultSet1 = statement1.executeQuery(sql);
        boolean a=true;
        while(resultSet1.next()){
            a=false;
            %>
                <tr>
                <td><%=resultSet1.getString("title") %></td>
                <td><%=resultSet1.getString("borrow_date") %></td>
                </tr>
            <%  
        }
            if(a==true){
                %>
                    <tr>
                        <td>there's no book has been borrow yet</td>
                    </tr>
                <%
            }
        

        } catch (Exception e) {
        e.printStackTrace();
        }
        %>
        </tbody>
                </table>
            </div>
       </div>

<%-- 
    Document   : nexborrow-sub
    Created on : Nov 2, 2017, 3:46:43 PM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <%
        String form2 = (String)session.getAttribute("form1");
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
        String sql ="SELECT * FROM public2.booksborrow";

        resultSet1 = statement1.executeQuery(sql);
        while(resultSet1.next()){
        %>
        <tr>
            
        <td><%=resultSet1.getString("studid") %></td>
        <td><%=form2 %></td>
        <td><%=resultSet1.getString("title") %></td>
        <td><%=resultSet1.getString("borrow_status") %></td>

        </tr>
        <% 
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        %>

<%-- 
    Document   : nexborrow-sub
    Created on : Nov 2, 2017, 3:46:43 PM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <%
        String id = request.getParameter("registeredid");
        String driverName = "org.postgresql.Driver";
        String connectionUrl = "jdbc:postgresql://localhost:5432/";
        String dbName = "spbt-I";
        String userId = "postgres";
        String password = "12345";

        try {
        Class.forName(driverName);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        %>
        
        <%
        try{ 
        connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
        statement=connection.createStatement();
        String sql ="SELECT * FROM public2.booksborrow";

        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
        %>
        <tr>

        <td><%=resultSet.getString("studid") %></td>
        <td><%=resultSet.getString("bookid") %></td>

        </tr>
        <% 
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        %>

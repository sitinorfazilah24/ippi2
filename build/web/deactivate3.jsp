<%-- 
    Document   : deactivate3
    Created on : Dec 1, 2017, 1:41:23 AM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
             
        String driverName = "org.postgresql.Driver";
        String connectionUrl = "jdbc:postgresql://localhost:5432/";
        String dbName = "spbt-I";
        String userId = "postgres";
        String password = "12345";
        String title= request.getParameter("title");
        String bookid= request.getParameter("id");
            
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
        String sql ="UPDATE public.books SET status='Active' WHERE id='"+bookid+"' AND title='" + title + "'";

        resultSet = statement.executeQuery(sql);

        } catch (Exception e) {
        e.printStackTrace();
        }
        response.sendRedirect("deactivate.jsp");
        %>
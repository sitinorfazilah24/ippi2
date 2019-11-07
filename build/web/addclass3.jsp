<%-- 
    Document   : addclass3
    Created on : Dec 8, 2017, 6:41:01 AM
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
            
            Statement statement = null;
            ResultSet resultSet = null;
            Connection con2 = DriverManager.getConnection(connectionUrl+dbName, userId, password);
            String form=request.getParameter("form");
            String clas=request.getParameter("class");
             String queryText ="DELETE FROM public.class WHERE class='"+clas+"' AND form='"+form+"' ";
                            try{ 

                                Statement statt = con2.createStatement();
                                ResultSet rstt = statt.executeQuery(queryText);


                                } catch (Exception e) {
                                e.printStackTrace();
                                }
                                
  
        response.sendRedirect("addclass.jsp");
%>
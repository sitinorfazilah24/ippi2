<%-- 
    Document   : nexborrow-b
    Created on : Nov 1, 2017, 3:35:09 AM
    Author     : mohdr
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <%
    String studid = (String)session.getAttribute("studid");
    Class.forName("org.postgresql.Driver");
    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");
    
    String fruits[]= request.getParameterValues("check");
    
    
    
    String queryText = null;

            if(fruits != null){
            for(int i=0; i<fruits.length; i++){
                queryText = "insert into public2.booksborrow values ('" + studid + "','" + fruits[i] + "',current_date)";
                
                try {

                       Statement stat = con.createStatement();
                       ResultSet rst = stat.executeQuery(queryText);
                       rst.close();
                       stat.close();
                       con.close();
                   } catch (Exception e) {e.printStackTrace(); }
                }
            
            
//                queryText = "insert into public2.records values ('" + studid + "','" + fruits.toString() + "',current_date)";
//                try {
//
//                       Statement stat = con.createStatement();
//                       ResultSet rst = stat.executeQuery(queryText);
//                       rst.close();
//                       stat.close();
//                       con.close();
//                   } catch (Exception e) { e.printStackTrace();}
                
                
            }
        response.sendRedirect("nexborrow.jsp");
%>

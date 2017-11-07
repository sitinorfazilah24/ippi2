<%-- 
    Document   : nexreturn-sub
    Created on : Nov 7, 2017, 5:01:08 AM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String studid = "dumstudid";
    Class.forName("org.postgresql.Driver");
    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");
    
    String title1[]= request.getParameterValues("check");
    
    
    
    String queryText = null;
    
    
    //ResultSet rs;
    
            
            if(title1 != null){
            for(int i=0; i<title1.length; i++){
                queryText = "DELETE FROM public2.booksborrow WHERE title = '" + title1[i] + "'";
                
                try {

                       Statement stat = con.createStatement();
                       ResultSet rst = stat.executeQuery(queryText);
                       rst.close();
                       stat.close();
                       con.close();
                   } catch (Exception e) { }
                }
            }
        response.sendRedirect("nexreturn.jsp");
%>
<%-- 
    Document   : nexborrow-b
    Created on : Nov 1, 2017, 3:35:09 AM
    Author     : mohdr
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <%
    String studid = "dumstudid";
//    String form1=request.getParameter("BM");
//    String bookid = request.getParameter("BI");
    Class.forName("org.postgresql.Driver");
    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");
    
    String fruits[]= request.getParameterValues("check");
    
    
    
    String queryText = null;
    
    
    //ResultSet rs;
    
            
            if(fruits != null){
            for(int i=0; i<fruits.length; i++){
                queryText = "insert into public2.booksborrow values ('" + studid + "','" + fruits[i] + "')";
                
                try {

                       Statement stat = con.createStatement();
                       ResultSet rst = stat.executeQuery(queryText);
                       rst.close();
                       stat.close();
                       con.close();
                   } catch (Exception e) { }
                }
            }
        response.sendRedirect("nexborrow.jsp");
%>

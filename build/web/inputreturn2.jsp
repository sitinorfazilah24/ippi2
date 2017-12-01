<%-- 
    Document   : inputreturn2
    Created on : Nov 21, 2017, 2:28:51 AM
    Author     : mohdr
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String studid = (String)session.getAttribute("studid");
    Class.forName("org.postgresql.Driver");
    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");
    
    String title= request.getParameter("title");
    String id= request.getParameter("id");
    
    
    String queryText = null;
    String queryText2 = null;

            if(title != null){
//            for(int i=0; i<fruits.length; i++){
                queryText = "UPDATE public2.booksborrow SET borrow_status='Inactive', return_date=current_date WHERE studid='" + studid + "' AND title='" + title + "'";
                
                try {
                       Statement stat = con.createStatement();
                       ResultSet rst = stat.executeQuery(queryText);
                       rst.close();
                       stat.close();
                       con.close();
                   } catch (Exception e) {e.printStackTrace(); }
                
                try {
                        queryText2 = "UPDATE public.books SET status='Active' WHERE title='" + title + "' AND id='" + id + "'";
                        Statement stat2 = con.createStatement();
                        ResultSet rst2 = stat2.executeQuery(queryText2);
                    } catch (Exception e) {e.printStackTrace(); }
//                }
            
            
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
        response.sendRedirect("inputreturn.jsp");
%>

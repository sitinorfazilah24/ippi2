<%-- 
    Document   : inputbooks3
    Created on : Nov 20, 2017, 9:42:17 PM
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
    String queryText2 = null;
                    
                    boolean a=false;
                try {
                       queryText2 = "SELECT * FROM public2.booksborrow WHERE title='"+ title +"'";
                       Statement stat2 = con.createStatement();
                       ResultSet rst2 = stat2.executeQuery(queryText2);
                      
                       
                       while(rst2.next()){
                        a=true;
                        }
                    } catch (Exception e) {e.printStackTrace(); }
                
                
                     if(a==true){
                         try {
                        queryText2 = "UPDATE public2.booksborrow SET borrow_status='Not return', borrow_date=current_date, bookid='" + id + "' WHERE studid='" + studid + "' AND title='" + title + "'";
                        Statement stat2 = con.createStatement();
                        ResultSet rst2 = stat2.executeQuery(queryText2);
                    } catch (Exception e) {e.printStackTrace(); }
                         
                         try {
                        queryText2 = "UPDATE public.books SET status='Activated' WHERE title='" + title + "' AND id='" + id + "'";
                        Statement stat2 = con.createStatement();
                        ResultSet rst2 = stat2.executeQuery(queryText2);
                    } catch (Exception e) {e.printStackTrace(); }
                    
                         
                    }
                     else if(a==false){
    
                    String queryText = null;


                    queryText = "insert into public2.booksborrow values ('" + studid + "','" + title + "','Not return',current_date,'null','" + id + "')";

                    try {

                           Statement stat = con.createStatement();
                           ResultSet rst = stat.executeQuery(queryText);
                           
                       } catch (Exception e) {e.printStackTrace(); }
                    
                    try {
                        queryText2 = "UPDATE public.books SET status='Activated' WHERE title='" + title + "' AND id='" + id + "'";
                        Statement stat2 = con.createStatement();
                        ResultSet rst2 = stat2.executeQuery(queryText2);
                    } catch (Exception e) {e.printStackTrace(); }
                    
                    }
        response.sendRedirect("l-borrow.jsp");
%>
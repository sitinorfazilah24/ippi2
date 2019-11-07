<%-- 
    Document   : l-borrow4
    Created on : Dec 1, 2017, 4:34:24 AM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        String name= request.getParameter("name");
        String studid= request.getParameter("studid");
        String form1= request.getParameter("form");
        String stream= request.getParameter("stream");
        String rfid= request.getParameter("rfid");
//        session.setAttribute("name",name);
//        session.setAttribute("studid",studid);
//        session.setAttribute("forml",form1);
//        session.setAttribute("stream",stream);
//        session.setAttribute("rfid",rfid);
    Class.forName("org.postgresql.Driver");
    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");
    
    
    
    String title= request.getParameter("title");
    String id= request.getParameter("id");
    response.setHeader("location","http://localhost:8080/SPBTSystem/l-borrow2.jsp");
    response.setHeader("location","http://localhost:8080/SPBTSystem/l-borrow3.jsp");
    String queryText2 = null;
                    out.print(title);
                    out.print(id);
                    boolean a=false;
                try {
                       queryText2 = "SELECT * FROM public2.booksborrow WHERE title='"+ title +"' AND studid='" + studid + "'";
                       Statement stat2 = con.createStatement();
                       ResultSet rst2 = stat2.executeQuery(queryText2);
                      
                       
                       while(rst2.next()){
                           out.print(title);
                    out.print(id);
                        a=true;
                        }
                    } catch (Exception e) {e.printStackTrace(); }
                
                
                     if(a==true){
                         try {
                             
                        queryText2 = "UPDATE public2.booksborrow SET borrow_status='Not return', borrow_date= current_date, bookid='" + id + "' WHERE studid='" + studid + "' AND title='" + title + "'";
                        Statement stat2 = con.createStatement();
                        ResultSet rst2 = stat2.executeQuery(queryText2);
                        out.print(title);
                    out.print(id);
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
        response.sendRedirect("l-borrow.jsp?name="+request.getParameter("name")+"&studid="+studid+"&form="+form1+"&stream="+stream+"&rfid="+rfid);
%>
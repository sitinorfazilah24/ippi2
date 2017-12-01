<%-- 
    Document   : i-return3
    Created on : Nov 30, 2017, 12:02:08 PM
    Author     : mohdr
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String studid = (String)session.getAttribute("studid");
    String name = (String)session.getAttribute("name");
    String form = (String)session.getAttribute("form1");
    String stream= request.getParameter("stream");
    String recordid= request.getParameter("recordid");
    session.setAttribute("form1",form);
    session.setAttribute("name",name);
    session.setAttribute("studid",studid);
    response.setHeader("location","http://localhost:8080/SPBTSystem/l-return2.jsp");
    
    Class.forName("org.postgresql.Driver");
    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");
    
    String title= request.getParameter("title");
    String id= request.getParameter("id");
    
    String queryText = null;
    String queryText2 = null;

            if(title != null){
//            for(int i=0; i<fruits.length; i++){
                queryText = "UPDATE public2.booksborrow SET borrow_status='Returned', return_date=current_date WHERE studid='" + studid + "' AND title='" + title + "'";
                
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
        response.sendRedirect("l-return.jsp?name="+name+"&studid="+studid+"&form="+form+"&stream="+stream+"&recordid="+recordid);
%>

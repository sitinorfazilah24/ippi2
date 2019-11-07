<%-- 
    Document   : schedule5
    Created on : Dec 8, 2017, 2:11:15 AM
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
            
            
    String action=request.getParameter("action");
    if(action.equalsIgnoreCase("updatedate")){
    

            String form=request.getParameter("form");
            String date=request.getParameter("inputdate");
            String classup=request.getParameter("classfirst");
                                 
                        
            
            
                                
                                    String queryText ="UPDATE public.schedule SET date='"+date+"' WHERE classess='"+classup+"' AND form='"+form+"'";
                            try{ 

                                Statement statt = con2.createStatement();
                                ResultSet rstt = statt.executeQuery(queryText);


                                } catch (Exception e) {
                                e.printStackTrace();
                                }
                                
  
        response.sendRedirect("schedule3.jsp");
    }else if(action.equalsIgnoreCase("delete")){
        
        
            String form=request.getParameter("form");
            String clas=request.getParameter("classess");

                 
                                    String queryText ="DELETE FROM public.schedule WHERE classess='"+clas+"' AND form='"+form+"' ";
                            try{ 

                                Statement statt = con2.createStatement();
                                ResultSet rstt = statt.executeQuery(queryText);


                                } catch (Exception e) {
                                e.printStackTrace();
                                }
                                
  
        response.sendRedirect("schedule3.jsp");
    }
%>

<%-- 
    Document   : addclass2
    Created on : Dec 8, 2017, 4:51:07 AM
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
            
            String clas=request.getParameter("clas");
        String[] form=request.getParameterValues("form");
        boolean a=true;
        String des="";
        if(form!=null && clas!=null){
            a=false;
        
        
        
                            try{ 
                                for(int i=0;i<form.length;i++){
                                String queryText ="SELECT * FROM public.class WHERE class='"+clas+"' AND form='"+form[i]+"'";

                                Statement statt = con2.createStatement();
                                ResultSet rstt = statt.executeQuery(queryText);

                                while(rstt.next()){
                                    des="Class name "+rstt.getString("class")+" from form "+rstt.getString("form")+" is already have in the database";
                                    a=true;
                                }
                                }

                                } catch (Exception e) {
                                e.printStackTrace();
                                }
        
        
        
                if(a==false){
                            des="Class name is successfully inserted into database";
                                for(int i=0;i<form.length;i++){
                                    String queryText ="INSERT INTO public.class(class, form) VALUES ('"+clas+"', '"+form[i]+"')";
                            try{ 

                                Statement statt = con2.createStatement();
                                ResultSet rstt = statt.executeQuery(queryText);

                                while(rstt.next()){
                                }

                                } catch (Exception e) {
                                e.printStackTrace();
                                }
                                }
                            }
        }else{
                    des="Please select the forms";
                }
        response.sendRedirect("addclass.jsp?des="+des);
%>

<%-- 
    Document   : schedule2
    Created on : Dec 7, 2017, 4:44:08 AM
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
        int clas=Integer.parseInt(request.getParameter("clas"));
        String[] classes=new String[clas];
        String[] dates=new String[clas];
        
        for(int i=0;i<clas;i++){
            String x="clas"+i;
            String y="dates"+i;
            classes[i]=request.getParameter(x);
            dates[i]=request.getParameter(y);
         
        }
        
        
        
        boolean a=true;
        if(classes!=null && dates!=null){
            a=false;
        }
        
        String des="";
                if(a==false){
                            des="Return dates schedule is successfully inserted into database";
                                for(int i=0;i<classes.length;i++){
                                    String queryText ="INSERT INTO public.schedule(classess, date, form) VALUES ('"+classes[i]+"', '"+dates[i]+"', '"+form+"')";
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
                else{
                    des="Dates return time is incomplete. Please insert again";
                }
        response.sendRedirect("schedule.jsp?des="+des);
%>

<%-- 
    Document   : resetid
    Created on : Dec 4, 2017, 12:51:40 AM
    Author     : mohdr
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        
        Calendar now = Calendar.getInstance();   
   
        
        int year=now.get(Calendar.YEAR);
        int total=year-2000;
        total*=10000;
        out.print(total);
        String check="";
                try{ 
                    String queryText ="SELECT * FROM books LIMIT 1;";
                    Statement statt = con2.createStatement();
                    ResultSet rstt = statt.executeQuery(queryText);
                    while(rstt.next()){
                        check=rstt.getString("id");
                    }
                    } catch (Exception e) {
                    e.printStackTrace();
                    }
                out.print(check);

//                try{ 
//                    String queryText ="ALTER SEQUENCE bookid_seq INCREMENT BY 1 MINVALUE 170000 MAXVALUE 179999 START WITH 170000 RESTART WITH 170000 ";
//                    Statement statt = con2.createStatement();
//                    ResultSet rstt = statt.executeQuery(queryText);
//                    } catch (Exception e) {
//                    e.printStackTrace();
//                    }
        

       
        %>

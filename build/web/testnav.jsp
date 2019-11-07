<%-- 
    Document   : addbooks
    Created on : Oct 14, 2017, 4:42:45 AM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SPBT-i</title>
<!--        <link rel="stylesheet" href="assets/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->
      
    </head>
    <body>
     
      
            <%
    out.print("hello");
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");

            out.print("hello");
            String up= "gogo";
            String queryText = null;
//            String up= (String)session.getAttribute("up");
//            session.setAttribute("up",up);
//            response.setHeader("location","http://localhost:8080/SPBTSystem/addbooks-up-sub.jsp");

            
                queryText = "SELECT id FROM public.books WHERE title='"+up+"' AND status='Active' LIMIT 1";
                
                try {
                       Statement stat = con.createStatement();
                       ResultSet rst = stat.executeQuery(queryText);
                       
                       while(rst.next()){
                           
                       String a=rst.getString("id");
                       out.print(a);
          
                        }
                       
                       rst.close();
                       stat.close();
                       con.close();
                   } catch (Exception e) {e.printStackTrace(); }
        
//          out.print("ghello");
//        response.sendRedirect("addbooks.jsp");
        %>
        
        
        
        
       
        
        
 
    </body>
</html>
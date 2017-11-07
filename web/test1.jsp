<%-- 
    Document   : test1
    Created on : Nov 2, 2017, 7:47:17 AM
    Author     : mohdr
--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <title>JSP Page</title>
        <!--<link rel="stylesheet" href="assets/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->
        <%@ include file="header.jsp"%>
    </head>
    <body>
        <%@ include file="navbar.jsp"%>
        
        <div class="container">
        <%
        String form1="4";
        String studid = "dumstudid";
        session.setAttribute("form1",form1);
        response.setHeader("location","http://localhost:8080/SPBTSystem/test2.jsp");
        String driverName = "org.postgresql.Driver";
        Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");
        

        try {
        Class.forName(driverName);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }

        Statement statement = null;
        ResultSet resultSet = null;
        %>
        
        <%
        int z=0;
        try{ 
        
        statement=connection.createStatement();
        String sql ="SELECT * FROM public2.booksborrow WHERE studid = '" + studid + "'";

        resultSet = statement.executeQuery(sql);
        
        while(resultSet.next()){
           z++;
        }
        } catch (Exception e) {
        e.printStackTrace();
        }
         
        %>
        
        <%
        String[] title=new String[z];
        try{ 
        
        statement=connection.createStatement();
        String sql ="SELECT * FROM public2.booksborrow WHERE studid = '" + studid + "'";

        resultSet = statement.executeQuery(sql);
        int i=0;
        
        
        while(resultSet.next()){
           title[i]=resultSet.getString("title");
           i++;
        }
       
//        out.print(title.length);
//        for(int x=0;x<title.length;x++){
//            out.print(title[x]);
//        }

        } catch (Exception e) {
        e.printStackTrace();
        }
         
        %>
        
        <%
        try{ 
        
        statement=connection.createStatement();
        String sql ="SELECT * FROM public.books WHERE forms = '" + form1 + "'";

        resultSet = statement.executeQuery(sql);
        int i=0;
        
        while(resultSet.next()){
            boolean a=true;
            for(int x=0;x<title.length;x++){
                if(title[x].equalsIgnoreCase(resultSet.getString("title"))){
                    a=false;
                    break;
                }
            }
            if(a==true){
                %>
                    <div class="form-check form-check-inline">
                    <label class="form-check-label">
                        <input class="form-check-input" name="check" type="checkbox" id="inlineCheckbox1" value="<%=resultSet.getString("title") %>"> <%=resultSet.getString("title") %>
                    </label>
                    </div>
                <%
            }
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        
        %>

        </div>
   

    <%@ include file="footer.jsp"%>
    </body>
</html>

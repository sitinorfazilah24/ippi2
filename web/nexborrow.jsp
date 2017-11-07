<%-- 
    Document   : nexborrow
    Created on : Nov 1, 2017, 3:21:47 AM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <title>JSP Page</title>
        <!--<link rel]="stylesheet" href="assets/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->
        <%@ include file="header.jsp"%>
    </head>
    <body>
        <%@ include file="navbar.jsp"%>
        
        <form method="post" action="http://localhost:8080/SPBTSystem/nexborrow-b.jsp">
            <div class="container">
            
        <%
        String form1="4";
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
        try{ 
        
        statement=connection.createStatement();
        String sql ="SELECT * FROM public.books WHERE forms = '" + form1 + "'";

        resultSet = statement.executeQuery(sql);
        int i=0;
        while(resultSet.next()){
            %>
            <div class="form-check form-check-inline">
            <label class="form-check-label">
                <input class="form-check-input" name="check" type="checkbox" id="inlineCheckbox1" value="<%=resultSet.getString("title") %>"> <%=resultSet.getString("title") %>
            </label>
            </div>
                <%
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        %>
            
        <div class="group">
            <input type="submit" class="button" value="update">
        </div>
            
        </div>
            
        </form>
        
        <div class="container-fluid">
        <h2 align="center"><font><strong>Books borrow</strong></font></h2>
        <div class="panel panel-default">
            <div class="panel-heading text-center"><b>Details</b></div>
            <table class="table">

        <tr>
        <th><b>Student identification</b></th>
        <th><b>Form</b></th>
        <th><b>Books Title</b></th>
        </tr>
       <%@ include file="nexborrow-sub.jsp"%>
       </table>
       </div>
       </div>
       

    <%@ include file="footer.jsp"%>
    </body>
</html>

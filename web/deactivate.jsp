<%-- 
    Document   : deactivate
    Created on : Nov 30, 2017, 7:44:48 PM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    String driverName = "org.postgresql.Driver";
        String connectionUrl = "jdbc:postgresql://localhost:5432/";
        String dbName = "spbt-I";
        String userId = "postgres";
        String password = "12345";
            String sql ="SELECT DISTINCT title FROM public.books WHERE status='Activated' ORDER BY title ASC";
            Statement statement = null;
            ResultSet resultSet = null;
   
        Connection con2 = DriverManager.getConnection(connectionUrl+dbName, userId, password);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SPBT-i</title>
<!--        <link rel="stylesheet" href="assets/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->
        <%@ include file="header.jsp"%>
        <%@ include file="footer.jsp"%>
    </head>
    <body>
        <%@ include file="navbar.jsp"%>
        
        <div class="container-fluid margintop-60">
          <div class="row">
              <%@ include file="sidebar.jsp"%>
              
            <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
                <form method="post" action="http://localhost:8080/SPBTSystem/deactivate2.jsp">
        
        <div class="container form-group">
        <h3 align="center"><font><strong>Remove card</strong></font></h3>
        
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon1">Books Title</span>
            <select name="title" class="form-control" aria-describedby="basic-addon2">
                <option value="">Select</option>
                <%
                try {
                       Statement stat = con2.createStatement();
                       ResultSet rst = stat.executeQuery(sql);
                       while(rst.next()){
                %>
                <option value="<%=rst.getString("title")%>"><%=rst.getString("title")%></option>
                
                <%
                       }
                   } catch (Exception e) {e.printStackTrace(); }
        
                %>
            </select>
        </div>
        
        
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon2">Books Identification</span>
            <input type="text" id="bookid" name="bookid" class="form-control" placeholder="test" aria-describedby="basic-addon1" required>
        </div>
        
        <div class="group">
                <input id="adds" type="submit" class="button" value="Deactivate">
        </div>
        
        </div>
        </form>
        <%--<%@ include file="test1.jsp"%>--%>
        </div>
        
        
            </main>
          </div>
        </div>
    </body>
</html>


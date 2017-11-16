<%-- 
    Document   : nexreturn
    Created on : Nov 7, 2017, 3:14:32 AM
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
        <div class="container-fluid margintop-60">
          <div class="row">
              <%@ include file="sidebar.jsp"%>
            <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
        
        
        
        
        
        <form method="post" action="http://localhost:8080/SPBTSystem/nexreturn-sub.jsp">
            
        
            <div class="container">
        
        <div class="container-fluid">
            <h2 align="center"><font><strong>Books Return</strong></font></h2>
            <div class="panel panel-default">
                <div class="panel-heading text-center"><b>Details</b></div>
            <table class="table">

            <tr>
            <th><b>Student identification</b></th>
            <th><b>Books Borrow</b></th>
            <th><b>Checks</b></th>
            </tr>
        
 
            
        <%
        String studid = "dumstudid";
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
        String sql ="SELECT * FROM public2.booksborrow WHERE studid = '" + studid + "'";

        resultSet = statement.executeQuery(sql);
        
        int i=0;
        while(resultSet.next()){
            %>
            <tr>
            <td><%=resultSet.getString("studid") %></td>
            <td><%=resultSet.getString("title") %></td>
            <td><input class="form-check-input" name="check" type="checkbox" id="inlineCheckbox1" value="<%=resultSet.getString("title") %>"></td>
            </tr>
                <%
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        %>
        

        
            </table>
       </div>
       </div>
        
        <div class="group">
            <input type="submit" class="button" value="return">
        </div>
        
        </div>
        </form>
        
        
            </main>
          </div>
        </div>
        
        

    <%@ include file="footer.jsp"%>
    </body>
</html>

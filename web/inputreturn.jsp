<%-- 
    Document   : inputreturn
    Created on : Nov 21, 2017, 2:18:16 AM
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
        
        <div class="container-fluid">
            <h2 align="center"><font><strong>Books Returned</strong></font></h2>
            <div class="panel panel-default">
                <table class="table table-dark">
                    <thead>
                    <tr>
                        <th scope="col">Student identification</th>
                        <th scope="col">Form</th>
                        <th scope="col">Books Title</th>
                        <th scope="col">Book Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    
                        <%
        String form2 = (String)session.getAttribute("form1");
        String studid = "dumstudid";
        String driverName1 = "org.postgresql.Driver";
        String connectionUrl = "jdbc:postgresql://localhost:5432/";
        String dbName = "spbt-I";
        String userId = "postgres";
        String password = "12345";

        try {
        Class.forName(driverName1);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }

        Connection connection1 = null;
        Statement statement1 = null;
        ResultSet resultSet1 = null;
        %>
        
        <%
        try{ 
        connection1 = DriverManager.getConnection(connectionUrl+dbName, userId, password);
        statement1=connection1.createStatement();
        String sql ="SELECT * FROM public2.booksborrow WHERE studid='"+ studid +"' AND borrow_status='Inactive'";

        resultSet1 = statement1.executeQuery(sql);
        boolean a=true;
        while(resultSet1.next()){
            a=false;
            %>
                <tr>

                <td><%=resultSet1.getString("studid") %></td>
                <td><%=form2 %></td>
                <td><%=resultSet1.getString("title") %></td>
                <td><%=resultSet1.getString("borrow_status") %></td>

                </tr>
            <%  
        }
            if(a==true){
                %>
                    <tr>
                        <td>there's no book available</td>
                    </tr>
                <%
            }
        

        } catch (Exception e) {
        e.printStackTrace();
        }
        %>
                        
                        
                        
                    </tbody>
                </table>
            </div>
       </div>
        
        
        
            
            
        
            <div class="container">
        
        <div class="container-fluid">
            <h2 align="center"><font><strong>Books Borrow</strong></font></h2>
            <div class="panel panel-default">
            <table class="table table-dark">
                <thead>
            <tr>
            <th>Student identification</th>
            <th>Books Borrow</th>
            <th>Status</th>
            <th>Checks</th>
            </tr>
                </thead>
 
            
        <%
        session.setAttribute("studid",studid);
        response.setHeader("location","http://localhost:8080/SPBTSystem/inputreturn2.jsp");
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
        <tbody>
        <%
        try{ 
        
        statement=connection.createStatement();
        String sql ="SELECT * FROM public2.booksborrow WHERE studid = '" + studid + "' AND borrow_status= 'Active' ";

        resultSet = statement.executeQuery(sql);
        
        int i=0;
        while(resultSet.next()){
            %>
            <tr>
            <td><%=resultSet.getString("studid") %></td>
            <td><%=resultSet.getString("title") %></td>
            <td><%=resultSet.getString("borrow_status") %></td>
            <td><button><a href="inputreturn2.jsp?title=<%=resultSet.getString("title")%>&id=<%=resultSet.getString("bookid")%>">Remove</a></button></td>
            </tr>
                <%
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        %>
        </tbody>

        
            </table>
       </div>
       </div>
        
        </div>
        
        
            </main>
          </div>
        </div>
        
        

    <%@ include file="footer.jsp"%>
    </body>
</html>

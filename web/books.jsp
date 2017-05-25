<%-- 
    Document   : report
    Created on : May 25, 2017, 7:03:13 AM
    Author     : Ridhuan
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>SPBT-i</title>
    <%@ include file="header.jsp"%>

</head>
  <body>
      <%@ include file="navbar.jsp"%>
<%
String id = request.getParameter("bookID");
String driverName = "org.postgresql.Driver";
String connectionUrl = "jdbc:postgresql://localhost:5432/";
String dbName = "spbt-1";
String userId = "postgres";
String password = "P@ssw0rd";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<div class="container-fluid">
<h2 align="center"><font><strong>Books retrieve from database</strong></font></h2>
<div class="panel panel-default">
    <div class="panel-heading text-center"><b>Text Books</b></div>
<table class="table">

<tr>
<th><b>bookID</b></th>
<th><b>forms</b></th>
<th><b>publisher</b></th>
<th><b>price</b></th>
<th><b>userID</b></th>
<th><b>status</b></th>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM book";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getString("bookID") %></td>
<td><%=resultSet.getString("forms") %></td>
<td><%=resultSet.getString("publisher") %></td>
<td><%=resultSet.getString("price") %></td>
<td><%=resultSet.getString("userID") %></td>
<td><%=resultSet.getString("status") %></td>

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
<%@ include file="footer.jsp"%>
</body>

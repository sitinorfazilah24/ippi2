<%-- 
    Document   : l-borrow
    Created on : Nov 29, 2017, 5:31:50 AM
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
        <%@ include file="header.jsp"%>
        <%@ include file="footer.jsp"%>
    </head>
    <body>
<input type="checkbox" id="isAgeSelected"/>
<div >Age is something</div>
<button id="txtAge" type="button" class="btn btn-secondary">Action</button>

<% 
    
    out.print("hello");
Thread.sleep(5000); // sleep 5 seconds
out.print("bye");
%>


</body>
</html>
</html>

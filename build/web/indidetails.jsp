<%-- 
    Document   : indidetails
    Created on : Oct 11, 2017, 5:44:46 AM
    Author     : mohdr
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

    <div class="container-fluid">
        <div class="col-lg-12">
            <div class="header clearfix col-lg-4">
                <h3 class="text-muted">student's name</h3>
            </div>
            <div class="header clearfix col-lg-4">
                <h3 class="text-muted">student's ID</h3>
            </div>
            <div class="header clearfix col-lg-4">
                <h3 class="text-muted">Department/Stream</h3>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="panel panel-default">
            <table class="table">

            <thead class="thead-inverse">
                <tr class="panel-heading text-center">
                    <th><b>No.</b></th>
                    <th><b>Book ID</b></th>
                    <th><b>Book Title</b></th>
                    <th><b>Borrow Date</b></th>
                    <th><b>Book Barcode</b></th>
                </tr>
            </thead>
                

            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
            </tr>

            </table>
        </div>
    </div>

<div class="container-fluid">
    <div class="panel panel-default">
        <div class="panel-heading text-center"><b>List of book not returned:</b></div>
        <table class="table">

            <tr>
            <th><b>No.</b></th>
            <th><b>Book ID</b></th>
            <th><b>Book Title</b></th>
            <th><b>price</b></th>
            </tr>

            <tr>
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            </tr>
        </table>
    </div>
</div>

<%@ include file="footer.jsp"%>
</body>

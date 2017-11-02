<%-- 
    Document   : addbooks
    Created on : Oct 14, 2017, 4:42:45 AM
    Author     : mohdr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <%@ include file="navbar.jsp"%>
        
        <h2 align="center"><font><strong>Add new books</strong></font></h2>
        
        <div class="container">
        
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon1">Book Tittle</span>
            <input type="text" class="form-control" placeholder="Fullname" aria-describedby="basic-addon1">
        </div>
        
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon2">Amount of Book</span>
            <input type="text" class="form-control" placeholder="matrix Number" aria-describedby="basic-addon2">
        </div>
        
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon4">Form</span>
            <input type="text" class="form-control" placeholder="Stream" aria-describedby="basic-addon3">
        </div>
            
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon5">Publisher</span>
            <input type="text" class="form-control" placeholder="Stream" aria-describedby="basic-addon3">
        </div>
            
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon6">Price</span>
            <input type="text" class="form-control" placeholder="Stream" aria-describedby="basic-addon3">
        </div>
        
        </div>
        
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <%@ include file="footer.jsp"%>
    </body>
</html>
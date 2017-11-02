<%-- 
    Document   : removebook
    Created on : Oct 19, 2017, 3:26:54 AM
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
        
        <h2 align="center"><font><strong>Remove books</strong></font></h2>
        
        <div class="container">
        
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon1">Book ID</span>
            <input type="text" class="form-control" placeholder="Books identification" aria-describedby="basic-addon1">
        </div>
            
            <h3>
                Are you sure to DISABLE this book ID?
            </h3>
        
        </div>
        
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <%@ include file="footer.jsp"%>
    </body>
</html>

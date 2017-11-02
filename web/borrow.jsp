<%-- 
    Document   : borrow
    Created on : May 25, 2017, 4:42:44 AM
    Author     : Ridhuan
--%>

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
        
        <form method="post" action="http://localhost:8080/SPBTSystem/updatestud.jsp">
        <div class="container">
        
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon1">Student's Name</span>
            <input id="name1" name="name1" type="text" class="form-control" placeholder="Fullname" aria-describedby="basic-addon1">
        </div>
        
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon2">Student's Identification</span>
            <input id="id1" name="id1" type="text" class="form-control" placeholder="matrix Number" aria-describedby="basic-addon2">
        </div>
        
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon3">Department</span>
            <input id="stream1" name="stream1" type="text" class="form-control" placeholder="Stream" aria-describedby="basic-addon3">
        </div>

        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon4">Forms</span>
            <input id="form1" name="form1" type="text" class="form-control" aria-describedby="basic-addon4">
        </div>
            
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon5">class</span>
            <input id="class1" name="class1" type="text" class="form-control" aria-describedby="basic-addon5">
        </div>
            
        <div class="group">
            <input type="submit" class="button" value="update">
        </div>
            
        </div>
            
        </form>
<!--        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>-->
    <%@ include file="footer.jsp"%>
    </body>
</html>

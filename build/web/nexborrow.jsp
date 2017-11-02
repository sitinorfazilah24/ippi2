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
            
        <div class="form-check form-check-inline">
            <label class="form-check-label">
              <input class="form-check-input" name="check" type="checkbox" id="inlineCheckbox1" value="Bahasa Melayu"> Bahasa Melayu
            </label>
        </div>
        <div class="form-check form-check-inline">
            <label class="form-check-label">
              <input class="form-check-input" name="check" type="checkbox" id="inlineCheckbox2" value="Bahasa Inggeris"> Bahasa Inggeris
            </label>
        </div>
        <div class="form-check form-check-inline disabled">
            <label class="form-check-label">
              <input class="form-check-input" name="check" type="checkbox" id="inlineCheckbox3" value="Sejarah" disabled> Sejarah
            </label>
        </div>
            
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
        <th><b>Books Identification</b></th>
        </tr>
        
        
       <%@ include file="nexborrow-sub.jsp"%>

    <%@ include file="footer.jsp"%>
    </body>
</html>

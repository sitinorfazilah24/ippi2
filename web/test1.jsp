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
        <%@ include file="navbar.jsp"%>
        
        <div class="container-fluid margintop-60">
          <div class="row">
              <%@ include file="sidebar.jsp"%>
              
            <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
        
        <form method="post" action="http://localhost:8080/SPBTSystem/test1.jsp">
        <div class="container form-group">
        <h2 align="center"><font><strong>Borrow New Books</strong></font></h2>
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon1">Student Name</span>
            <input  id="name" type="text" name="name" class="form-control" placeholder="test" aria-describedby="basic-addon2" value="<%=request.getParameter("name")%>" required>
        </div>

            <div class=" input-group form-group">
            <span class="input-group-addon" id="basic-addon2">Student Identification</span>
            <input type="text" id="studid" name="studid" class="form-control" placeholder="test" aria-describedby="basic-addon1" value="<%=request.getParameter("studid")%>" required>
            
            <span class="input-group-addon" id="basic-addon4">Form</span>
            <input type="number" name="form" class="form-control" placeholder="test" aria-describedby="basic-addon4" value="<%=request.getParameter("form")%>" required>
            
            <span class="input-group-addon" id="basic-addon5">Stream</span>
            <input type="text" id="stream" name="stream" class="form-control" placeholder="test" aria-describedby="basic-addon5" value="<%=request.getParameter("stream")%>" required>
            </div>
        
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon3">RFID Book Card</span>
            <input type="text" name="rfid" class="form-control" placeholder="test" aria-describedby="basic-addon3" value="<%=request.getParameter("rfid")%>" required>
            <div class="group">
                <input id="adds" type="submit" class="button" value="SCAN">
            </div>
        </div>
        
            <div class="group">
                <input id="adds" type="submit" class="button" value="NEXT">
            </div>
        </div>
        </form>
                
               <%@ include file="l-borrow2.jsp"%>
               <%@ include file="l-borrow3.jsp"%>
                
                
                
        
        
            </main>
          </div>
        </div>
    </body>
</html>

<%-- 
    Document   : inputbooks
    Created on : Nov 20, 2017, 12:53:29 AM
    Author     : mohdr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <title>SPBT-i</title>
        <!--<link rel]="stylesheet" href="assets/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->
        <%@ include file="header.jsp"%>
        <%@ include file="footer.jsp"%>
    </head>
    <body>
        <%@ include file="navbar.jsp"%>
         <div class="container-fluid margintop-60">
          <div class="row">
              <%@ include file="sidebar.jsp"%>
            <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
        
        
        
        
        
            <div class="container-fluid">
                <h2 align="center"><font><strong>Books Available</strong></font></h2>
            
            <%@ include file="inputbooks2.jsp"%>
            </div>
            
       
        
        
                    <%@ include file="inputbooks4.jsp"%>
                    
       

    
    </body>
</html>

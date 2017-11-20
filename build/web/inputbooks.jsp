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
    </head>
    <body>
        <%@ include file="navbar.jsp"%>
         <div class="container-fluid margintop-60">
          <div class="row">
              <%@ include file="sidebar.jsp"%>
            <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
        
        
        
        
        <form method="post" action="http://localhost:8080/SPBTSystem/nexborrow-b.jsp">
            <div class="container">
            
            <%@ include file="inputbooks2.jsp"%>

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
                        <th><b>Form</b></th>
                        <th><b>Books Title</b></th>
                    </tr>
                    <%@ include file="nexborrow-sub.jsp"%>
                </table>
            </div>
       </div>
            </main>
          </div>
         </div>
       

    <%@ include file="footer.jsp"%>
    </body>
</html>

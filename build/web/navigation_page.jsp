<%-- 
    Document   : navigation_page
    Created on : May 23, 2017, 4:59:43 PM
    Author     : Ridhuan
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    

    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
    <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>SPBT-i</title>

   <%@ include file="header.jsp"%>
</head>


  <body>
    
        <%@ include file="navbar.jsp"%>
      <div class="container-fluid margintop-60">
          <div class="row">
              <%@ include file="sidebar.jsp"%>
            <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
                
                
                
            <div class="container-fluid row">
                <div class="col">
                  <div class="thumbnail text-center">
                    <a href="borrow.jsp">
                    <img  src="assets/img/student1.png" alt="books loan image" style="width:180px;height:180px;">
                    </a>
                    <div class="caption">
                      <h3 class="text-center">Students</h3>
                    </div>
                  </div>
                </div>
                <div class="col text-center">
                  <div class="thumbnail">
                    <a href="books.jsp">
                        <img  src="assets/img/books.png" alt="books image" style="width:180px;height:180px;">
                    </a>
                    <div class="caption">
                        <h3 class="text-center">Book</h3>
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="thumbnail text-center">
                    <a href="nexborrow.jsp">
                        <img src="assets/img/borrowing.png" alt="report image" style="width:270px;height:180px;">
                    </a>
                    <div class="caption">
                      <h3 class="text-center">Borrowing Books</h3>
                    </div>
                  </div>
                </div>
            </div>
            <div class="row container-fluid">
                <div class="col">
                  <div class="thumbnail text-center">
                    <a href="nexreturn.jsp">
                        <img  src="assets/img/Things-Book.png" alt="report image" style="width:180px;height:180px;">
                    </a>
                    <div class="caption">
                      <h3 class="text-center">Returning Books</h3>
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="thumbnail text-center">
                    <a href="addbooks.jsp">
                        <img  src="assets/img/addbook.png" alt="report image" style="width:180px;height:180px;">
                    </a>
                    <div class="caption">
                      <h3 class="text-center">Add Books</h3>
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="thumbnail text-center">
                    <a href="record.jsp">
                        <img  src="assets/img/report.png" alt="report image" style="width:180px;height:180px;">
                    </a>
                    <div class="caption">
                      <h3 class="text-center">Report</h3>
                    </div>
                  </div>
                </div>
                </div>
                
              </main>
                </div>
            </div>
          </div>
      
      <%@ include file="footer.jsp"%>
   </body>
   
</html>

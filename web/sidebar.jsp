<%-- 
    Document   : sidebar
    Created on : Nov 13, 2017, 5:28:06 AM
    Author     : mohdr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp"%>
        <%@ include file="footer.jsp"%>

        
       
    <nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar">
          <ul class="nav nav-pills flex-column">
            <li id="buttons" class="nav-item">
              <a class="nav-link" click="ready5" id="nav1" href="navigation_page.jsp">Home<span class="sr-only">(current)</span></a>
            </li>
            <li id="buttons" class="nav-item">
              <a class="nav-link" click="ready5" id="nav2" href="borrow.jsp">Students</a>
            </li>
            <li id="buttons" class="nav-item">
              <a class="nav-link" id="nav3" href="books.jsp">Books</a>
            </li>
            <li id="buttons" class="nav-item">
              <a class="nav-link" id="nav4" href="l-borrow.jsp">Borrow Books</a>
            </li>
            <li id="buttons" class="nav-item">
              <a class="nav-link" id="nav5" href="l-return.jsp">Return Books</a>
            </li>
          </ul>

          <ul id="buttons" class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link" id="nav6" href="addbooks.jsp">Add Books</a>
            </li>
            <li id="buttons" class="nav-item">
              <a class="nav-link" id="nav7" href="record.jsp">Report</a>
            </li>
          </ul>
        </nav>



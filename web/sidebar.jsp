<%-- 
    Document   : sidebar
    Created on : Nov 13, 2017, 5:28:06 AM
    Author     : mohdr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar">
          <ul class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link active" href="navigation_page.jsp">Home<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="borrow.jsp">Students</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="books.jsp">Books</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="nexborrow.jsp">Borrow Books</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="nexreturn.jsp">Return Books</a>
            </li>
          </ul>

          <ul class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link" href="addbooks.jsp">Add Books</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="record.jsp">Report</a>
            </li>
          </ul>
        </nav>

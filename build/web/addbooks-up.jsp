<%-- 
    Document   : addbooks-up
    Created on : Nov 11, 2017, 6:49:48 AM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SPBT-i</title>
        <!--<link rel="stylesheet" href="assets/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->
        <%@ include file="header.jsp"%>
        <%@ include file="footer.jsp"%>
    </head>
    <body>
        <%@ include file="navbar.jsp"%>
        <div class="container-fluid margintop-60">
<%
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");

            String up= request.getParameter("up");
            String queryText = null;
//            String up= (String)session.getAttribute("up");
//            session.setAttribute("up",up);
//            response.setHeader("location","http://localhost:8080/SPBTSystem/addbooks-up-sub.jsp");

                queryText = "SELECT DISTINCT bookid, forms, title, publisher, price, status FROM public.books WHERE title = '" + up + "'";
                
                try {
                       Statement stat = con.createStatement();
                       ResultSet rst = stat.executeQuery(queryText);
                       while(rst.next()){
                       %>
                       
                       <form method="post" action="http://localhost:8080/SPBTSystem/addbooks-up-sub.jsp?up=<%=up%>">
        <div class="container form-group margintop-60">
        <h2 align="center"><font><strong>Add new books</strong></font></h2>
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon2">Book Identification</span>
            <input type="text" name="bookid" class="form-control" placeholder="test" aria-describedby="basic-addon2" value="<%=rst.getString("bookid") %>" required>
        </div>
        
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon1">Book Title</span>
            <input type="text" name="title" class="form-control" placeholder="test" aria-describedby="basic-addon1" required value="<%=rst.getString("title") %>" required>
        </div>
        
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon4">Form</span>
            <input type="number" name="form" class="form-control" placeholder="test" aria-describedby="basic-addon3" required value="<%=rst.getString("forms") %>" required>
        </div>
            
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon5">Publisher</span>
            <input type="text" name="publisher" class="form-control" placeholder="test" aria-describedby="basic-addon3" required value="<%=rst.getString("publisher") %>" required>
        </div>
            
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon6">Price</span>
            <input type="text" name="price" class="form-control" placeholder="test" aria-describedby="basic-addon3" required value="<%=rst.getString("price") %>" required>
        </div>
        
            <div class="group">
                <input type="submit" class="button" value="Update">
            </div>
        
        
        
        </div>
        </form>
        <%
            }
                       
                       rst.close();
                       stat.close();
                       con.close();
                   } catch (Exception e) {e.printStackTrace(); }
        
//          out.print("ghello");
//        response.sendRedirect("addbooks.jsp");
        %>
        </div>
        
        
        
<!--      <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>-->
    
    </body>
</html>
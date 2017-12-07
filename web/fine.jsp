<%-- 
    Document   : fine
    Created on : Dec 3, 2017, 9:10:57 PM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String studid="sad";
%>


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
                <form method="post" action="http://localhost:8080/SPBTSystem/fine2.jsp?studid=<%=studid%>>
        <div class="container form-group">
            <h2 align="center"><font><strong>FINE!</strong></font></h2>
        <div class="panel panel-default">
            <table class="table" style="width:100%;text-align:left;border-collapse:collapse;background-color:Navy;color:white;">

                    <tr>
                        <th><b>Books ID</b></th>
                        <th><b>Form</b></th>
                        <th><b>Books Title</b></th>
                        <th><b>Publisher</b></th>
                        <th><b>Price</b></th>
                        <th><b>Reason</b></th>
                        <th><b>Action</b></th>
                    </tr>
                
        
         <%
             
        String driverName = "org.postgresql.Driver";
        String connectionUrl = "jdbc:postgresql://localhost:5432/";
        String dbName = "spbt-I";
        String userId = "postgres";
        String password = "12345";
            
            Statement statement = null;
            ResultSet resultSet = null;
   
        Connection con2 = DriverManager.getConnection(connectionUrl+dbName, userId, password);
    
        try {
        Class.forName(driverName);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }
    
    
boolean a=true;
        try{
        
        statement=con2.createStatement();
        String sql ="SELECT * FROM public2.booksborrow WHERE borrow_status='Not return' AND studid='"+studid+"'";

        resultSet = statement.executeQuery(sql);
        int i=0,x=0;
        while(resultSet.next()){
                a=false;
                try{ 
                    String queryText ="SELECT * FROM public.books WHERE id='"+resultSet.getString("bookid")+"'";
                    Statement statt = con2.createStatement();
                    ResultSet rstt = statt.executeQuery(queryText);
                    while(rstt.next()){
                %>
              
                    <tr>
                    
            
                    <td name="bookid"><%=rstt.getString("id")%></td>
                    <td><%=rstt.getString("forms") %></td>
                    <td><%=rstt.getString("title") %></td>
                    <td><%=rstt.getString("publisher")%></td>
                    <td><%=rstt.getString("price") %></td>
                    <td>
                        <select name="reason">
                            <option value="null">choose</option>
                            <option value="lost">lost</option>
                            <option value="broken">damaged</option>
                            <option value="late return">late return</option>
                        </select>
                    </td>
                    <td>
                    <input type="checkbox" name="paid" value="<%=rstt.getString("id")%>">PAID
                    </td>
                    </tr>
                <%
                    }
                     } catch (Exception e) {
                    e.printStackTrace();
                    }
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
if(a==true){

                %>
                <tr>
                    <td>there's no book unreturned</td>
                </tr>
                <%

}
        %>
            
        </table>
        
            <div class="group">
                <input id="adds" type="submit" class="button" value="Done">
            </div>
        </div>
                    </form>
        <%@ include file="fine3.jsp"%>
            </main>
        </div>
        
          </div>
       
        
       
        
       
        
        
 
    </body>
</html>
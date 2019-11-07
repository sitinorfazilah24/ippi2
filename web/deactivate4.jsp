<%-- 
    Document   : deactivate4
    Created on : Dec 1, 2017, 2:47:19 AM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container form-group">
    <h3 align="center"><font><strong>Card details to remove</strong></font></h3>
        <div class="panel panel-default">
            <table class="table">

                    <tr>
                        <th><b>Books identification</b></th>
                        <th><b>Form</b></th>
                        <th><b>Books Title</b></th>
                        <th><b>Publisher</b></th>
                        <th><b>Price</b></th>
                        <th><b>Status</b></th>
                        <th><b>ID</b></th>
                        <th><b>Action</b></th>
                    </tr>
                
        
         <%
             
        String driverName = "org.postgresql.Driver";
        String connectionUrl = "jdbc:postgresql://localhost:5432/";
        String dbName = "spbt-I";
        String userId = "postgres";
        String password = "12345";
        String title= request.getParameter("title");
        String bookid= request.getParameter("bookid");
            
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
        String sql ="SELECT * FROM public.books WHERE title='"+title+"' AND id='"+bookid+"'";

        resultSet = statement.executeQuery(sql);
        
        while(resultSet.next()){
            if(!resultSet.getString("status").equalsIgnoreCase("Active")){
                a=false;
                %>
                    <tr>
                    
            
                    <td><%=resultSet.getString("bookid")%></td>
                    <td><%=resultSet.getString("forms")%></td>
                    <td><%=resultSet.getString("title") %></td>
                    <td><%=resultSet.getString("publisher")%></td>
                    <td><%=resultSet.getString("price") %></td>
                    <td><%=resultSet.getString("status") %></td>
                    <td><%=resultSet.getString("id") %></td>
                    <td>
                        
                    <a class="btn btn-primary" href="http://localhost:8080/SPBTSystem/deactivate3.jsp?title=<%=resultSet.getString("title")%>&id=<%=bookid%>" role="button">Deactivate</a> 
                    </td>
                    
                <%
                    break;
                }
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        
        if(a==true){
            %>
                <script type="text/javascript">
                    window.alert("!!!your books ID already deactivate!!!")
                    window.location.href='deactivate.jsp';
                </script>
            <%

//        response.sendRedirect("deactivate.jsp");
                            
        }
        
        %>
        </tr>
            </table>
        </div>
        </div>
</main>
          </div>
        </div>
    </body>
</html>
<%-- 
    Document   : fine2
    Created on : Dec 3, 2017, 10:56:05 PM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        String driverName = "org.postgresql.Driver";
        String connectionUrl = "jdbc:postgresql://localhost:5432/";
        String dbName = "spbt-I";
        String userId = "postgres";
        String password = "12345";
        Statement statement = null;
        ResultSet resultSet = null;
        Connection con2 = DriverManager.getConnection(connectionUrl+dbName, userId, password);
        
        
        String studid=request.getParameter("studid");
String[] reason=request.getParameterValues("reason");
String[] paid=request.getParameterValues("paid");

        if(reason!=null&&paid!=null){

for(int i=0;i<reason.length;i++){

try{
        
        statement=con2.createStatement();
        String sql ="UPDATE public2.booksborrow SET borrow_status='Returned', return_date=current_date, fine_status='"+reason[i]+"' WHERE bookid='"+paid[i]+"';";

        resultSet = statement.executeQuery(sql);

        } catch (Exception e) {
        e.printStackTrace();
        }
}

        }
        else{
            %>
            <script type="text/javascript">
                    window.alert("select reason and action");
            </script>
<%
        }

response.sendRedirect("fine.jsp");
  

%>
<%-- 
    Document   : l-return2
    Created on : Nov 30, 2017, 1:47:22 AM
    Author     : mohdr
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
        String name= request.getParameter("name");
        String studid= request.getParameter("studid");
        String stream= request.getParameter("stream");
        String form= request.getParameter("form");
        String recordid= request.getParameter("recordid");
        String driverName1 = "org.postgresql.Driver";
        String connectionUrl = "jdbc:postgresql://localhost:5432/";
        String dbName = "spbt-I";
        String userId = "postgres";
        String password = "12345";
        session.setAttribute("form1",form);
        session.setAttribute("name",name);
        session.setAttribute("studid",studid);
        response.setHeader("location","http://localhost:8080/SPBTSystem/l-return3.jsp");

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SPBT-i</title>
<!--        <link rel="stylesheet" href="assets/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->
        <%--<%@ include file="header.jsp"%>--%>
        <%--<%@ include file="footer.jsp"%>--%>
    </head>
    <body>
        <%--<%@ include file="navbar.jsp"%>--%>
        
        <!--<div class="container-fluid margintop-60">-->
          <!--<div class="row">-->
              <%--<%@ include file="sidebar.jsp"%>--%>
              
            <!--<main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">-->
            <h5 id="nametab" value="<%=name%>"><font>Name: <%=name%></font></h5>
            <div class="container-fluid">
            <h5 align="center"><font><strong>Books Borrow</strong></font></h5>
            <div class="panel panel-default">
                <table class="table table-dark">
                    <thead>
                    <tr>
                        <th scope="col">Books List</th>
                        <th scope="col">Book Status</th>
                        <th scope="col">Borrow Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    
                    
        <%
//        String form2 = (String)session.getAttribute("form1");
//        String studid1 = "dumstudid";
    
        
        

        try {
        Class.forName(driverName1);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }

        Connection connection1 = null;
        Statement statement1 = null;
        ResultSet resultSet1 = null;
        %>
        
        <%
        try{ 
        connection1 = DriverManager.getConnection(connectionUrl+dbName, userId, password);
        statement1=connection1.createStatement();
        String sql ="SELECT * FROM public2.booksborrow WHERE studid='"+studid+"'";

        resultSet1 = statement1.executeQuery(sql);
        boolean a=true;
        while(resultSet1.next()){
            a=false;
            if(resultSet1.getString("borrow_status").equalsIgnoreCase("Not return")){
                %>
                <tr>
                <td><%=resultSet1.getString("title") %><button><a href="l-return3.jsp?title=<%=resultSet1.getString("title")%>&id=<%=resultSet1.getString("bookid")%>&name=<%=name%>&studid=<%=studid%>&stream=<%=stream%>&form=<%=form%>&recordid=<%=recordid%>">Scan</a></button></td>
                <td><%=resultSet1.getString("borrow_status") %></td>
                <td><%=resultSet1.getString("borrow_date") %></td>
                </tr>
                <%
            }else{
                %>
                <tr>
                <td><%=resultSet1.getString("title") %></td>
                <td><%=resultSet1.getString("borrow_status") %></td>
                <td><%=resultSet1.getString("borrow_date") %></td>

                </tr>
                <%  
                    }
            
        }
            if(a==true){
                %>
                    <tr>
                        <td>there's no book has been borrow yet</td>
                    </tr>
                <%
            }
        

        } catch (Exception e) {
        e.printStackTrace();
        }
        %>
        </tbody>
                </table>
            </div>
       </div>
 <!--</main>-->
          <!--</div>-->
        <!--</div>-->
 
    </body>
</html>
<script>
    $(document).ready(function(){
        $('#nametab').ready(function(){
            var input = $('#nametab').val();
            if(input == 'null'){
                $('#nametab').val('');
            }    
        });
    });
</script>
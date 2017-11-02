<%-- 
    Document   : updatestud
    Created on : Oct 31, 2017, 2:41:22 PM
    Author     : mohdr
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
        <%
    String name = request.getParameter("name1");    
    String id1 = request.getParameter("id1");
    String stream = request.getParameter("stream1");
    String form1 = request.getParameter("form1");
    String class1 = request.getParameter("class1");
    Class.forName("org.postgresql.Driver");
    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");
    
    //ResultSet rs;
    String queryText = "insert into public2.students values ('" + name + "','" + id1 + "','" + stream + "','" + form1 + "','" + class1 + "','" + form1 + "')";
//    int i = st.executeUpdate("insert into userobject values ('" + name + "','" + id1 + "','" + stream + "','" + form1 + "','" + class1 + "','" + form1 + "', current_date)");
    
     try {
//              Class.forName("com.mysql.jdbc.Driver").newInstance ();
//              con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","password");

            Statement stat = con.createStatement();

            ResultSet rst = stat.executeQuery(queryText);

            rst.close();
            stat.close();
            con.close();
        } catch (Exception e) { }

        response.sendRedirect("borrow.jsp");


%>
    </body>
</html>

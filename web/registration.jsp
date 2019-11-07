<%-- 
    Document   : registration
    Created on : May 1, 2017, 12:18:08 AM
    Author     : Fujitsu
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
    String user = request.getParameter("user");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String spbtid = request.getParameter("spbtid");
    String email = request.getParameter("email");
    Class.forName("org.postgresql.Driver");
    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");
    
    //ResultSet rs;
    PreparedStatement ps = con.prepareStatement("select * from registeredid where spbtid_temp=? and id_status='Active';");
                ps.setString(1, spbtid);
                ResultSet rs=ps.executeQuery();
                if(rs.next()){
                PreparedStatement ps1 = con.prepareStatement("select * from userobject where userobject.\"userID\"=? and status='Active';");
                ps1.setString(1, spbtid);
                ResultSet rs1=ps1.executeQuery();
                    if(rs1.next()){
                    out.println("Your SPBT's ID already exist in system with another user. Please contact your administrator");
                    }
                    else{    
                    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into userobject values ('" + user + "','" + pwd + "','" + fname + "','" + spbtid + "','" + email + "','Active', current_date)");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }}}
        else{
                    out.println("Your SPBT's ID does not exist in the system. Kindly contact your administrator.");
        %>
        <a href="index.jsp">Go to Home Page</a>
        <%}
%>
    </body>
</html>

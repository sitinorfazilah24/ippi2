<%-- 
    Document   : inputbooks3
    Created on : Nov 20, 2017, 9:42:17 PM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
        
        String form=request.getParameter("action");
       
        out.print(form);
        
%>
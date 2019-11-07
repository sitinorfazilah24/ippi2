<%-- 
    Document   : readtext
    Created on : Dec 3, 2017, 12:30:59 AM
    Author     : mohdr
--%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Read Text</title>
    </head>
    <body>
        <%
//            String jspPath = session.getServletContext().getRealPath("/Web Pages");
//            String name2= request.getParameter("name");
//            String studid2= request.getParameter("studid");
//            String form3= request.getParameter("form");
//            String stream2= request.getParameter("stream");
//            String rfid2= request.getParameter("rfid");

            String txtFilePath =  "C://Users/mohdr/Desktop/test2.txt";
            BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
            StringBuilder sb = new StringBuilder();
            String line=null;
            boolean a= true;
            while(a){
            long then=System.currentTimeMillis();
            line=reader.readLine();
            long now=System.currentTimeMillis();
            if(line!="null"){
                a=false;
                }
            }
            
            response.sendRedirect("l-borrow.jsp?rfid="+line);
//            while((line = reader.readLine())!= null){
//                long then = System.currentTimeMillis();
//                    line = reader.readLine();
//                    long now = System.currentTimeMillis();
//                sb.append(line+"\n");
//            }
//            out.println(line);
        %>
    </body>
</html>
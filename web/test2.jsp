<%-- 
    Document   : test2
    Created on : Nov 2, 2017, 7:47:38 AM
    Author     : mohdr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body method="post" action="http://localhost:8080/SPBTSystem/test1.jsp">
        <%
//            String form1=request.getParameter("sejarah");;
//            String bookid = request.getParameter("BI");
//            out.println(form1);
//            out.println(bookid);
        %>
        
        <%String fruits[]= request.getParameterValues("check");
        if(fruits != null){%>
        <h4>I likes fruit/s mostly</h4>
        <ul><%for(int i=0; i<fruits.length; i++){%>
            <li><%=fruits[i]%></li><%}%>
        </ul><%}%>
        
    </body>
    
</html>

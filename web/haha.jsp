<%-- 
    Document   : haha
    Created on : Dec 4, 2017, 11:12:53 PM
    Author     : mohdr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int i=0;
    
while(i<2000){
    %>
    =A<%=i+1%>&" "A<%=i+2%>&" "A<%=i+3%>&" "A<%=i+4%>&" "A<%=i+5%>&" "A<%=i+6%>&" "A<%=i+7%>&" "A<%=i+8%>&" "A<%=i+9%>&" "A<%=i+10%><br>
<%
    i+=10;
}

%>
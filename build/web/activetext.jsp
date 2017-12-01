<%-- 
    Document   : activetext
    Created on : Dec 1, 2017, 3:10:12 AM
    Author     : mohdr
--%>


<%@page import="java.io.FileWriter"%>
<%@page import="java.io.Writer"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
 //File creation
 String strPath = "C://Users/mohdr/Desktop/test.txt";
 File strFile = new File(strPath);
 boolean fileCreated = strFile.createNewFile();
 //File appending
 Writer objWriter = new BufferedWriter(new FileWriter(strFile));
 objWriter.write("1");
 objWriter.flush();
 objWriter.close();
%>  
        <script type="text/javascript">
            window.alert("SYSTEM READY TO SCAN!!!")
        </script>

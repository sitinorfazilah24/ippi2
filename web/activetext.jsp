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
 String bookid3= request.getParameter("id");
 String strPath = "C://Users/mohdr/Desktop/test.txt";
 String strPath2 = "C://Users/mohdr/Desktop/test2.txt";
 try{
 File strFile = new File(strPath);
 boolean fileCreated = strFile.createNewFile();
 //File appending
 Writer objWriter = new BufferedWriter(new FileWriter(strFile));
 objWriter.write("1");
 objWriter.flush();
 objWriter.close();
 } catch (Exception e) {e.printStackTrace(); }
 
 
try{
 File strFile = new File(strPath2);
 boolean fileCreated = strFile.createNewFile();
 //File appending
 Writer objWriter = new BufferedWriter(new FileWriter(strFile));
 objWriter.write(bookid3);
 objWriter.flush();
 objWriter.close();
 } catch (Exception e) {e.printStackTrace(); }
%>  
        <script type="text/javascript">
            window.alert("card scanning done!!!");
        </script>
        

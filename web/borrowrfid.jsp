<%-- 
    Document   : borrowrfid
    Created on : Dec 3, 2017, 2:18:57 PM
    Author     : mohdr
--%>

<%@page import="java.io.FileWriter"%>
<%@page import="java.io.Writer"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

            <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon3">RFID Book Card</span>
            <input type="text" name="rfid" id="form2" class="form-control" placeholder="Book ID" aria-describedby="basic-addon3" value="<%=request.getParameter("rfid")%>" >
            
            
            <div class="group">
                <input id="adds2" type="submit" class="button" value="SCAN">
            </div>
            </div>
<%
    
//        String name1= request.getParameter("name");
//        String studid1= request.getParameter("studid");
//        String form2= request.getParameter("form");
//        String stream1= request.getParameter("stream");
//        String rfid1= request.getParameter("rfid");
    
 //File creation
// String bookid3= request.getParameter("id");
 String strPath = "C://Users/mohdr/Desktop/test.txt";
// String strPath2 = "C://Users/mohdr/Desktop/test2.txt";
 try{
 File strFile = new File(strPath);
 boolean fileCreated = strFile.createNewFile();
 //File appending
 Writer objWriter = new BufferedWriter(new FileWriter(strFile));
 objWriter.write("0");
 objWriter.flush();
 objWriter.close();
 } catch (Exception e) {e.printStackTrace(); }
 
//try{
// File strFile = new File(strPath2);
// boolean fileCreated = strFile.createNewFile();
// //File appending
// Writer objWriter = new BufferedWriter(new FileWriter(strFile));
// objWriter.write(bookid3);
// objWriter.flush();
// objWriter.close();
// } catch (Exception e) {e.printStackTrace(); }

%>  
        <script type="text/javascript">
            window.alert("code activate!!")
        </script>
        <%@ include file="l-borrowsub.jsp"%>
        <%
            
            
//        response.sendRedirect("readtext.jsp?name="+name+"&studid="+studid+"&form="+form1+"&stream="+stream+"&rfid="+rfid);
        %>
        

<%-- 
    Document   : inputreturn
    Created on : Nov 21, 2017, 2:18:16 AM
    Author     : mohdr
--%>

<%@page import="java.io.FileWriter"%>
<%@page import="java.io.Writer"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <title>SPBT-i</title>
        <!--<link rel]="stylesheet" href="assets/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->
        <%@ include file="header.jsp"%>
        <%@ include file="footer.jsp"%>
    </head>
    <style>
        h6{
    border: 1px solid;
    background-color:#4091ff;
}
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 2px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #d1ecf1;
    
}
        </style>
    <body>
        <%@ include file="navbar.jsp"%>
         <div class="container-fluid margintop-60">
          <div class="row">
              <%@ include file="sidebar3.jsp"%>
            <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
        
        
        
        
        
            <div class="container-fluid">
                
            </div>
            
       
        
        <div class="container-fluid">
            <form action="inputreturn.jsp">
                <b>Enter Student ID</b><br>
                Student ID : <input type="text" name="studentid3" placeholder="eg:S170001" pattern="[A-Z]{1}[0-9]{6}" title="One capital letter,6 numbers">
                <input type="submit" name="button5" value="Search"><img src="assets/img/search.png" height="20px" width="20px">
            </form>
            <br>
             <%
 Class.forName("org.postgresql.Driver");
Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-1","postgres","P@ssw0rd");
String button5=request.getParameter("button5");
String studentid=request.getParameter("studentid3");
Statement statement1 = con.createStatement();
Statement statement2 = con.createStatement();
if(button5 != null && !studentid.equals("") && button5.equals("Search")  ){
ResultSet resultset1 = statement1.executeQuery("select * from \"Student\"  where \"StudentID\"='"+studentid+"'") ; 
ResultSet resultset2 = statement2.executeQuery("select * from \"books\",\"record\" where \"books\".\"bookid\"=\"record\".\"bookid\"  and \"studid\"='"+studentid+"'") ; 
while(resultset1.next()){
    %>
    <b>Student Name: </b><%=resultset1.getString(2)%> &ensp; &ensp; <br><b>Student ID: </b><%=resultset1.getString(1)%> <br>
    <b>Stream: </b><%=resultset1.getString(6)%> &ensp; &ensp; <br><b>Form: </b><%=resultset1.getString(8)%>  
    <center> <h6 ><img src="assets/img/download.png" height="50px" width="50px">Returning Book</h6></center>
    <form action="inputreturn.jsp">
        <b>Scan Book :</b>
            <input type="hidden" name="studentid3"  value="<%=resultset1.getString(1)%>">
                <input type="hidden" name="button5"  value="Search">
                <button type="submit" name="button6"  value="Scan" >SCAN <img src="assets/img/rfid.png" height="20px" width="20px"></button>
    </form>
    <%
    String button6=request.getParameter("button6");
    if(button6 != null && !studentid.equals("") && button6.equals("Scan")  ){
        
        String strPath = "C://Users/Fujitsu/Desktop/ButtonStatus.txt";
        String strPath2 = "C://Users/Fujitsu/Desktop/StudentID.txt";
         String line = null;
        try{
 File strFile = new File(strPath);
 boolean fileCreated = strFile.createNewFile();
 //File appending
 Writer objWriter = new BufferedWriter(new FileWriter(strFile));
 objWriter.write("2");
 objWriter.flush();
 objWriter.close();
 } catch (Exception e) {e.printStackTrace(); }
        
        try{
 File strFile = new File(strPath2);
 boolean fileCreated = strFile.createNewFile();
 //File appending
 Writer objWriter = new BufferedWriter(new FileWriter(strFile));
 objWriter.write(resultset1.getString(1));
 objWriter.flush();
 objWriter.close();
 } catch (Exception e) {e.printStackTrace(); }
        
 
 %>
    
    
   <% }
    %>
    
    
<%}
%>
<TABLE BORDER="1" align="center" cellpadding="5" cellspacing="5">
            <TR>
               <TH>Book Title</TH>
               <TH>Status</TH>
               <TH>Date of Borrowing</TH>
               <TH>Date of Returning</TH>
               
                
               
               
               
           </TR>
           <%while(resultset2.next()){

    %>
           <TR>
               
               <TD ><%= resultset2.getString(3) %> </TD>
               <TD><% if(resultset2.getString(11).equals("Borrowed")){
                   out.println("Not Returned");
               }else {
                   out.println(resultset2.getString(11));
               }
                    %> 
               </TD>
               <TD> <%= resultset2.getString(12) %> </TD>
               <TD><%= resultset2.getString(13) %></TD>
               
              
               
               
   
           </TR>
                         <%
   
}
%>

                       
       </TABLE>

<%}else{
    
}

    %>
       </div>
            </main>
          </div>
         </div>
       

    
    </body>
</html>

<%-- 
    Document   : readtext2
    Created on : Dec 6, 2017, 10:10:52 PM
    Author     : mohdr
--%>

<%@page import="java.io.Writer"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
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
            
            String strPath = "C://Users/mohdr/Desktop/test.txt";
            try{
            File strFile = new File(strPath);
            boolean fileCreated = strFile.createNewFile();
            //File appending
            Writer objWriter = new BufferedWriter(new FileWriter(strFile));
            objWriter.write("1");
            objWriter.flush();
            objWriter.close();
            } catch (Exception e) {e.printStackTrace(); }
            
            
            
            String title= request.getParameter("title");
            String id= request.getParameter("id");

//            String title= "title";
//            String id= "id";


            String txtFilePath =  "C://Users/mohdr/Desktop/scan status.txt";
            BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
            StringBuilder sb = new StringBuilder();
            String line=null;
            boolean a= true;
            while(a){
            long then=System.currentTimeMillis();
            line=reader.readLine();
            if(line!="null"){
                a=false;
                }
            }
            String status="";
            if(a==false){
                if(line.equalsIgnoreCase("1")){
                out.print("Successfull!!");
                status="success";
                }else{
                out.print("Failed!!");
                status="fail";
                }
            }
//            response.sendRedirect("newcard.jsp?title="+title+"&id="+id);
        %>
        <script type="text/javascript">
            var check="<%=status%>";
                window.alert(check); 
        </script>
        <%
        if(status.equalsIgnoreCase("success")){
            response.sendRedirect("newcard3.jsp?title="+title+"&id="+id+"&status="+status);
        }else{
            response.sendRedirect("newcard.jsp?title="+title+"&id="+id+"&status="+status);
        }
        %>
       
    </body>
</html>
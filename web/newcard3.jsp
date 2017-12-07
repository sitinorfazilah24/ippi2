<%-- 
    Document   : newcard3
    Created on : Nov 30, 2017, 7:26:22 PM
    Author     : mohdr
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file="activetext.jsp"%>
    
    <body>
       <%
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");

            String title= request.getParameter("title");
            String id= request.getParameter("id");
            String line=null;
            boolean a= true;
            
            String txtFilePath =  "C://Users/mohdr/Desktop/scan status.txt";
            BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
            StringBuilder sb = new StringBuilder();
            
          
            while(a){
            long then=System.currentTimeMillis();
            line=reader.readLine();
            if(line!=null){
                a=false;
                }
            }
            String des="";
            String status="";
            if(a==false){
                if(line.equalsIgnoreCase("1")){
                status="successfull";
                }else if(line.equalsIgnoreCase("0")){
                    des="Card already have bookid";
                status="failed";
                }else{
                    des="Card failed to load";
                    status="failed";
                }
            }
            
            String queryText = null;
                queryText = "UPDATE public.books SET  status='Unused' WHERE id='"+id+"' AND title='"+title+"'";
                if(status=="successfull"){
                 try{ 
                    Statement statt = con.createStatement();
                    ResultSet rstt = statt.executeQuery(queryText);
                    } catch (Exception e) {
                    e.printStackTrace();
                    }
                }
            
            try {
            PrintWriter writer = new PrintWriter(txtFilePath);
            writer.print("");
            writer.close();
            } catch (Exception e) {e.printStackTrace(); }
           
    
          
//        response.sendRedirect("newcard.jsp");
        %>
                        <script type="text/javascript">
                            window.alert("Adding <%=title%> book with ID=<%=id%> to card is <%=status%>!!! <%=des%>")
                            window.location.href='newcard.jsp';     
                        </script>
    </body>
</html>

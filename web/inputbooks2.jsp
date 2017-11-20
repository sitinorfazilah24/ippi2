<%-- 
    Document   : inputbooks2
    Created on : Nov 20, 2017, 8:39:56 AM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
        <%
        String form1="4";
        String studid = "dumstudid";
        session.setAttribute("form1",form1);
        session.setAttribute("studid",studid);
        response.setHeader("location","http://localhost:8080/SPBTSystem/nexborrow-sub.jsp");
        response.setHeader("location","http://localhost:8080/SPBTSystem/nexborrow-b.jsp");
        String driverName = "org.postgresql.Driver";
        Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");
        

        try {
        Class.forName(driverName);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }

        Statement statement = null;
        ResultSet resultSet = null;
        %>
        
        <%
        int z=0;
        try{ 
        
        statement=connection.createStatement();
        String sql ="SELECT * FROM public2.booksborrow WHERE studid = '" + studid + "'";

        resultSet = statement.executeQuery(sql);
        
        while(resultSet.next()){
           z++;
        }
        } catch (Exception e) {
        e.printStackTrace();
        }
         
        %>
        
        <%
        String[] title=new String[z];
        try{ 
        
        statement=connection.createStatement();
        String sql ="SELECT * FROM public2.booksborrow WHERE studid = '" + studid + "'";

        resultSet = statement.executeQuery(sql);
        int i=0;
        
        
        while(resultSet.next()){
           title[i]=resultSet.getString("title");
           i++;
        }
       
//        out.print(title.length);
//        for(int x=0;x<title.length;x++){
//            out.print(title[x]);
//        }

        } catch (Exception e) {
        e.printStackTrace();
        }
         
        %>
        
        <table class="table">

            <tr>
                <th><b>Form</b></th>
                <th><b>Books Title</b></th>
                <th><b>Borrow Checks</b></th>
            </tr>
            
        
        <%
        try{ 
        
        statement=connection.createStatement();
        String sql ="SELECT * FROM public.books WHERE forms = '" + form1 + "'";

        resultSet = statement.executeQuery(sql);
        int i=0;
        
        while(resultSet.next()){
            boolean a=true;
            for(int x=0;x<title.length;x++){
                if(title[x].equalsIgnoreCase(resultSet.getString("title"))){
                    a=false;
                    break;
                }
            }
            if(a==true){
                String title1=resultSet.getString("title");
                %>
                    
                    <tr>
            
                    <td><%=form1 %></td>
                    <td><%=title1%></td>
                    <td><button><a href="test1.jsp?title" value="<%=title1%>">insert</a></button></td>

                    </tr>
                <%
            }
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        
        %>
        </table>
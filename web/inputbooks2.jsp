<%-- 
    Document   : inputbooks2
    Created on : Nov 20, 2017, 8:39:56 AM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <div class="container-fluid">
                <h5 align="center"><font><strong>Books Available</strong></font></h5>
<div class="container">
        <%
        String form1="4";
        String studid = "dumstudid";
        session.setAttribute("form1",form1);
        session.setAttribute("studid",studid);
        response.setHeader("location","http://localhost:8080/SPBTSystem/inputbooks4.jsp");
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
        String sql ="SELECT * FROM public2.booksborrow WHERE studid = '" + studid + "' AND borrow_status= 'Not return'";

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
        String sql ="SELECT * FROM public2.booksborrow WHERE studid = '" + studid + "' AND borrow_status= 'Not return' ";

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
        
        <table class="table table-dark">
            <thead >

            <tr>
                <th scope="col">Form</th>
                <th scope="col">Books Title</th>
                <th scope="col">Books Left</th>
                <th scope="col">Price</th>
                <th scope="col">Publisher</th>
                <th scope="col">Borrow Checks</th>
            </tr>
            </thead>
            <tbody>
        <%
        try{ 
        
        statement=connection.createStatement();
        String sql ="SELECT DISTINCT title, price, publisher FROM public.books WHERE forms = '" + form1 + "' AND status='Active' ";

        resultSet = statement.executeQuery(sql);
        int i=0,x=0;
        boolean b=true;
        while(resultSet.next()){
            
           
            
            boolean a=true;
            for(int v=0;v<title.length;v++){
                if(title[v].equalsIgnoreCase(resultSet.getString("title"))){
                    a=false;
                    break;
                }
            }
            if(a==true){
                b=false;
                
                 try{ 
                    String queryText ="SELECT * FROM public.books WHERE title='"+resultSet.getString("title")+"' AND status='Active'";
                    Statement statt = connection.createStatement();
                    ResultSet rstt = statt.executeQuery(queryText);
                    
                    while(rstt.next()){
                        x=rstt.getRow();
                    }
                    
                    } catch (Exception e) {
                    e.printStackTrace();
                    }
                 
                    String id="";
                    
                    try {
                        String sql2 = "SELECT * FROM public.books WHERE title='"+resultSet.getString("title")+"' AND status='Active' LIMIT 1 ";
                        Statement stat3 = connection.createStatement();
                        ResultSet rst3 = stat3.executeQuery(sql2);
                        while(rst3.next()){
                            id=rst3.getString("id");
                        }
                    } catch (Exception e) {e.printStackTrace(); }

                %>
                    
                    <tr>
            
                    <td><%=form1 %></td>
                    <td><%=resultSet.getString("title")%></td>
                    <td><%=x%></td>
                    <td><%=resultSet.getString("price")%></td>
                    <td><%=resultSet.getString("publisher")%></td>
                    <td><button><a href="inputbooks3.jsp?title=<%=resultSet.getString("title")%>&id=<%=id%>">Borrow</a></button></td>

                    </tr>
                <%
            }
        }
        if(b==true){
            %>
            <tr>
                <td>there's no book available</td>
            </tr>
            <%

            }

        } catch (Exception e) {
        e.printStackTrace();
        }
        
        %>
        </tbody>
        </table>
</div>
 </div>
<%-- 
    Document   : l-borrowsub
    Created on : Dec 2, 2017, 4:53:20 AM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container-fluid">
                <h5 align="center"><font><strong>Books Available</strong></font></h5>
<div class="container">
        <%
//        String form1="4";
//        String studid = "dumstudid";
        String name= request.getParameter("name");
        String studid= request.getParameter("studid");
        String form1= request.getParameter("form");
        String stream= request.getParameter("stream");
        String rfid= request.getParameter("rfid");
        session.setAttribute("name",name);
        session.setAttribute("studid",studid);
        session.setAttribute("forml",form1);
        session.setAttribute("stream",stream);
        session.setAttribute("rfid",rfid);
        response.setHeader("location","http://localhost:8080/SPBTSystem/l-borrow3.jsp");
        response.setHeader("location","http://localhost:8080/SPBTSystem/l-borrow4.jsp");
        response.setHeader("location","http://localhost:8080/SPBTSystem/l-borrow2.jsp");
        response.setHeader("location","http://localhost:8080/SPBTSystem/l-borrow.jsp");
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
        <table class="table table-dark">
            <thead >

            <tr>
                <th scope="col">Form</th>
                <th scope="col">Books Title</th>
                <th scope="col">Price</th>
                <th scope="col">Publisher</th>
                <th scope="col">Borrow Checks</th>
            </tr>
            </thead>
            <tbody>
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
            
            
            boolean a1=true;
            boolean a2=true;
        try{ 
        statement=connection.createStatement();
        String sql ="SELECT * FROM public.books WHERE id='"+rfid+"' AND status='Activated'";

        resultSet = statement.executeQuery(sql);
        
        while(resultSet.next()){
            
                for(int v=0;v<title.length;v++){
                    if(title[v].equalsIgnoreCase(resultSet.getString("title"))){
                    a2=false;
                    a1=false;
                    %>
                        <tr>
                            <td>book has been borrowed</td>
                        </tr>
                    <%
                    break;
                    }
                }if(a2==true){
            
                a1=false;
            %>
            
            <tr>
            
                    <td><%=form1 %></td>
                    <td><%=resultSet.getString("title")%></td>
                    <td><%=resultSet.getString("price")%></td>
                    <td><%=resultSet.getString("publisher")%></td>
                    <td><button><a href="l-borrowsub2.jsp?title=<%=resultSet.getString("title")%>&id=<%=rfid%>&name=<%=name%>&studid=<%=studid%>&form=<%=form1%>&stream=<%=stream%>&rfid=<%=rfid%>">Borrow</a></button></td>

            </tr>
            <%
              }  
        }
        } catch (Exception e) {
        e.printStackTrace();
        }
        if(a1==true){
        %>
            <tr>
                <td>book ID selected from RFID is NOT activated</td>
            </tr>
        <%
            }
        %>
        
       
        </tbody>
        </table>
</div>
 </div>
        <%--<%@ include file="l-borrow3.jsp"%>--%>
        
            <!--</main>-->
          <!--</div>-->
        <!--</div>-->
    </body>
</html>
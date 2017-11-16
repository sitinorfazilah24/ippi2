<%-- 
    Document   : test1
    Created on : Nov 2, 2017, 7:47:17 AM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SPBT-i</title>
<!--        <link rel="stylesheet" href="assets/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->
        <%@ include file="header.jsp"%>
        <%@ include file="footer.jsp"%>
    </head>
    <body>
        <%@ include file="navbar.jsp"%>
        
        <div class="container-fluid margintop-60">
          <div class="row">
              <%@ include file="sidebar.jsp"%>
              
            <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
        
        <form method="post" action="http://localhost:8080/SPBTSystem/addbooks-sub.jsp">
        <div class="container form-group">
        <h2 align="center"><font><strong>Add new books</strong></font></h2>
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon1">Book Identification</span>
            <input onchange="checkid()" id="bookids" type="text" name="bookid" class="form-control" placeholder="test" aria-describedby="basic-addon2" required>
        </div>
        
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon2">Book Title</span>
            <input type="text" name="title" class="form-control" placeholder="test" aria-describedby="basic-addon1" required>
        </div>
        
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon4">Form</span>
            <input type="number" name="form" class="form-control" placeholder="test" aria-describedby="basic-addon3" required>
        </div>
            
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon5">Publisher</span>
            <input type="text" name="publisher" class="form-control" placeholder="test" aria-describedby="basic-addon3" required>
        </div>
            
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon6">Price</span>
            <input type="text" name="price" class="form-control" placeholder="test" aria-describedby="basic-addon3" required>
        </div>
        
            <div class="group">
                <input type="submit" class="button" value="scan">
            </div>
        
        </div>
        </form>
        <%@ include file="addbooks-sub2.jsp"%>
        
            </main>
          </div>
        </div>
        
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
        String sql ="SELECT bookid FROM public.books WHERE bookid = '" + studid + "'";

        resultSet = statement.executeQuery(sql);
        int i=0;
        int x=resultSet.getRow();
        
        
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
                %>
                    <div class="form-check form-check-inline">
                    <label class="form-check-label">
                        <input class="form-check-input" name="check" type="checkbox" id="inlineCheckbox1" value="<%=resultSet.getString("title") %>"> <%=resultSet.getString("title") %>
                    </label>
                    </div>
                <%
            }
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        
        %>

        
        
       <script>
    
   function checkid(){
  

$("tagsaya").remove();


  jQuery.ajax({
       url:'http://localhost:8080/SPBTSystem/addbook-check.jsp',
       async: true,
         type:'GET',
       data:{checkid:$('#checkid').val()},

         
  
  
</script>
        
        
        
<!--        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>-->
    
    </body>
</html>
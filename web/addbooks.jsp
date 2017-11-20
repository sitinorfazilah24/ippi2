<%-- 
    Document   : addbooks
    Created on : Oct 14, 2017, 4:42:45 AM
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
            <input  id="bookids" type="text" name="bookid" class="form-control" placeholder="test" aria-describedby="basic-addon2" required>
        </div>
        <span id="duplicate"></span>
        
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
                <input id="adds" type="submit" class="button" value="Add">
            </div>
        
        </div>
        </form>
        <%@ include file="addbooks-sub2.jsp"%>
        
            </main>
          </div>
        </div>
        
        <%
    Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");
    Statement stat = null;
    ResultSet rsts = null;
        Statement statement2 = null;
        ResultSet resultSet2 = null;
int i=0;
        try{ 
        
        stat=connection.createStatement();
        String sql ="SELECT bookid FROM public.books";

        rsts = stat.executeQuery(sql);
        while(rsts.next()){
        i=rsts.getRow();
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        
 String[] title2=new String [i];
try{ 
        int x=0;
        statement2=connection.createStatement();
        String sql2 ="SELECT bookid FROM public.books";
       

        resultSet2 = statement2.executeQuery(sql2);
        while(resultSet2.next()){
           title2[x]=resultSet2.getString("bookid");
           x++;
        }
        
        } catch (Exception e) {
        e.printStackTrace();
        }
         
         
        %>
        
        <script>
            var array1 = new Array();  
            <%  
            for (int z=0; z < title2.length; z++) {  
            %>  
            array1[<%=z%>] = "<%=title2[z]%>";   //Here is the latest update check it sravan .Put single quotes.
            <%}%> 
                
               $('#bookids').on('change',function(){
                   var nowvalue=this.value;
                    for(var i=0;i<array1.length;i++){
                        if(nowvalue==array1[i]){
                           document.getElementById("duplicate").innerHTML = "This ID is already used";
                           $('#adds').attr('disabled',true);
                           break;
                        }else
                            document.getElementById("duplicate").innerHTML = "";
                            $('#adds').attr('disabled',false);
                    }
               });
        </script> 
        
        
        
       
        
        
 
    </body>
</html>
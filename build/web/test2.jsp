<%-- 
    Document   : test2
    Created on : Nov 2, 2017, 7:47:38 AM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <%@ include file="header.jsp"%>
        <%@ include file="footer.jsp"%>
        
        <body>
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon4">Form</span>
            <input type="text" name="form" class="form-control" id="test" value="asda" placeholder="test" aria-describedby="basic-addon3" required>
            <p id="duplicate"></p>
        </div>
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon3">Form</span>
            <input type="text" name="form" class="form-control" id="test1" value="asda2" placeholder="test" aria-describedby="basic-addon3" required>
        </div>
        
        
    </body>
    
</html>



<%
    Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");
    Statement statement = null;
        ResultSet resultSet = null;
        Statement statement2 = null;
        ResultSet resultSet2 = null;
        String bookid="qweqwe";
//        String[] title=new String[z];
int i=0;
        try{ 
        
        statement=connection.createStatement();
        String sql ="SELECT bookid FROM public.books";

        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
        i=resultSet.getRow();
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        
 String[] title=new String [i];
try{ 
        int x=0;
        statement2=connection.createStatement();
        String sql2 ="SELECT bookid FROM public.books";
       

        resultSet2 = statement.executeQuery(sql2);
        while(resultSet2.next()){
           title[x]=resultSet2.getString("bookid");
           x++;
        }
        
        } catch (Exception e) {
        e.printStackTrace();
        }
         
         
        %>
        
        <script>
            var array1 = new Array();  
            <%  
            for (int z=0; z < title.length; z++) {  
            %>  
            array1[<%=z%>] = "<%=title[z]%>";   //Here is the latest update check it sravan .Put single quotes.
            <%}%> 
                
               $('#test').on('change',function(){
                   var nowvalue=this.value;
                   for(var i=0;i<array1.length;i++){
                        if(nowvalue===array1[i]){
                           $('#duplicate').html('hello');
                           document.getElementById("duplicate").innerHTML = "This ID is already used";
                           alert("hello");
                       }
                   }
               });
            
        </script>      
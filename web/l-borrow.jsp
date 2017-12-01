<%-- 
    Document   : l-borrow
    Created on : Nov 29, 2017, 5:31:50 AM
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
        
        <form method="post" action="http://localhost:8080/SPBTSystem/l-borrow.jsp">
        <div class="container form-group">
        <h2 align="center"><font><strong>Borrow New Books</strong></font></h2>
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon1">Student Name</span>
            <input  id="name" type="text" name="name" class="form-control" placeholder="Student Name" aria-describedby="basic-addon2" value="<%=request.getParameter("name")%>" required>
        </div>

            <div class=" input-group form-group">
            <span class="input-group-addon" id="basic-addon2">Student Identification</span>
            <input type="text" id="studid" name="studid" class="form-control" placeholder="Student Identification" aria-describedby="basic-addon1" value="<%=request.getParameter("studid")%>" required>
            
            <span class="input-group-addon" id="basic-addon4">Form</span>
            <input type="number" id="form" name="form" class="form-control" placeholder="Form" aria-describedby="basic-addon4" value="<%=request.getParameter("form")%>" required>
            
            <span class="input-group-addon" id="basic-addon5">Stream</span>
            <input type="text" id="stream" name="stream" class="form-control" placeholder="Stream" aria-describedby="basic-addon5" value="<%=request.getParameter("stream")%>" required>
            </div>
            <span id="check"></span>
        
        <div class="input-group form-group">
            <span class="input-group-addon" id="basic-addon3">RFID Book Card</span>
            <input type="text" name="rfid" id="form2" class="form-control" placeholder="Book ID" aria-describedby="basic-addon3" value="<%=request.getParameter("rfid")%>" required>
            <div class="group">
                <input id="adds2" type="submit" class="button" value="SCAN">
            </div>
        </div>
        
            <div class="group">
                <input id="adds" type="submit" class="button" value="NEXT">
            </div>
        </div>
        </form>
                
               <%@ include file="l-borrow2.jsp"%>
               <%@ include file="l-borrow3.jsp"%>
        
            </main>
          </div>
        </div>
    </body>
</html>
<script>
    $(document).ready(function(){
        $('form').ready(function(){
            var input = $('input:text').val();
            if(input == 'null'){
                $('input:text').val('');
            }    
        });
    });
</script>
<%
//    Connection connection2 = DriverManager.getConnection("jdbc:postgresql://localhost:5432/spbt-I","postgres","12345");
    Statement stat = null;
    ResultSet rsts = null;
        Statement statement2 = null;
        ResultSet resultSet2 = null;
int i=0;
        try{ 
        
        stat=connection.createStatement();
        String sql ="SELECT DISTINCT studid FROM public2.booksborrow";

        rsts = stat.executeQuery(sql);
        while(rsts.next()){
        i=rsts.getRow();
        }

        } catch (Exception e) {
        e.printStackTrace();
        }
        out.print(i+"asbdyavsdja");
        
 String[] title2=new String [i];
try{ 
        int x=0;
        statement2=connection.createStatement();
        String sql2 ="SELECT DISTINCT studid FROM public2.booksborrow";
       

        resultSet2 = statement2.executeQuery(sql2);
        while(resultSet2.next()){
           title2[x]=resultSet2.getString("studid");
           x++;
        }
        
        } catch (Exception e) {
        e.printStackTrace();
        }
         
         
        %>
        
        <script>
            var array1 = new Array();  
            <%  
            for (int j=0; j < title2.length; j++) {  
            %>  
            array1[<%=j%>] = "<%=title2[j]%>";   //Here is the latest update check it sravan .Put single quotes.
            <%}%> 
                
               $('#studid').on('change',function(){
                   var nowvalue=this.value;
                   var test=true;
                    for(var i=0;i<array1.length;i++){
                        if(nowvalue==array1[i]){
                           document.getElementById("check").innerHTML = "";
                           $('#adds').attr('disabled',false);
                           test=false;
                           break;
                        }
                    }
                    if(test==true){
                        document.getElementById("check").innerHTML = "This ID is not registered";
                        $('#adds').attr('disabled',true);
                    }
               });
        </script> 
<%-- 
    Document   : schedule
    Created on : Dec 5, 2017, 9:09:49 PM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SPBT-i</title>
         <%@ include file="header.jsp"%>
        <%@ include file="footer.jsp"%>
    </head>
    <body>
        <%@ include file="navbar.jsp"%>
        
        <div class="container-fluid margintop-60" >
          <div class="row">
              <%@ include file="sidebar.jsp"%>
              
            <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
                <div class="container-viewport form-group form-inline mt-2 mt-md-0">
                    <h4 class="header">Submit Books Schedules</h4>
                    <ul class="navbar-nav mr-auto">

                    </ul>
                    <a class="btn btn-primary" href="addclass.jsp" role="button">Add Class Name</a>
                    <ul></ul>
                    <a class="btn btn-primary" href="schedule3.jsp" role="button">Date Return Schedule Table</a>
                </div>
        <form class=" container form-group form-inline" method="post" action="http://localhost:8080/SPBTSystem/schedule.jsp">
            <div class="form-group mb-2 mr-sm-2 mb-sm-0">
                <label for="classes">Class</label>
                <input type="number" id="clas" min="0" max="15" name="clas" class="form-control mx-sm-3" aria-describedby="classes1" value="<%=request.getParameter("clas")%>" required>
                <small id="classessdescription" class="text-muted mr-sm-2">
                    The number of class involve.
                </small>
                <select type="number" name="form" class="form-control" title="please pick your form" aria-describedby="basic-addon4" value="<%=request.getParameter("form")%>" required>
                <option value="" selected disable>form</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                </select>
            </div>
                
            <label class="custom-control custom-checkbox mb-2 mr-sm-2 mb-sm-0">
                <input type="checkbox" class="custom-control-input" id="checkall" name="checkall" value="all" >
                <span class="custom-control-indicator"></span>
                <small id="classessdescription2" class="text-muted mr-sm-2">
                    Set return date class by class
                </small>
            </label>
            <div class="form-group"   >
                <label for="dates">Date</label>
                <input type="date" id="datesall" name="datesall"  class="form-control mx-sm-3" aria-describedby="date1" required value="<%=request.getParameter("datesall")%>" disabled>
            </div>
            
            
            <button type="submit" class="form-group btn btn-primary">Next</button>    
        </form>
            
            <div class="alert alert-success" style="display: hidden;" id="runcheck" role="alert">
            <p class="mb-0" id="runcheck2" style="display: hidden;" value="<%=request.getParameter("des")%>"><%=request.getParameter("des")%></p>
            </div>
        
                
                
                
                <%
                    
                    String driverName = "org.postgresql.Driver";
                    String connectionUrl = "jdbc:postgresql://localhost:5432/";
                    String dbName = "spbt-I";
                    String userId = "postgres";
                    String password = "12345";
            
            Statement statement = null;
            ResultSet resultSet = null;
            Connection con2 = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    
                if(request.getParameter("clas")!=null){
                
                
                
                %>            
        <div class="alert alert-success" role="alert">
            <h4 class="alert-heading">Form <%=request.getParameter("form")%></h4>
            <hr>
            <p class="mb-0">Whenever you need to, be sure to use margin utilities to keep things nice and tidy.</p>
        </div>
        
        <form class=" container form-group" method="post" action="http://localhost:8080/SPBTSystem/schedule2.jsp">
            <input type="hidden" name="form" value="<%=request.getParameter("form")%>" class="form-control mx-sm-3">
            <input type="hidden" name="clas" value="<%=request.getParameter("clas")%>" class="form-control mx-sm-3">
        <%
        
        int total=Integer.parseInt(request.getParameter("clas"));
        
        try{ 
                                String queryText ="SELECT * FROM public.class WHERE form='"+request.getParameter("form")+"'";

                                Statement statt = con2.createStatement();
                                ResultSet rstt = statt.executeQuery(queryText);

            for(int i=0;i<total;i++){
        %>
        
        
                
        <div class="container form-inline form-group row">
            <div class="form-group mb-2 mr-sm-2 mb-sm-0">
                <label for="classes">Classroom Name</label>
                <select type="text" name="clas<%=i%>" id="classus" class="form-control mx-sm-3" title="Select Class Name" aria-describedby="basic-addon4" required>
                <option value="" selected disable>choose</option>
                <%
                while(rstt.next()){
                                    %>
                <option value="<%=rstt.getString("class")%>"><%=rstt.getString("class")%></option>
                <%
                                }
                
                
                %>
                </select>
            </div>
            <div class="form-group">
                <label for="dates">Date</label>
                <input type="date" id="dates<%=i%>" name="dates<%=i%>" value="<%=request.getParameter("datesall")%>" class="form-control mx-sm-3" aria-describedby="date1">
                <small id="classessdescription" class="text-muted">
                    Date to submit the text books.
                </small>
            </div>
        </div>
        <%
                }
                } catch (Exception e) {
                                e.printStackTrace();
                                }
%>
        <input class="btn btn-primary" id="submit" type="submit" value="Submit">
        </form>
            
            <%

            }
        %>
        
        
        
        
         </main>
          </div>
        </div>
        
    </body>
</html>
<script>
        $('#checkall').click(function() {
            if(document.getElementById('checkall').checked) {
                document.getElementById("classessdescription2").innerHTML = "Set return date class by class";
                $("#datesall").prop('disabled', false);
            } else {
                document.getElementById("classessdescription2").innerHTML = "Set return date for all classes";
                $("#datesall").prop('disabled', true);
            }
        });
</script>

<script>
    $(document).ready(function(){
        $('#runcheck').ready(function(){
            var input = <%=request.getParameter("des")%>;
            if(input != null){
               $("#runcheck").show();
            }
            else{
                $("#runcheck").hide();
            }
        });
    });
</script>

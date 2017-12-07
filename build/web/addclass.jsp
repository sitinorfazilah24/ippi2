<%-- 
    Document   : addclass
    Created on : Dec 8, 2017, 4:18:02 AM
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
                    <h4 class="header">Add Class</h4>
                    <ul class="navbar-nav mr-auto">

                    </ul>
                </div>
        <form class=" container form-group form-inline" method="post" action="http://localhost:8080/SPBTSystem/addclass2.jsp">
            <div class="form-group mb-2 mr-sm-2 mb-sm-0">
                <label for="classes">Class</label>
                <input type="text" id="clas" name="clas" class="form-control mx-sm-3" aria-describedby="classes1" value="<%=request.getParameter("clas")%>" required>
                <small id="classessdescription" class="text-muted mr-sm-2">
                    class name.
                </small>
                <span class="form-group custom-control">Form</span>
                <label class="custom-control custom-checkbox">
                    <input type="checkbox" name="form" value="1" class="custom-control-input">
                    <span class="custom-control-indicator"></span>
                    <span class="custom-control-description">1</span>
                </label>
                <label class="custom-control custom-checkbox">
                    <input type="checkbox" name="form" value="2" class="custom-control-input">
                    <span class="custom-control-indicator"></span>
                    <span class="custom-control-description">2</span>
                </label>
                <label class="custom-control custom-checkbox">
                    <input type="checkbox" name="form" value="3" class="custom-control-input">
                    <span class="custom-control-indicator"></span>
                    <span class="custom-control-description">3</span>
                </label>
                <label class="custom-control custom-checkbox">
                    <input type="checkbox" name="form" value="4" class="custom-control-input">
                    <span class="custom-control-indicator"></span>
                    <span class="custom-control-description">4</span>
                </label>
                <label class="custom-control custom-checkbox">
                    <input type="checkbox" name="form" value="5" class="custom-control-input">
                    <span class="custom-control-indicator"></span>
                    <span class="custom-control-description">5</span>
                </label>
                <label class="custom-control custom-checkbox">
                    <input type="checkbox" name="form" value="6" class="custom-control-input">
                    <span class="custom-control-indicator"></span>
                    <span class="custom-control-description">6</span>
                </label>
            </div>
            
            
            <button type="submit" class="form-group btn btn-primary">Next</button>    
        </form>

                
                  
        <div class="alert alert-success" style="display: hidden;" id="runcheck" role="alert">
            <h4 class="alert-heading">Submited</h4>
            <hr>
            <p class="mb-0" d="runcheck2" style="display: hidden;" value="<%=request.getParameter("des")%>"><%=request.getParameter("des")%></p>
        </div>
        <h4 class="text-center">Class Name</h4>
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Class</th>
                        <th scope="col">Form</th>
                        <th scope="col">Remove name</th>
                      </tr>
                    </thead>
                    <tbody>
        
        <%
        String driverName = "org.postgresql.Driver";
        String connectionUrl = "jdbc:postgresql://localhost:5432/";
        String dbName = "spbt-I";
        String userId = "postgres";
        String password = "12345";
            
            Statement statement = null;
            ResultSet resultSet = null;
            Connection con2 = DriverManager.getConnection(connectionUrl+dbName, userId, password);
            
        String clas=request.getParameter("clas");
        String[] form=request.getParameterValues("form");
        
        boolean a=true, check=true;

                                    String queryText ="SELECT * FROM public.class ORDER BY class ASC";
                            try{ 

                                Statement statt = con2.createStatement();
                                ResultSet rstt = statt.executeQuery(queryText);
                                int i=1;
                                while(rstt.next()){
                                    check=false;
                                    %>
                                    <tr>
                                        <th scope="row"><%=i%></th>
                                        <td><%=rstt.getString("class")%></td>
                                        <td><%=rstt.getString("form")%></td>
                                        <td>
                                        <a class="btn btn-primary" href="http://localhost:8080/SPBTSystem/addclass3.jsp?class=<%=rstt.getString("class")%>&form=<%=rstt.getString("form")%>&action=delete" role="button">Remove</a>
                                        </td>
                                    </tr>
                                    <%
                                    i++;
                                }

                                } catch (Exception e) {
                                e.printStackTrace();
                                }
                            if(check==true){
                            %>
                                   <tr>
                                    <th scope="row">1</th>
                                    <td colspan="2">There's no class name inserted yet.</td>
                                    </tr> 
                                    <%
                            }
        
        
        %>
                    </tbody>
                </table>
        
        
        
         </main>
          </div>
        </div>
        
    </body>
</html>
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
<script>
    $(document).ready(function(){
        $('#clas').ready(function(){
            var input = $('input:text').val();
            if(input == 'null'){
                $('input:text').val('');
            }    
        });
    });
</script>

<%-- 
    Document   : schedule3
    Created on : Dec 8, 2017, 1:17:31 AM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
String driverName = "org.postgresql.Driver";
        String connectionUrl = "jdbc:postgresql://localhost:5432/";
        String dbName = "spbt-I";
        String userId = "postgres";
        String password = "12345";
            
            Statement statement = null;
            ResultSet resultSet = null;
            Connection con2 = DriverManager.getConnection(connectionUrl+dbName, userId, password);


%>
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
                  <h4 class="text-center">Return Date Schedule</h4>
                  <table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Class</th>
      <th scope="col">Return Date</th>
      <th scope="col">Form</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
    
                  
                  <%
                  String queryText ="SELECT * FROM public.schedule";
                            try{ 

                                Statement statt = con2.createStatement();
                                ResultSet rstt = statt.executeQuery(queryText);
                                int i=1;
                                while(rstt.next()){
                                    %>
                  
                  <tr>
                    <th scope="row"><%=i%></th>
                    <td><%=rstt.getString("classess")%></td>
                    <td><%=rstt.getString("date")%></td>
                    <td><%=rstt.getString("form")%></td>
                    <td>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Reschedule</button>
                        <a class="btn btn-primary" href="http://localhost:8080/SPBTSystem/schedule4.jsp?classess=<%=rstt.getString("classess")%>&form=<%=rstt.getString("form")%>&action=delete" role="button">Delete</a>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Change Date</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <div class="modal-body">

                                  <form class="form-horizontal" role="form" method="post" action="http://localhost:8080/SPBTSystem/schedule4.jsp">
                                          <div class="alert alert-warning" name='warning' role="alert">
                                            Currently editing class <%=rstt.getString("classess")%>  
                                          </div>
                                          <div class="form-group">
                                            <label class="col-sm-2 control-label"
                                                  for="inputdate" >Date</label>
                                            <div class="col-sm-10">
                                                <input type="date" class="form-control" value="<%=rstt.getString("date")%>" name="inputdate" id="inputdate" />
                                            </div>
                                          </div>
                                            <input type="hidden" class="form-control" value="<%=rstt.getString("form")%>" name="form" id="form" />
                                            <input type="hidden" class="form-control" value="<%=rstt.getString("classess")%>" name="classfirst" id="classfirst" />
                                          <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                              <button type="submit" name="action" value="updatedate" class="btn btn-default">Save changes</button>
                                            </div>
                                          </div>
                                        </form>

                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                              </div>
                            </div>
                          </div>
                        </div>
                    
                    
                    </td>
                  </tr>
                  
                  <%
                                   i++; 
                                }

                                } catch (Exception e) {
                                e.printStackTrace();
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
        $('#warning').ready(function(){
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
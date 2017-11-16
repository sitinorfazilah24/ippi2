<%-- 
    Document   : addbooks
    Created on : Oct 14, 2017, 4:42:45 AM
    Author     : mohdr
--%>

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
                <input type="submit" class="button" value="Add">
            </div>
        
        </div>
        </form>
        <%@ include file="addbooks-sub2.jsp"%>
        
            </main>
          </div>
        </div>
        
        
        
        
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
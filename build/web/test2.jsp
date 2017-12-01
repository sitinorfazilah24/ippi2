<%-- 
    Document   : inputbooks3
    Created on : Nov 20, 2017, 9:42:17 PM
    Author     : mohdr
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page
    import="java.io.*,java.lang.*,java.util.*,java.net.*,java.util.*,java.text.*"%>
<%@ page import="javax.activation.*,javax.mail.*,org.apache.commons.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<%!
    public String sendMail(String to, String sub, String msg) {
        String res = null;
        System.out.println("HI");       
        return res;
    }%>

<html>
<head>
<title>Send Email using JSP</title>
</head>
<body>
    <center>
        <h1>Send Email using JSP</h1>
    </center>
    <form>  
        <label>Email To</label><br />       
            <input type="text" name="to" /><br /> 
        <label>Subject</label><br />        
            <input type="text" name="sub" /><br /> 
        <label for="body">Message</label><br />
            <input type="text" name="msg" /><br /> 
        <input type="submit" onClick="sendMail( to, sub, msg )"/>
    </form>
</body>
</html>

<script type="text/javascript">
        $(document).ready(function() {
            $('#sendMailBtn').click(function (){
                $.ajax({
                    type: "post",
                    url: "/path", 
                    data: "email=" + $('#email').val() + "&subject="+$('#subject').val() + "&msg=" + $('#msg').val(),
                    success: function(msg){      
                        //
                    }
                });
            });
        });
 </script>
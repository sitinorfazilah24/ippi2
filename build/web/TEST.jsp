<%-- 
    Document   : TEST
    Created on : May 24, 2017, 8:29:00 PM
    Author     : Fujitsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            form {
    border: 3px solid #f1f1f1;
}
form{
    width: 40%;
}

h1{
    margin-bottom: 50px;
}
/* Full-width inputs */
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0px;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 50%;
}

/* Add a hover effect for buttons */
button:hover {
    opacity: 0.8;
}

/* Extra style for the cancel button (red) */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

/* Center the avatar image inside this container */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}



/* Add padding to containers */
.container {
    padding: 30px;
    padding-left: 30px;
    width: 80%;
}

/* The "Forgot password" text */
span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
        display: block;
        float: none;
    }
    .cancelbtn {
        width: 100%;
    }
}
        </style>
    </head>
    <body>
        <h1><center>SISTEM SKIM PINJAMAN BUKU TEKS SMTKL</center></h1>
        <form action="/authentication.jsp">

  <div class="container">
    <label><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="uname" required>
    <br/>
    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>
    <br/>
    <input type="checkbox" checked="checked"> Remember me
    <br/>
    <button type="submit">Login</button>
    <label><a href="">Forgot password?</a></label>
    
  </div>

  
</form>
    </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>

<!doctype html>
<html>
    <head>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
        <link href="css/style.css" rel="stylesheet" >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="trylogin">
            <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" placeholder="Enter email">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password">
            </div>
            <%
                if(request.getAttribute("failed") == "true") {
               %>
               <p>Your credentials were invalid</p>
               <%
                   }
%>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </body>
</html>
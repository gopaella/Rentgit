<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ page import ="com.rentatree.model.Product" %>
<%@ page import ="java.util.ArrayList" %>

<!doctype html>
<html>
    <head>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
        <link href="css/style.css" rel="stylesheet" >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF8">
        <title>Your Shopping Cart</title>
    </head>
    <body>

        <%@include file="WEB-INF/jsp/navbar.jsp" %>

        <div class='row-eq-height'>
            <div class="col-md-10">
                <h3>Your Shopping Cart:</h3>
                <hr>
                <div class="list-group">

                    <%
                        ArrayList<Product> myBasket = (ArrayList) session.getAttribute("basket");
                        if (myBasket.size() > 0 && myBasket != null) {
                            for (Product p : myBasket) {
                    %>
                    <li class="list-group-item text-left">
                        <h4><%= p.getName()%></h4>
                        <p>Species: <%= p.getDescription()%></p>
                        <p> Height: <%= p.getSupplier()%>cm Price: £<%= p.getPricePerDay()%> </p>
                    </li>

                    <%
                        } %>
                                        <button type="button" class="btn btn-success">Checkout</button>
                        <%
                    } else {
                    %>
                    <p> You don't currently have any items in your basket. </p>
                    <p> View the product range <a href="Products">here</a>. </p>
                    <%
                        }
                    %>

                </div>

            </div>

            <div class="col-sm-2 sidenav">
                <h5>Some Products We'd Like To Recommend:</h5>
                <div class="well">
                    <p>Recommended Product</p>
                </div>
                <div class="well">
                    <p>Recommended Product</p>
                </div>
                <div class="well">
                    <p>Recommended Product</p>
                </div>
            </div>
        </div>



    </body>
</html>
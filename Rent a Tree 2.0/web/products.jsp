<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ page import ="com.rentatree.model.Product" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="com.rentatree.util.ProductHandler" %> 
<%@ page import ="com.rentatree.service.*" %>

<!doctype html>
<html>
    <head>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
        <link href="css/style.css" rel="stylesheet" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF8">
        <title>Products</title>
    </head>
    <body>

        <%@include file="WEB-INF/jsp/navbar.jsp" %>

        <div class="container-fluid text-center">

            <div class="row-eq-height">
                <div class="col-sm-2 sidenav">
                    <h4>Narrow Your Search:</h4>
                    <div class="text-center">
                        <p>Size setting</p>

                        <form action="ProductSearchResult">
                            <div class="form-group">
                                <label for="minSize">Minimum Tree Size</label>
                                <input type="text" class="form-control" name="minSize" id="minSize" placeholder="50cm">

                                <label for="maxSize">Maximum Tree Size</label>
                                <input type="text" class="form-control" name="maxSize" id="maxSize" placeholder="200cm">
                            </div>


                            <hr>
                            <p>Materials</p>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="natural" id="natural">
                                <label class="form-check-label" for="natural">Natural</label>
                                
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="pvc" id="pvc">
                                <label class="form-check-label" for="pvc">PVC</label>
                                
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="pe" id="pe">
                                <label class="form-check-label" for="pe">PE</label>
                            </div>


                            <hr>
                            <p>Supplier setting</p>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="treenco" id="treenco">
                                <label class="form-check-label" for="treenco">Tree and Co.</label>
                                
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="greenco" id="greenco">
                                <label class="form-check-label" for="greenco">Green Company</label>
                                
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="fixtree" id="fixtree">
                                <label class="form-check-label" for="fixtree">Fix Tree</label>
                                
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="christmasco" id="christmasco">
                                <label class="form-check-label" for="christmasco">Christmas Co</label>
                            </div>
                            <hr>

                            <button type="button-center" class="btn btn-success">Search</button>
                        </form>
                        <hr>
                    </div>
                </div>
                <div class="col-sm-8 text-center">
                    <h1>Products</h1>
                    <p>Browse our large range of eco-friendly and ethically sourced trees for all your tree related needs</p>
                    <hr>
                    <div class="list-group">
                        <%                // List of Products
                            ArrayList<Product> products = (ArrayList) request.getAttribute("products");
                            if (products.size() > 0 && products != null) {
                                for (Product p : products) {
                        %>
                        <li class="list-group-item text-left">
                            <h4><%= p.getName()%></h4>
                            <p>Species: <%= p.getDescription()%></p>
                            <p> Height: <%= p.getSupplier()%>cm Price: £<%= p.getPricePerDay()%> </p>
                            <form action="AddToBasket">
                            <div class="form-group">
                                
                                <div class="row">
                                    <div class="col-sm-6" id="startDate">
                                <label for="startDate">When do you need the tree?</label>
                                <input type="text" class="form-control" name="startDate" id="startDate" placeholder="DD/MM/YYYY">
                                    </div>
                                    <div class="col-sm-6" id="noDays">
                                <label for="noDays">How many days?</label>
                                <input type="text" class="form-control" name="noDays" id="noDays" placeholder="7">
                                    </div>
                                </div>
                                <br></br>
                                <button type="button-center" class="btn btn-success">Add To Basket</button>
                            </form>
                        </li>
                        
                        <br></br>

                        <%
                            }
                        } else {
                        %>
                        <p> Unfortunately none of our products meet your search criteria - please try again. </p>
                        <%
                            }
                        %>
                    </div>
                    <hr>
                </div>
                <div class="col-sm-2 sidenav">
                <% ArrayList<Product> recProducts = ProductHandler.getProducts();
                    for (int i = 4; i < 7; i++) {%>
                
                    <div class="well">
                        <p>Recommended Product</p>
                        <h4><%= recProducts.get(i).getName()%></h4>
                        <p>£<%= recProducts.get(i).getPricePerDay()%> </p>
                        <p><%= recProducts.get(i).getDescription()%> </p>

                    </div>
                
                <%}%>
                </div>

                <div class="clear"></div>
            </div>

        </div>

            <script src="https://code.jquery.com/jquery-1.12.4.min.js" type ="text/javascript"> </script >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" >
< /script >
        </body>
        </html>
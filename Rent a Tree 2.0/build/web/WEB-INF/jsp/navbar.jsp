<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" href="index.jsp"><span class="glyphicon glyphicon-tree-conifer"></span> Rent A Tree</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp">Home</a></li>
                <li><a href="Products">Products</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="basket.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>  My Basket</a></li>

                <%
                    String curUser = (String)session.getAttribute("user");
                    if (curUser != "" && curUser != null) {

                %>
                
                <li class="disabled"><a>Signed in as <%=curUser%></a></li>
                <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span>  Sign Out</a></li>
                
                <%              } else {
                %>
                <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>  Sign In</a></li>
                    <%
                        }
                    %>

            </ul>
        </div>
    </div>
</nav>

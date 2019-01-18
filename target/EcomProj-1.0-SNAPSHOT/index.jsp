    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="com.mycompany.ecomproj.impl.ProductDAOImpl"%>
    <%@page import="com.mycompany.ecomproj.dao.ProductDAO"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>

    <%
            ProductDAO pdao = new ProductDAOImpl();

            request.setAttribute("productMap", pdao.getProductsByCategory());
   
    %>

    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>

    <c:import url="/header.jsp"/>
   
    
    </head>
    <body style="background-color: darkgray;">
    <!-- Carousel ------------>    
    <div class="container">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner">
    <div class="carousel-item active">
    <img class="d-block w-100" style="height: 300px;" src="images/W.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
    <img class="d-block w-100" style="height: 300px;" src="images/G.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
    <img class="d-block w-100" style="height: 300px;" src="images/15.png" alt="Third slide">
    </div>
        <div class="carousel-item">
    <img class="d-block w-100" style="height: 300px;" src="images/14.jpg" alt="Fourth slide">
    </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
    </a>
    </div>
    <br>
    <hr>
    </div>
    <br>
    <br>

    <!---        left and right bar ---->

    <div class="container-fluid">
    <div class="row">
        
        <!-- Left Bar --->
        
    <div class="col-md-3">
        <ul class="list-group">
            <li class="list-group-item" style="background-color: orange;"><h3>Categories<h3></li>
            
            <c:forEach items="${productMap}" var="entry">
                
                <li class="list-group-item">${entry.key}<a style="float: right;" href="#" class="badge badge-success"><span>${entry.value.size()}</span></a></li>
            </c:forEach>
        </ul>
    </div>
        
        <!-- Right Bar  --->
        
        <div class="col-md-9">
            <div class="row">
                <c:forEach items="${productMap}" var="entry">
                    <c:forEach items="${entry.value}" var="prod">
                        <div class="col-md-5" style="margin: 0;"><br>
                            <div class="card" style="margin: 0;">
                                <div class="card-body"  style="padding:0; text-align: center;">
                                    
                                    <img class="card-img-top" src="${prod.getImagePath()}" alt="Card image cap" style="object-position:center cover; height: 200px;">
                                    <h5 class="card-title" style="margin-top: 10px;">${prod.getName()}</h5>
                                    
                                    <h5> ₹&nbsp${prod.getPrice()}</h5>
                                    
                                    <a href="Product/ViewSingleProduct.jsp?id=${prod.getId()}" class="btn btn-success" style="color: black; width: 150px; margin-bottom: 10px;"><b>View</b></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:forEach>
            </div>
        </div>
        </div>
        </div>
    
        <!-- Footer   --->

        <div class="jumbotron" style="color: white;background-color: black; margin-top: 60px; margin-bottom: 0;">

        
            <p><center><b>@Copyright 1999-2019 by Reference Data. All Rights Reserved.Powered by VMM.</b></center></p>
    </div>
       

        </body>
        </html>

<%--
    Document   : menu
    Created on : 06-feb-2021, 11:26:15
    Author     : HECTOR
--%>

<%@page import="project.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Usuario usuario = (Usuario) request.getAttribute("usuario");
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <style>
            #divBody{
                width: 500px;
                height: 500px;
                background-color: white;
                margin-left: 675px;
                margin-top: 200px;
            }
            #divImg{
                background-size: cover; 
            }
            #imgMenu{
                width: 100%;
                height: 100%;
            }
            #carouselExampleIndicators{
                
                width: 800px;
                margin: 0 auto;
                margin-top: 80px;
            }
            img{
                width: 800px;
                height: 500px;
            }
            h1{
                margin-top: 20px;
            }
            


        </style>

        <title>JSP Page</title>
    </head>
    <body id="divImg" style="background-image: url('https://www.solofondos.com/wp-content/uploads/2015/11/new-fondo1lateral.jpg')">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/usuario/loginForm.html">Iniciar sesión</a>
                </li>
            </ul>
        </nav>
        <h1 class="row justify-content-center text-light" style="font-family: monospace">
            Hoteles de Madrid
        </h1>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner justify-content-center">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="https://static-new.lhw.com/HotelImages/Final/LW1447/lw1447_101448962_720x450.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="https://imagenes.20minutos.es/files/image_656_370/uploads/imagenes/2020/03/19/el-hotel-ayre-gran-hotel-colon-de-madrid-sera-el-primero-medicalizado-para-el-coronavirus.jpeg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="https://pix10.agoda.net/hotelImages/875/87509/87509_15060520050028733140.jpg?s=1024x768" alt="Third slide">
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
    </body>
    <footer class="bg-dark text-center text-lg-start fixed-bottom">
        <div class="text-center p-3 text-light" style="background-color: rgba(0, 0, 0, 0.2)" >
            <p>Created by: Héctor Crespo Puig</p>
        </div>
    </footer>

</html>

<%-- 
    Document   : menu
    Created on : 06-feb-2021, 11:26:15
    Author     : HECTOR
--%>

<%@page import="project.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuario = (Usuario) request.getAttribute("usuario");
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
            
            #usuarioMenu{
                margin-top: 30px;
            }
            
            #carouselExampleControls{
                width: 800px;
                margin: 0 auto;
            }
            img{
                width: 800px;
                height: 500px;
            }

        </style>
        <title>JSP Page</title>
    </head>
    <body style="background-image: url('https://www.solofondos.com/wp-content/uploads/2015/11/new-fondo1lateral.jpg')">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Home</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/basicdata.html">BasicData <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/media.html">Media <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/usuario.html">Usuarios <span class="sr-only">(current)</span></a>
                    </li>

                </ul>
                <ul class="navbar-nav">
                    <li class="ml-auto">
                        <a class="nav-link" href="<%=request.getContextPath()%>/index.html">Cerrar sesión <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>


        <h1 class="row justify-content-center text-light" id="usuarioMenu" style="font-family: monospace">
            Bienvenido/a <%=usuario.getUsuario()%>
        </h1>

        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" >
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="https://dondealojarseen.com/wp-content/uploads/2019/07/Gran-Meli%C3%A1-Palacio-de-los-Duques-hoteles-de-lujo-en-madrid.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="https://ep01.epimg.net/elviajero/imagenes/2018/08/23/actualidad/1535034023_735600_1535034763_noticia_normal_recorte1.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="https://static3.abc.es/media/viajar/2019/06/17/Aloft-azotea-k0tG--620x349@abc.jpg" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
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

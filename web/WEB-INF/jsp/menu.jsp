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
            #divSaludaUsuario{
            }
            #imgMenu{
                width: 100%;   
                height: 100%;
            }
            body{
                
            }
        </style>

        <title>JSP Page</title>
    </head>
    <body style="background:#BDBDBD">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/usuario/loginForm.html">Iniciar sesión</a>
                </li>
            </ul>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link hidden" href="<%=request.getContextPath()%>/basicdata.html" >BasicData <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link hidden" href="<%=request.getContextPath()%>/media.html">Media <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link hidden" href="<%=request.getContextPath()%>/usuario.html">Usuarios <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="row justify-content-center" id="diImgMenu">
            <image src="https://st3.idealista.com/cms/archivos/styles/idcms_social_large_desktop/public/2018-06/news/madrid%20gtres.jpg?fv=reFMJ_Db&itok=OvwtMOLC" id="imgMenu"/>
        </div>
        <!--
        <div class="row justify-content-center" id="divSaludaUsuario">
            <h1>Hola <%/*=usuario.getUsuario()*/%></h1><br>
        </div>
        -->


    </body>
</html>

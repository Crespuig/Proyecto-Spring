<%@page import="project.model.Usuario"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.controller.FormOperation"%>

<%
    FormOperation formOperation = (FormOperation) request.getAttribute("formOperation");
    String labelButton = "";
    String urlAction = "";
    switch (formOperation) {
        case Insert:
            labelButton = "Insertar";
            urlAction = request.getContextPath() + "/usuario/insert.html";
            break;
        case Login:
            labelButton = "Login";
            urlAction = request.getContextPath() + "/usuario/login.html";
            break;

    }


%>    

<!DOCTYPE html "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            
            #formInicio{
                background: #90a4ae;
                border-radius: 10px;
                width: 100%;
                padding: 10px;
            }
            	

        </style>
        <title>Iniciar sesión</title>
    </head>
    <body style="background-image: url('https://www.solofondos.com/wp-content/uploads/2015/11/new-fondo1lateral.jpg')">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
            </ul>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <%
                    switch (formOperation) {
                        case Insert:
                %>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/basicdata.html">BasicData <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/media.html">Media <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="<%=request.getContextPath()%>/usuario.html">Usuarios <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <%
                    }
                %>
            </div>
        </nav>
        <div class="container">

            <h1 class="row justify-content-center text-light" style="font-family: monospace">Iniciar sesión</h1>

            <div class="container col-lg-3">
                <form action="<%=urlAction%>" method="post" id="formInicio">

                    <fieldset>
                        <%
                            switch (formOperation) {
                                case Insert:
                        %>
                        <div class="form-group">
                            <label class="control-label" for="nombre">Nombre</label>
                            <input class="form-control" id="txtNombre" type="text" name="nombre" "/><br>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="apellidos">Apellidos:</label>
                            <input class="form-control" id="txtApellidos" type="text" name="apellidos" "/><br>
                        </div>
                        <%
                            }
                        %>
                        <div class="form-group">
                            <label class="control-label" for="usuario">Usuario:</label>
                            <input class="form-control" id="txtUsuario" type="text" name="usuario" "/><br>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="password">Contraseña:</label>
                            <input class="form-control" id="txtPassword" type="password" name="password" "/><br>
                        </div>
                    </fieldset>
                    <div class="form-actions">
                        <input type="submit" value="<%=labelButton%>" id="btnIniciarSesion" />
                    </div>
                    No tienes una cuenta... <a href="<%=request.getContextPath()%>/usuario/newForInsert.html">Registrarme</a>
                </form>
            </div>
        </div>
      
    </body>
    <footer class="bg-dark text-center text-lg-start fixed-bottom">
        <div class="text-center p-3 text-light" style="background-color: rgba(0, 0, 0, 0.2)" >
            <p>Created by: Héctor Crespo Puig</p>
        </div>
    </footer>
</html>

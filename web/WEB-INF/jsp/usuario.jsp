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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script type="text/javascript"  src="<%=request.getContextPath()%>/js/jquery-1.9.0.js"></script>
        <script type="text/javascript"  src="<%=request.getContextPath()%>/js/bootstrap.js" ></script>
        <title>Iniciar sesión</title>
    </head>
    <body style="background:#FDFDFD">
        <div class="container">
            <div class="row">
                <div class="col-sm">&nbsp;</div>
            </div>
            <div class="col-sm">
                <h1>Iniciar sesión</h1>
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
</html>

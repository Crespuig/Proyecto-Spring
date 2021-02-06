<%@page import="project.model.Usuario"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.controller.FormOperation"%>

<%
    FormOperation formOperation = (FormOperation) request.getAttribute("formOperation");
    String labelButton = null;
    String urlAction = null;
    switch (formOperation) {
        case Insert:
            labelButton = "Insertar";
            urlAction = request.getContextPath() + "/usuario/insert.html";
            break;
        case Update:
            labelButton = "Actualizar";
            urlAction = request.getContextPath() + "/usuario/update.html";
            break;
        case Delete:
            labelButton = "Borrar";
            urlAction = request.getContextPath() + "/usuario/delete.html";
            break;
        default:
            throw new RuntimeException("El valor de 'formOperation' no es valido" + formOperation);
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
                        <div class="form-group">
                            <label class="control-label" for="id">Id:</label>
                            <input class="form-control disabled " id="id" name="id" type="text" value="${usuario.id}" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="nombre">Nombre</label>
                            <input class="form-control" id="txtNombre" type="text" name="nombre" value="${usuario.nombre} "/><br>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="apellidos">Apellidos:</label>
                            <input class="form-control" id="txtApellidos" type="text" name="apellidos" value="${usuario.apellidos}"/><br>
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="usuario">Usuario:</label>
                            <input class="form-control" id="txtUsuario" type="text" name="usuario" value="${usuario.usuario}"/><br>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="password">Contraseña:</label>
                            <input class="form-control" id="txtPassword" type="password" name="password" value="${usuario.password}"/><br>
                        </div>
                    </fieldset>
                   
                    <div class="form-actions">
                        <button id="aceptarBtn" class="btn btn-primary" type="submit"><%=labelButton%></button>
                        <a class="btn" href="<%=request.getContextPath()%>/basicdata.html" >Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

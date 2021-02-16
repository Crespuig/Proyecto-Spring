<%@page import="project.model.Basicdata"%>
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
            urlAction = request.getContextPath() + "/basicdata/insert.html";
            break;
        case Update:
            labelButton = "Actualizar";
            urlAction = request.getContextPath() + "/basicdata/update.html";
            break;
        case Delete:
            labelButton = "Borrar";
            urlAction = request.getContextPath() + "/basicdata/delete.html";
            break;
        default:
            throw new RuntimeException("El valor de 'formOperation' no es valido" + formOperation);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Basicdata</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script type="text/javascript"  src="<%=request.getContextPath()%>/js/jquery-1.9.0.js"></script>
        <script type="text/javascript"  src="<%=request.getContextPath()%>/js/bootstrap.js" ></script>
        <style>
            
            #formInicio{
                background: #90a4ae;
                border-radius: 10px;
                width: 100%;
                padding: 10px;
            }
        </style>
    </head>
    <body style="">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="#">Home</a>
            </li>
        </ul>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="<%=request.getContextPath()%>/basicdata.html">BasicData <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/media.html">Media <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/usuario.html">Usuarios <span class="sr-only">(current)</span></a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-sm">&nbsp;</div>
        </div>
        <div class="row">
            <div class="col-sm">
                <h3><%=labelButton%> Basicdata</h3>
                <form action="<%=urlAction%>" method="post" id="formInicio" >
                    <fieldset>
                        <div class="form-group">
                            <label class="control-label" for="id">Id:</label>
                            <input class="form-control disabled " id="idBasicData" name="idBasicData" type="text" value="${basicdata.idBasicData}" readonly="readonly">
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="language">Language:</label>
                            <input class="form-control" id="language" type="text" name="language" value="${basicdata.language}" >
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="phone">Phone:</label>
                            <input class="form-control" id="phone" type="text" name="phone" value="${basicdata.phone}" >
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="web">Web:</label>
                            <input class="form-control" id="web" type="text" name="web" value="${basicdata.web}" >
                        </div>
                    </fieldset>

                    <div class="form-actions">
                        <button id="aceptarBtn" class="btn btn-primary" type="submit"><%=labelButton%></button>
                        <a class="btn" href="<%=request.getContextPath()%>/basicdata.html" >Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
<footer class="bg-dark text-center text-lg-start fixed-bottom">
    <div class="text-center p-3 text-light" style="background-color: rgba(0, 0, 0, 0.2)" >
        <p>Created by: Héctor Crespo Puig</p>
    </div>
</footer>
</html>
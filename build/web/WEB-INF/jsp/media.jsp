<%@page import="project.model.Media"%>
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
            urlAction = request.getContextPath() + "/media/insert.html";
            break;
        case Update:
            labelButton = "Actualizar";
            urlAction = request.getContextPath() + "/media/update.html";
            break;
        case Delete:
            labelButton = "Borrar";
            urlAction = request.getContextPath() + "/media/delete.html";
            break;
        default:
            throw new RuntimeException("El valor de 'formOperation' no es valido" + formOperation);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
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
            footer{
                position:absolute;
                bottom:0;
                width: 100%;
                height: 10px;
            }
            #form{
                background: white;
                border-radius: 10px;
            }
        </style>
    </head>
    <body style="background:#BDBDBD">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/index.html">Home</a>
            </li>
        </ul>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/basicdata.html">BasicData <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
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
                <h3>Media</h3>
                <form action="<%=urlAction%>" method="post" >
                    <fieldset>
                        <div class="form-group">
                            <label class="control-label" for="idMedia">IdMedia:</label>
                            <input class="form-control disabled " id="idMedia" name="idMedia" type="text" value="${media.idMedia}" readonly="readonly">
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="idBasicData">IdBasicdata:</label>
                            <input class="form-control disabled " id="idBasicdata" name="idBasicdata" type="text" value="${media.getBasicdata().idBasicData}">
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="url">Url</label>
                            <input class="form-control" id="url" type="text" name="url" value="${media.url}" >
                        </div>


                    </fieldset>

                    <div class="form-actions">
                        <button id="aceptarBtn" class="btn btn-primary" type="submit"><%=labelButton%></button>
                        <a class="btn" href="<%=request.getContextPath()%>/media.html" >Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <footer class="bg-light text-center text-lg-start">
        <!-- Grid container -->
        <div>
        </div>
        <!-- Grid container -->

        <!-- Copyright -->
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
            Created by: Héctor Crespo Puig

        </div>
        <!-- Copyright -->
    </footer>
    <!-- Footer -->
</body>
</html>
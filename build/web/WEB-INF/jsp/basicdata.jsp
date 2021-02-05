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
    </head>
    <body style="background:#FDFDFD">
        <div class="container">
            <div class="row">
                <div class="col-sm">&nbsp;</div>
            </div>
            <div class="row">
                <div class="col-sm">
                    <h3>Basicdata</h3>
                    <form action="<%=urlAction%>" method="post" >
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
                                <input class="form-control" id="ape2" type="text" name="ape2" value="${basicdata.web}" >
                            </div>
                        </fieldset>

                        <div class="form-actions">
                            <button id="aceptarBtn" class="btn btn-primary" type="submit"><%=labelButton%></button>
                            <a class="btn" href="<%=request.getContextPath()%>/index.html" >Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>

        </script>
    </body>
</html>
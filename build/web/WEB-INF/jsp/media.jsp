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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Media</title>
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
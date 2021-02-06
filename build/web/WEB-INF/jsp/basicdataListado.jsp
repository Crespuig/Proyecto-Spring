<%@page import="java.util.ArrayList"%>
<%@page import="project.model.Media"%>
<%@page import="project.model.Basicdata"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Basicdata> basicdatas = (List<Basicdata>) request.getAttribute("basicdatas");
    List<Media> medias = (List<Media>) request.getAttribute("medias");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado Basicdata</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </head>
    <body style="background:#BDBDBD">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Home</a>
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
            <div class="row-fluid">
                <div class="span12">&nbsp;</div>
            </div>
            <div class="row-fluid">
                <div class="offset1  span10">
                    <div class="row-fluid">
                        <div class="span12">
                            <a id="btnNuevo" class="btn btn-primary" 
                               href="<%=request.getContextPath()%>/basicdata/newForInsert.html">Nuevo Basicdata</a>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span12">
                            <table class="table table-striped table-dark">
                                <thead>
                                    <tr>
                                        <th>IdBasicData</th>
                                        <th>Language</th>
                                        <th>Phone</th>
                                        <th>Web</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody class="table table-striped table-dark">
                                    <%
                                        int i = 1;
                                        String id = "", href = "";
                                        for (Basicdata basicdata : basicdatas) {
                                            ArrayList<Media> mediasLista = new ArrayList<>();
                                            for (Media m : medias) {
                                                if (m.getBasicdata().getIdBasicData() == basicdata.getIdBasicData()) {
                                                    mediasLista.add(m);
                                                }
                                            }
                                            id = "accordion" + i;
                                            href = "collapse" + i;
                                            i++;
                                    %>

                                    <tr class="accordion-toggle collapsed" id="<%=id%>" data-toggle="collapse" data-parent="#<%=id%>" href="#<%=href%>">
                                        <td style="background:#9E9E9E"><a href="<%=request.getContextPath()%>/basicdata/readForUpdate.html?id=<%=basicdata.getIdBasicData()%>" title="Editar"><%=basicdata.getIdBasicData()%></a></td>
                                        <td><%=HtmlUtils.htmlEscape(basicdata.getLanguage())%></td>
                                        <td><%=HtmlUtils.htmlEscape(basicdata.getPhone())%></td>
                                        <td><%=HtmlUtils.htmlEscape(basicdata.getWeb())%></td>
                                        <td style="background:#9E9E9E">
                                            <a href="<%=request.getContextPath()%>/basicdata/readForDelete.html?id=<%=basicdata.getIdBasicData()%>" title="Borrar" ><i class="bi bi-trash"></i></a>
                                        </td>
                                    </tr>
                                    <!-- Es crea una tr per a posarli dins la tabla de films de cada director -->
                                    <tr style="padding:0px;">
                                        <td colspan="5" style="padding:0px;">
                                            <!-- Es crea la tabla oculta (important la clase collapse in p-3 i el id generat antes en el for)-->
                                            <table id="<%=href%>" class="collapse in p-3 table table-bordered table-hover table-condensed">
                                                <thead>
                                                    <tr>
                                                        <th>IdMedia</th>
                                                        <th>Url</th>
                                                        <th>Borrar</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <!-- Per cada film es crea una row en la tabla -->
                                                    <%
                                                        for (Media m : mediasLista) {
                                                    %>
                                                    <tr>

                                                        <td><a href="<%=request.getContextPath()%>/media/readForUpdate.html?id=<%=m.getIdMedia()%>" title="Editar" ><%=m.getIdMedia()%></a></td>
                                                        <td><%=m.getUrl()%></td>
                                                        <td>
                                                            <a href="<%=request.getContextPath()%>/media/readForDelete.html?id=<%=m.getIdMedia()%>" title="Borrar" ><i class="bi bi-trash"></i></a>
                                                        </td>
                                                    </tr>
                                                    <%}%>
                                            </table>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="span1"></div>
            </div>
        </div>
    </body>
</html>
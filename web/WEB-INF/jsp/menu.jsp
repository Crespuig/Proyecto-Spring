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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hola <%=usuario.getUsuario()%></h1>
        <a href="<%=request.getContextPath()%>/media.html">Media</a>
        <a href="<%=request.getContextPath()%>/basicdata.html">Basicdata</a>
        <a href="<%=request.getContextPath()%>/usuario.html">Usuarios</a>
    </body>
</html>

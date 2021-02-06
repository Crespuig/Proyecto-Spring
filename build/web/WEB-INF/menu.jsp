<%-- 
    Document   : menu
    Created on : 06-feb-2021, 11:26:15
    Author     : HECTOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSession = request.getSession(false);
    String usuario = (String) objSession.getAttribute("usuario");
    if (usuario.equals("")) {
            response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hola <%out.print(usuario);%> ... Acceso correcto</h1>
    </body>
</html>

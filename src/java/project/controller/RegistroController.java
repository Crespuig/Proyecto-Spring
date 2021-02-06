/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author HECTOR
 */
@MultipartConfig
@Controller
public class RegistroController {
        @RequestMapping({"/registro.html"})
        protected void  proccesRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        
        String usuario  = request.getParameter("usuario");
        String nombre  = request.getParameter("nombre");
        String apellidos  = request.getParameter("apellidos");
        String password  = request.getParameter("password");
        
        Consultas consultas = new Consultas();
        if (consultas.registrar(usuario, nombre, apellidos, password)) {
            response.sendRedirect("index.jsp");
        }else{
            response.sendRedirect("registro.jsp");
        }
        
        
    }
}

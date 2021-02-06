/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import project.persistencia.dao.UsuarioDAO;

/**
 *
 * @author HECTOR
 */
@MultipartConfig
@Controller
public class InicioSesionController {

    @Autowired
    private UsuarioDAO usuarioDao;

    @RequestMapping({"/inicio.html"})
    protected ModelAndView proccesRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        PrintWriter out = response.getWriter();

        try {
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");

            viewName = "inicio";

            Consultas consultas = new Consultas();
            if (consultas.autentication(usuario, password)) {
                HttpSession objSession = request.getSession(true);
                objSession.setAttribute("usuario", usuario);

                response.sendRedirect("menu.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        } catch (IOException | SQLException e) {
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);

    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.controller;

import bda.dao.BussinessException;
import bda.dao.BussinessMessage;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import project.model.Usuario;
import project.persistencia.dao.UsuarioDAO;

/**
 *
 * @author HECTOR
 */
@Controller
public class UsuarioController {
    
    @Autowired
    private UsuarioDAO usuarioDao;
    
    @RequestMapping({"/usuario.html"})
    public ModelAndView read(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            List<Usuario> usuarios = usuarioDao.findAll();
            model.put("usuarios", usuarios);
            viewName = "usuariosListado";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }
    
    @RequestMapping({"/usuario/newForInsert.html"})
    public ModelAndView newForInsert(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            Usuario usuario = usuarioDao.create();
            model.put("formOperation", FormOperation.Insert);
            model.put("usuario", usuario);

            viewName = "usuario";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/usuario/insert.html"})
    public ModelAndView insert(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Usuario usuario = null;
        try {
            usuario = usuarioDao.create();
            usuario.setUsuario(request.getParameter("usuario"));
            usuario.setNombre(request.getParameter("nombre"));
            usuario.setApellidos(request.getParameter("apellidos"));
            usuario.setPassword(request.getParameter("password"));

            usuarioDao.saveOrUpdate(usuario);

            viewName = "redirect:/index.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }
    
    @RequestMapping({"/usuario/readForUpdate.html"})
    public ModelAndView readForUpdate(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        int id;

        id = Integer.parseInt(request.getParameter("id"));

        try {
            Usuario usuario = usuarioDao.get(id);
            if (usuario == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el usuario con id = " + id));
            }
            model.put("formOperation", FormOperation.Update);
            model.put("usuario", usuario);
            viewName = "usuario";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/usuario/update.html"})
    public ModelAndView update(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Usuario usuario = null;
        try {
            int id;
            id = Integer.parseInt(request.getParameter("id"));

            usuario = usuarioDao.get(id);
            if (usuario == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el usuario"));
            }
            usuario.setUsuario(request.getParameter("usuario"));
            usuario.setNombre(request.getParameter("nombre"));
            usuario.setApellidos(request.getParameter("apellidos"));
            usuario.setPassword(request.getParameter("password"));

            usuarioDao.saveOrUpdate(usuario);

            viewName = "redirect:/index.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }
    
    @RequestMapping({"/usuario/readForDelete.html"})
    public ModelAndView readForDelete(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        int id;

        id = Integer.parseInt(request.getParameter("id"));

        try {
            Usuario usuario = usuarioDao.get(id);
            if (usuario == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el usuario con id = " + id));
            }
            model.put("formOperation", FormOperation.Delete);
            model.put("usuario", usuario);
            viewName = "usuario";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/usuario/delete.html"})
    public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Usuario usuario = null;
        try {
            int id;
            id = Integer.parseInt(request.getParameter("id"));

            usuario = usuarioDao.get(id);
            if (usuario == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el usuario a borrar"));
            }

            usuarioDao.delete(id);

            viewName = "redirect:/index.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("usuario", usuario);
            model.put("formOperation", FormOperation.Delete);
            viewName = "usuario";
        }
        return new ModelAndView(viewName, model);
    }
    
}

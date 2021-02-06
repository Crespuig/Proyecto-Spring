/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package project.controller;

import bda.dao.BussinessException;
import bda.dao.BussinessMessage;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import project.model.Basicdata;
import project.model.Media;
import project.persistencia.dao.BasicdataDAO;
import project.persistencia.dao.MediaDAO;

/**
 *
 * @author Lorenzo González
 */
@MultipartConfig
@Controller
public class MediaController {

    @Autowired
    private MediaDAO mediaDAO;
    @Autowired
    private BasicdataDAO basicdataDAO;

    @RequestMapping({"/media"})
    public ModelAndView read(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            List<Media> medias = mediaDAO.findAll();
            model.put("medias", medias);
            viewName = "mediaListado";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/media/newForInsert.html"})
    public ModelAndView newForInsert(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            Media media = mediaDAO.create();
            model.put("formOperation", FormOperation.Insert);
            model.put("media", media);

            viewName = "media";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/media/insert.html"})
    public ModelAndView insert(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Media media = null;
        
        try {
            media = mediaDAO.create();
            media.setUrl(request.getParameter("url"));
            media.setBasicdata(basicdataDAO.get(Integer.parseInt(request.getParameter("idBasicdata"))));

            mediaDAO.saveOrUpdate(media);

            viewName = "redirect:/media.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/media/readForUpdate.html"})
    public ModelAndView readForUpdate(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        int id;

        id = Integer.parseInt(request.getParameter("id"));

        try {
            Media media = mediaDAO.get(id);
            if (media == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el media con id = " + id));
            }
            model.put("formOperation", FormOperation.Update);
            model.put("media", media);
            viewName = "media";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/media/update.html"})
    public ModelAndView update(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Media media = null;
        try {
            int id;
            id = Integer.parseInt(request.getParameter("idMedia"));

            media = mediaDAO.get(id);
            if (media == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el media"));
            }
            media.setUrl(request.getParameter("url"));
            

            mediaDAO.saveOrUpdate(media);

            viewName = "redirect:/media.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/media/readForDelete.html"})
    public ModelAndView readForDelete(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        int id;

        id = Integer.parseInt(request.getParameter("id"));

        try {
            Media media = mediaDAO.get(id);
            if (media == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el media con id = " + id));
            }
            model.put("formOperation", FormOperation.Delete);
            model.put("media", media);
            viewName = "media";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/media/delete.html"})
    public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Media media = null;
        try {
            int id;
            id = Integer.parseInt(request.getParameter("idMedia"));

            media = mediaDAO.get(id);
            if (media == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el media a borrar"));
            }

            mediaDAO.delete(id);

            viewName = "redirect:/media.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("media", media);
            model.put("formOperation", FormOperation.Delete);
            viewName = "media";
        }
        return new ModelAndView(viewName, model);
    }
}

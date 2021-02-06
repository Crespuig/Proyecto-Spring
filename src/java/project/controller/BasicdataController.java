/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package project.controller;

import bda.dao.BussinessException;
import bda.dao.BussinessMessage;
import java.io.UnsupportedEncodingException;
import project.persistencia.dao.BasicdataDAO;
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

/**
 *
 * @author Lorenzo González
 */
@MultipartConfig
@Controller
public class BasicdataController {

    @Autowired
    private BasicdataDAO basicdataDAO;

    @RequestMapping({"/basicdata"})
    public ModelAndView read(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;
        

        try {
            List<Basicdata> basicdatas = basicdataDAO.findAll();
            model.put("basicdatas", basicdatas);
            viewName = "basicdataListado";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/basicdata/newForInsert.html"})
    public ModelAndView newForInsert(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            Basicdata basicdata = basicdataDAO.create();
            model.put("formOperation", FormOperation.Insert);
            model.put("basicdata", basicdata);

            viewName = "basicdata";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/basicdata/insert.html"})
    public ModelAndView insert(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Basicdata basicdata = null;
        try {
            basicdata = basicdataDAO.create();
            basicdata.setLanguage(request.getParameter("language"));
            basicdata.setPhone(request.getParameter("phone"));
            basicdata.setWeb(request.getParameter("web"));

            basicdataDAO.saveOrUpdate(basicdata);

            viewName = "redirect:/basicdata.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/basicdata/readForUpdate.html"})
    public ModelAndView readForUpdate(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        int id;

        id = Integer.parseInt(request.getParameter("id"));

        try {
            Basicdata basicdata = basicdataDAO.get(id);
            if (basicdata == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el basicdata con id = " + id));
            }
            model.put("formOperation", FormOperation.Update);
            model.put("basicdata", basicdata);
            viewName = "basicdata";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/basicdata/update.html"})
    public ModelAndView update(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Basicdata basicdata = null;
        try {
            int id;
            id = Integer.parseInt(request.getParameter("idBasicData"));

            basicdata = basicdataDAO.get(id);
            if (basicdata == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el basicdata"));
            }
            basicdata.setLanguage(request.getParameter("language"));
            basicdata.setPhone(request.getParameter("phone"));
            basicdata.setWeb(request.getParameter("web"));

            basicdataDAO.saveOrUpdate(basicdata);

            viewName = "redirect:/basicdata.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/basicdata/readForDelete.html"})
    public ModelAndView readForDelete(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        int id;

        id = Integer.parseInt(request.getParameter("id"));

        try {
            Basicdata basicdata = basicdataDAO.get(id);
            if (basicdata == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el basicdata con id = " + id));
            }
            model.put("formOperation", FormOperation.Delete);
            model.put("basicdata", basicdata);
            viewName = "basicdata";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/basicdata/delete.html"})
    public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Basicdata basicdata = null;
        try {
            int id;
            id = Integer.parseInt(request.getParameter("idBasicData"));

            basicdata = basicdataDAO.get(id);
            if (basicdata == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el basicdata a borrar"));
            }

            basicdataDAO.delete(id);

            viewName = "redirect:/basicdata.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("basicdata", basicdata);
            model.put("formOperation", FormOperation.Delete);
            viewName = "basicdata";
        }
        return new ModelAndView(viewName, model);
    }
}

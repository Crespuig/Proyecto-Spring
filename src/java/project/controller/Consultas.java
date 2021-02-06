/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.controller;

import bda.hibernate.HibernateUtil;
import com.mysql.cj.xdevapi.PreparableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.engine.jdbc.connections.spi.ConnectionProvider;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author HECTOR
 */
@Controller
public class Consultas extends HibernateUtil {

    public boolean autentication(String usuario, String password) throws SQLException {
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String consulta = "SELECT * FROM usuarios WHERE usuario = ? and password = ?";
            
            Configuration configuration = new Configuration();
            configuration.configure();
            ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
             
            Connection con = sessionFactory.getSessionFactoryOptions().getServiceRegistry().getService(ConnectionProvider.class).getConnection();
                    
            pst = con.prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, password);

            rs = pst.executeQuery();

            if (rs.absolute(1)) {
                return true;
            }

        } catch (SQLException e) {
            System.err.println("Error " + e);
        } finally {
            try {
                
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.err.println("Error " + e);
            }

        }

        return false;
    }

    public boolean registrar(String usuario, String nombre, String apellidos, String password) throws SQLException {

        PreparedStatement pst = null;
        
        try {
            String consulta = "INSERT INTO usuarios (usuario, nombre, apellidos, password) values(?, ?, ?, ?)";
            Configuration configuration = new Configuration();
            configuration.configure();
            ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
            Connection con = sessionFactory.getSessionFactoryOptions().getServiceRegistry().getService(ConnectionProvider.class).getConnection();
           
            pst = con.prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, usuario);
            pst.setString(3, apellidos);
            pst.setString(4, password);

            if (pst.executeUpdate() == 1) {
                return true;
            }

        } catch (SQLException e) {
            System.err.println("Error " + e);
        } finally {
            try {
                
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                System.err.println("Error " + e);
            }

            return false;
        }
    }
}

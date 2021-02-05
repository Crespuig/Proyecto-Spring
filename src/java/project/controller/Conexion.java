/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author HECTOR
 */
public class Conexion {
    
    private final String USERNAME = "proyectodb";
    private final String PASSWORD = "proyectodb";
    private final String HOST = "localhost";
    private final String PORT = "3306";
    private final String DATABASE = "proyectodb";
    private final String CLASSNAME ="com.mysql.jdbc.Driver";
    private final String URL = "jdbc.mysql.jdbc://" + HOST + ":" + PORT + "/" + DATABASE;
    private Connection con;
    
    public Conexion() throws SQLException{
        try {
            Class.forName(CLASSNAME);
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("Error: " + e);
        } catch(SQLException ex){
            ex.addSuppressed(ex);
        }
    }
    
    public Connection getConnection(){
        return con;
    }
    
}

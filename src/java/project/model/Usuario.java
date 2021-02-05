/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.model;

/**
 *
 * @author HECTOR
 */
public class Usuario implements java.io.Serializable {

    private int id;
    private String usuario;
    private String nombre;
    private String apellidos;
    private String password;

    public Usuario() {
    }

    public Usuario(String usuario, String nombre, String apellidos, String password) {
        this.usuario = usuario;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id=" + id + ", usuario=" + usuario + ", nombre=" + nombre + ", apellidos=" + apellidos + ", password=" + password + '}';
    }

}

package com.example.proyectoweb.model.beans;

import java.text.DateFormat;

public class Usuario {

    private int idUsuario;
    private String idRolSistema;
    private String idEstado;
    private String nombres;
    private String apellidos;
    private String codigo;
    private String correo;
    private String contrasena;
    private String fechaCreacion;
    private String cantEventsInscrito;
    private String idRolAcademico;
    private int kitTeleco;

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getIdRolSistema() {
        return idRolSistema;
    }

    public void setIdRolSistema(String idRolSistema) {
        this.idRolSistema = idRolSistema;
    }

    public String getIdRolAcademico() {
        return idRolAcademico;
    }

    public void setIdRolAcademico(String idRolAcademico) {
        this.idRolAcademico = idRolAcademico;
    }

    public String getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(String idEstado) {
        this.idEstado = idEstado;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getCantEventsInscrito() {
        return cantEventsInscrito;
    }

    public void setCantEventsInscrito(String cantEventsInscrito) {
        this.cantEventsInscrito = cantEventsInscrito;
    }

    public int getKitTeleco() {
        return kitTeleco;
    }

    public void setKitTeleco(int kitTeleco) {
        this.kitTeleco = kitTeleco;
    }
}

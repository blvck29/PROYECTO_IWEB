package com.example.proyectoweb.model.beans;

public class UsuarioInscritoXevento {
    private String idUsuario;
    private String codigo;
    private String nombres;
    private String apellidos;
    private String idEvento;
    private String tituloEventoInscrito;


    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
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

    public String getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(String idEvento) {
        this.idEvento = idEvento;
    }

    public String getTituloEventoInscrito() {
        return tituloEventoInscrito;
    }

    public void setTituloEventoInscrito(String tituloEventoInscrito) {
        this.tituloEventoInscrito = tituloEventoInscrito;
    }
}

    package com.example.proyectoweb.model.beans;


public class Inscrito {
    private int idEvento;
    private String rolEnEvento;
    private Usuario usuario;
    private int cantidad;

    public int getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(int idEvento) {
        this.idEvento = idEvento;
    }

    public String getRolEnEvento() {
        return rolEnEvento;
    }

    public void setRolEnEvento(String rolEnEvento) {
        this.rolEnEvento = rolEnEvento;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}

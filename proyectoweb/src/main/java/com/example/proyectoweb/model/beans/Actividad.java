package com.example.proyectoweb.model.beans;

import java.sql.Blob;
import java.sql.Date;
import java.sql.Time;

public class Actividad {
    private String idActividad;
    private String titulo;
    private Blob banner;
    private Blob miniatura;
    private int idEncargado;

    private Usuario delegado;


    public Usuario getDelegado() {
        return delegado;
    }

    public void setDelegado(Usuario delegado) {
        this.delegado = delegado;
    }

    public String getIdActividad() {
        return idActividad;
    }

    public void setIdActividad(String idActividad) {
        this.idActividad = idActividad;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Blob getBanner() {
        return banner;
    }

    public void setBanner(Blob banner) {
        this.banner = banner;
    }

    public Blob getMiniatura() {
        return miniatura;
    }

    public void setMiniatura(Blob miniatura) {
        this.miniatura = miniatura;
    }

    public int getIdEncargado() {
        return idEncargado;
    }

    public void setIdEncargado(int idEncargado) {
        this.idEncargado = idEncargado;
    }
}

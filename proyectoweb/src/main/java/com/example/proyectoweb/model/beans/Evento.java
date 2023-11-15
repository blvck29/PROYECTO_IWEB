package com.example.proyectoweb.model.beans;

import java.io.InputStream;
import java.sql.*;

public class Evento {
    private int idEvento;
    private String titulo;
    private String subTitulo;
    private Time hora;
    private Date fecha;
    private String lugar;
    private InputStream imagen;
    private String descripcion;
    private String idEstado;
    private String idActividad;


    public Evento(int idEvento, String titulo, String subTitulo, Time hora, Date fecha, String lugar, InputStream imagen, String descripcion, String idEstado, String idActividad) {
        this.idEvento = idEvento;
        this.titulo = titulo;
        this.subTitulo = subTitulo;
        this.hora = hora;
        this.fecha = fecha;
        this.lugar = lugar;
        this.imagen = imagen;
        this.descripcion = descripcion;
        this.idEstado = idEstado;
        this.idActividad = idActividad;
    }

    public int getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(int idEvento) {
        this.idEvento = idEvento;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getSubTitulo() {
        return subTitulo;
    }

    public void setSubTitulo(String subTitulo) {
        this.subTitulo = subTitulo;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public InputStream getImagen() {
        return imagen;
    }

    public void setImagen(InputStream imagen) {
        this.imagen = imagen;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(String idEstado) {
        this.idEstado = idEstado;
    }

    public String getIdActividad() {
        return idActividad;
    }

    public void setIdActividad(String idActividad) {
        this.idActividad = idActividad;
    }

}

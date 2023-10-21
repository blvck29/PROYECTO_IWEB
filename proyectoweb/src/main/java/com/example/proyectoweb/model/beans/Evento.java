package com.example.proyectoweb.model.beans;

import java.sql.*;

public class Evento {
    private int idEvento;
    private String titulo;
    private String subTitulo;
    private Time hora;
    private Date fecha;
    private String lugar;
    private Blob imagen;
    private String descripcion;
    private String idEstado;
    private String idActividad;


    public Evento(int idEvento, String titulo, String subTitulo, Time hora, Date fecha, String lugar, Blob imagen, String descripcion, String idEstado, String idActividad) {
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
}

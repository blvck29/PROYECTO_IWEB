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
    public Actividad(String idActividad, String titulo, Blob banner, Blob miniatura, int idEncargado) {
        this.idActividad = idActividad;
        this.titulo = titulo;
        this.banner = banner;
        this.miniatura = miniatura;
        this.idEncargado = idEncargado;

    }
}

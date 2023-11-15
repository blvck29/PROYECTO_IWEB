package com.example.proyectoweb.model.beans;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Time;

public class Inscripcion extends Evento {

    private String rol;

    public Inscripcion(String rol, int idEvento, String titulo, String subTitulo, Time hora, Date fecha, String lugar, InputStream imagen, String descripcion, String idEstado, String idActividad) {
        super(idEvento, titulo, subTitulo, hora, fecha, lugar, imagen, descripcion, idEstado, idActividad);
        this.rol = rol;
    }
}

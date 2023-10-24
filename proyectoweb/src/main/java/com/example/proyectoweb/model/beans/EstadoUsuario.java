package com.example.proyectoweb.model.beans;

import java.sql.Blob;
import java.sql.Date;
import java.sql.Time;

public class EstadoUsuario {
    private String idEstadoUsuario;
    private String nombre;
    public EstadoUsuario(String idEstadoUsuario, String nombre) {
        this.idEstadoUsuario = idEstadoUsuario;
        this.nombre = nombre;

    }
}

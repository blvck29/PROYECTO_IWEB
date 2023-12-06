package com.example.proyectoweb.model.beans;

import java.sql.Blob;
import java.sql.Date;
import java.sql.Time;
import java.sql.*;
public class Rol {
    private String idRol;
    private String nombre;
    public Rol(String idRol, String nombre) {
        this.idRol = idRol;
        this.nombre = nombre;
    }
}

package com.example.proyectoweb.model.beans;

import java.sql.Blob;
import java.sql.Date;
import java.sql.Time;

public class Donaciones {
    private int idRegistro_Donaciones;
    private int idUsuario;
    private Blob comprobante;
    private double monto;
    private boolean comprobado;
    public Donaciones(int idRegistro_Donaciones, int idUsuario, Blob comprobante, double monto, boolean comprobado) {
        this.idRegistro_Donaciones=idRegistro_Donaciones;
        this.idUsuario=idUsuario;
        this.comprobante=comprobante;
        this.monto=monto;
        this.comprobante=comprobante;
    }
}

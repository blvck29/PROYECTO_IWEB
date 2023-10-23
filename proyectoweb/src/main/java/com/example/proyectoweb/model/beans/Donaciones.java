package com.example.proyectoweb.model.beans;

import java.sql.Blob;

public class Donaciones {
    private int idRegistro_Donaciones;
    private int idUsuario;
    private Blob comprobante;
    private double monto;
    private boolean comprobado;


    public int getIdRegistro_Donaciones() {
        return idRegistro_Donaciones;
    }

    public void setIdRegistro_Donaciones(int idRegistro_Donaciones) {
        this.idRegistro_Donaciones = idRegistro_Donaciones;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Blob getComprobante() {
        return comprobante;
    }

    public void setComprobante(Blob comprobante) {
        this.comprobante = comprobante;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public boolean isComprobado() {
        return comprobado;
    }

    public void setComprobado(boolean comprobado) {
        this.comprobado = comprobado;
    }
}

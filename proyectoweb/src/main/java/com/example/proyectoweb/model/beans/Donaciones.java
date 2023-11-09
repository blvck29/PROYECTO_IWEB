package com.example.proyectoweb.model.beans;

import com.mysql.cj.jdbc.Blob;

public class Donaciones {
    private int idUsuario;
    private int idDonaciones;
    private String nombres;
    private String apellidos;
    private Blob comprobante;
    private double monto;
    private boolean comprobado;
    private String idRolAcademico;

    private String fechaDonacion;

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdDonaciones() {
        return idDonaciones;
    }

    public void setIdDonaciones(int idDonaciones) {
        this.idDonaciones = idDonaciones;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
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

    public String getFechaDonacion() {
        return fechaDonacion;
    }

    public void setFechaDonacion(String fechaDonacion) {
        this.fechaDonacion = fechaDonacion;
    }

    public String getIdRolAcademico() {
        return idRolAcademico;
    }

    public void setIdRolAcademico(String idRolAcademico) {
        this.idRolAcademico = idRolAcademico;
    }
}

package com.example.proyectoweb.model.Dtos;

public class DonacionUserDto {
    private String nombre;
    private String apellido;
    private String codigo;
    private Double montoTotal;
    private int cantidadDonaciones;
    private int kitTeleco;
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Double getMontoTotal() {
        return montoTotal;
    }

    public void setMontoTotal(Double montoTotal) {
        this.montoTotal = montoTotal;
    }

    public int getCantidadDonaciones() {
        return cantidadDonaciones;
    }

    public void setCantidadDonaciones(int cantidadDonaciones) {
        this.cantidadDonaciones = cantidadDonaciones;
    }

    public int getKitTeleco() {
        return kitTeleco;
    }

    public void setKitTeleco(int kitTeleco) {
        this.kitTeleco = kitTeleco;
    }
}

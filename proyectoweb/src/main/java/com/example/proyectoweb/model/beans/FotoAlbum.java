package com.example.proyectoweb.model.beans;

import java.io.InputStream;
import java.sql.Blob;

public class FotoAlbum {
    public FotoAlbum(int idFoto, int idEvento, InputStream foto, String descricipcion) {
        this.idFoto = idFoto;
        this.idEvento = idEvento;
        Foto = foto;
        Descricipcion = descricipcion;
    }

    private int idFoto;
    private int idEvento;
    private InputStream Foto;
    private String Descricipcion;

    public int getIdFoto() {
        return idFoto;
    }

    public void setIdFoto(int idFoto) {
        this.idFoto = idFoto;
    }

    public int getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(int idEvento) {
        this.idEvento = idEvento;
    }

    public InputStream getFoto() {
        return Foto;
    }

    public void setFoto(InputStream foto) {
        Foto = foto;
    }

    public String getDescricipcion() {
        return Descricipcion;
    }

    public void setDescricipcion(String descricipcion) {
        Descricipcion = descricipcion;
    }




}

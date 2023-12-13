package com.example.proyectoweb.model.beans;

import java.io.InputStream;

public class FotoAlbum {
    public FotoAlbum(int idFoto, int idEvento, InputStream foto) {
        this.idFoto = idFoto;
        this.idEvento = idEvento;
        Foto = foto;
    }

    private int idFoto;
    private int idEvento;
    private InputStream Foto;


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






}

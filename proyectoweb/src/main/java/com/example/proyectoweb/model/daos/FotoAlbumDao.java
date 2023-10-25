package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.beans.Donaciones;
import com.example.proyectoweb.model.beans.FotoAlbum;

import java.sql.*;
import java.util.ArrayList;

public class FotoAlbumDao {
    public ArrayList<FotoAlbum> listar(){
        ArrayList<FotoAlbum> listaFotos = new ArrayList<>();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/proyectoweb";
        String user = "root";
        String pass = "root";
        String sql = "select * from fotos_album";

        try(Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();){

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                FotoAlbum fotoAlbum = new FotoAlbum();
                fotoAlbum.setIdFoto(rs.getInt(1));
                fotoAlbum.setIdEvento(rs.getInt(2));
                fotoAlbum.setFoto(rs.getBlob(3));
                fotoAlbum.setDescripccion(rs.getString(4));
                listaFotos.add(fotoAlbum);
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        return listaFotos;
    }
}

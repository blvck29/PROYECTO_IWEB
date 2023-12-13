package com.example.proyectoweb.model.daos;
import com.example.proyectoweb.model.beans.FotoAlbum;
import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.beans.Imagen;

import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlbumDao extends DaoBase{

    public void listarImagenPorFotoDeAlbum(HttpServletResponse response, String IdFoto, Integer numero) {

        //Conexión a la DB

        String sql = "SELECT * FROM fotos_album WHERE IdFoto\n = ?";
        response.setContentType("image/*");

        try (
                Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, IdFoto);

            try (
                    ResultSet rs = pstmt.executeQuery();
                    InputStream is = (rs.next()) ? rs.getBinaryStream(numero) : null;
                    OutputStream os = response.getOutputStream();
                    BufferedInputStream bis = new BufferedInputStream(is);
                    BufferedOutputStream bos = new BufferedOutputStream(os);
            ) {

                int i;
                while ((i = bis.read()) != -1) {
                    bos.write(i);
                }

            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<FotoAlbum> listarfotosDeAlbum (String idEvento){ //user

        //Conexión a la DB

        String sql = "SELECT * FROM fotos_album WHERE idEvento = ?";

        ArrayList<FotoAlbum> listaFotosDeAlbum = new ArrayList<>();

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1,idEvento);

            try(ResultSet rs = pstmt.executeQuery()){

                while (rs.next()){
                    FotoAlbum fotoAlbum = new FotoAlbum(rs.getInt(1),rs.getInt(2),rs.getBinaryStream(3));

                    listaFotosDeAlbum.add(fotoAlbum);

                }
            }
        }catch(SQLException e){
            System.out.println("Error contando las fotos");
            throw new RuntimeException(e);
        }
        return listaFotosDeAlbum;
    }


    public ArrayList<Integer> idFotosAlbum (String idEvento){ //user

        ArrayList<Integer> list = new ArrayList<>();

        String sql = "SELECT * FROM fotos_album WHERE idEvento = ?";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1,idEvento);

            try(ResultSet rs = pstmt.executeQuery()){

                while (rs.next()){

                    list.add(rs.getInt(1));

                }
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return list;
    }


    public void listarImagenesAlbum(HttpServletResponse response, String idImagen) {

        //Conexión a la DB

        String sql = "SELECT * FROM fotos_album WHERE IdFoto = ?";
        response.setContentType("image/*");

        try (
                Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, idImagen);

            try (
                    ResultSet rs = pstmt.executeQuery();
                    InputStream is = (rs.next()) ? rs.getBinaryStream(3) : null;
                    OutputStream os = response.getOutputStream();
                    BufferedInputStream bis = new BufferedInputStream(is);
                    BufferedOutputStream bos = new BufferedOutputStream(os)
            ) {
                int i;
                while ((i = bis.read()) != -1) {
                    bos.write(i);
                }
            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }



}
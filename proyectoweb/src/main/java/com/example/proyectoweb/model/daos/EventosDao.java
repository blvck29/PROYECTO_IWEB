package com.example.proyectoweb.model.daos;
import com.example.proyectoweb.model.beans.Evento;

import java.sql.*;
import java.util.ArrayList;

public class EventosDao extends DaoBase{

    // PARA LISTAR LOS EVENTOS
    public ArrayList<Evento> listarEventos (){ //admin

        //Conexión a la DB

        String sql = "select * from evento";

        ArrayList<Evento> listaEventos = new ArrayList();

        try(Connection conn = getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()){
                Evento evento = new Evento();
                evento.setIdEvento(rs.getInt(1));
                evento.setTitulo(rs.getString(2));
                evento.setSubTitulo(rs.getString(3));
                evento.setHora(rs.getTime(4));
                evento.setFecha(rs.getDate(5));
                evento.setLugar(rs.getString(6));
                evento.setImagen(rs.getBlob(7));
                evento.setDescripcion(rs.getString(8));
                evento.setIdEstado(rs.getString(9));
                evento.setIdEvento(rs.getInt(10));
                listaEventos.add(evento);
            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

        return listaEventos;
    }


    // PARA BUSCAR CON EL BUSCADOR
    public ArrayList<Evento> buscarXnombreEid(String palabraintroducida){ //para buscar eventos

        ArrayList<Evento> listaEventos = new ArrayList();
        //Conexión a la DB

        // ------IMPORTANTE ---- QUIZA SE DEBA MODIFICAR EL FROM PROYECTOWEB.EVENT, SOLO SE HIZO PARA QUE FUNCIONE EN
        //LOCAL LA BD
        String sql = "select * from proyectoweb.evento where lower(titulo) like ? or idEvento like ?";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, palabraintroducida + "%");
            pstmt.setString(2,palabraintroducida + "%");


            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    Evento evento = new Evento();

                    evento.setIdEvento(rs.getInt(1));
                    evento.setTitulo(rs.getString(2));
                    evento.setSubTitulo(rs.getString(3));
                    evento.setHora(rs.getTime(4));
                    evento.setFecha(rs.getDate(5));
                    evento.setLugar(rs.getString(6));
                    evento.setImagen(rs.getBlob(7));
                    evento.setDescripcion(rs.getString(8));
                    evento.setIdEstado(rs.getString(9));
                    evento.setIdEvento(rs.getInt(10));




                    listaEventos.add(evento);

                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listaEventos;

    }
    // ELIMINAR EVENTO
    public void eliminarEvento(String idEvento){

        String sql ="delete from proyectoweb.evento where idEvento = ?";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1,Integer.parseInt(idEvento));
            pstmt.executeUpdate();


            // esto que le pongo un setint porque ese es el tipo ed casillero que lo requiere si hay error mirar aqui

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }



    // CREAR EVENTO

    public void crearEvento(int idEvento, String titulo, String subTitulo,Time hora, Date fecha, String Lugar , Blob imagen, String descripcion, String idEstado,String idActividad){

        String sql = "INSERT INTO evento (idevento, titulo, SubTitulo, hora, fecha, Lugar, imagen, descripcion, idEstado, idActividad) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setInt(1, idEvento);
            pstmt.setString(2, titulo);
            pstmt.setString(3, subTitulo);
            pstmt.setTime(4, hora);
            pstmt.setDate(5, fecha);
            pstmt.setString(6, Lugar);
            pstmt.setBlob(7, imagen);
            pstmt.setString(8, descripcion);
            pstmt.setString(9, idEstado);
            pstmt.setString(10, idActividad);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    // EDITAR EVENTO
    public void editarEvento(int idEvento, String titulo, String subTitulo, Time hora, Date fecha, String lugar, Blob imagen, String descripcion, String idEstado, String idActividad) {
        String sql = "UPDATE evento SET titulo = ?, SubTitulo = ?, hora = ?, fecha = ?, Lugar = ?, imagen = ?, descripcion = ?, idEstado = ?, idActividad = ? WHERE idevento = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, titulo);
            pstmt.setString(2, subTitulo);
            pstmt.setTime(3, hora);
            pstmt.setDate(4, fecha);
            pstmt.setString(5, lugar);
            pstmt.setBlob(6, imagen);
            pstmt.setString(7, descripcion);
            pstmt.setString(8, idEstado);
            pstmt.setString(9, idActividad);
            pstmt.setInt(10, idEvento);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}

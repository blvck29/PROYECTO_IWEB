package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.beans.Actividad;
import com.example.proyectoweb.model.beans.DelegadoAct;
import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.beans.Usuario;
import com.sun.jdi.ArrayReference;

import java.sql.*;
import java.util.ArrayList;

public class ActividadesDao extends DaoBase{


    public ArrayList<Actividad> getListaActividades(){

        String sql = "select * from actividad";

        ArrayList<Actividad> listaActividades = new ArrayList<>();

        try (Connection conn = getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()){
                Actividad actividad = new Actividad(rs.getString(1), rs.getString(2), rs.getBlob(3), rs.getBlob(4), rs.getInt(5));
                listaActividades.add(actividad);
            }

        } catch(SQLException e){
            throw new RuntimeException(e);
        }

        return listaActividades;
    }



    public ArrayList<DelegadoAct> listarNombresEncargadosAct(){


        //Conexión a la DB

        String sql = "SELECT ac.titulo, idEncargado, u.nombres, u.apellidos, u.codigo\n" +
                "FROM actividad ac\n" +
                "\n" +
                "\tINNER JOIN usuarios u on (u.idUsuario = ac.idEncargado);";

        ArrayList<DelegadoAct> listaEncargados = new ArrayList<>();

        try(Connection conn = getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){

                DelegadoAct delegadoAct = new DelegadoAct();

                delegadoAct.setTituloActividad(rs.getString(1));
                delegadoAct.setIdEncargado(rs.getInt(2));
                delegadoAct.setNombre(rs.getString(3));
                delegadoAct.setApellido(rs.getString(4));
                delegadoAct.setCodigo(rs.getString(5));

                listaEncargados.add(delegadoAct);


            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return listaEncargados;
    }

    public ArrayList<DelegadoAct> filtrarXTitulo (String tituloActividad){

        DelegadoAct actividad = null;
        ArrayList<DelegadoAct> listaActividades = new ArrayList<>();

        // Conexión a DB
        String sql = "SELECT ac.titulo, idEncargado, u.nombres, u.apellidos, u.codigo\n" +
                "FROM actividad ac\n" +
                "INNER JOIN usuarios u on (u.idUsuario = ac.idEncargado)\n" +
                "where lower(ac.titulo) like ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, tituloActividad + "%");


            try(ResultSet rs = pstmt.executeQuery()){


                while(rs.next()){

                    actividad = new DelegadoAct();
                    actividad.setTituloActividad(rs.getString(1));
                    actividad.setNombre(rs.getString(3));
                    actividad.setApellido(rs.getString(4));
                    actividad.setCodigo(rs.getString(5));

                    listaActividades.add(actividad);
                }
            }

        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listaActividades;
    }



    public void crearActividad(String idActividad, String tituloAct, Integer idDelegado){

        String sql = "insert into actividad (idActividad,titulo,idEncargado) values (?,?,?)";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, idActividad);
            pstmt.setString(2, tituloAct);
            pstmt.setInt(3, idDelegado);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    public Actividad buscarPorIdActividad(String idActividad){

        Actividad actividad = null;
        String sql = "select * from actividad where idActividad = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, idActividad);


            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    actividad = new Actividad(rs.getString(1), rs.getString(2), rs.getBlob(3), rs.getBlob(4), rs.getInt(5));
                }
            }

        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return actividad;
    }

    public DelegadoAct buscarPorTitulo(String tituloActividad){

        DelegadoAct actividad = null;

        // Conexión a DB
        String sql = "SELECT ac.titulo, idEncargado, u.nombres, u.apellidos, u.codigo\n" +
                "FROM actividad ac\n" +
                "INNER JOIN usuarios u on (u.idUsuario = ac.idEncargado)\n" +
                "where titulo = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, tituloActividad);

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){
                    actividad = new DelegadoAct();
                    actividad.setTituloActividad(rs.getString(1));
                    actividad.setIdEncargado(rs.getInt(2));
                    actividad.setNombre(rs.getString(3));
                    actividad.setApellido(rs.getString(4));
                    actividad.setCodigo(rs.getString(5));
                }
            }

        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return actividad;
    }


    public Actividad buscarPorIdDelegado(Integer idDelegado){

        Actividad actividad = null;

        String sql = "select * from actividad where idEncargado = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setInt(1, idDelegado);

            try(ResultSet rs = pstmt.executeQuery()){
                while(rs.next()){
                    actividad = new Actividad(rs.getString(1), rs.getString(2), rs.getBlob(3), rs.getBlob(4), rs.getInt(5));
                }
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return actividad;
    }


    public void actualizarActividad(String idActividad, Integer idDelegado){

        String sql = "update actividad set idEncargado = ? where idActividad = ?";

        try(Connection connection = getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setInt(1, idDelegado);
            pstmt.setString(2,idActividad);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void eliminarActividad(String idActividad){

        String sql = "delete from actividad where idActividad = ?";

        try(Connection connection = getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1, idActividad);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
}

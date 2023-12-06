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
                Actividad actividad = new Actividad();
                actividad.setIdActividad(rs.getString(1));
                actividad.setTitulo(rs.getString(2));
                actividad.setBanner(rs.getBlob(3));
                actividad.setMiniatura(rs.getBlob(4));
                actividad.setIdEncargado(rs.getInt(5));
                listaActividades.add(actividad);
            }

        } catch(SQLException e){
            throw new RuntimeException(e);
        }

        return listaActividades;
    }

    public Actividad getActividadByIdUsuario(int idUsuario){

        Actividad actividad = new Actividad();
        String sql = "select * from actividad a\n" +
                "left join usuarios u on (a.idEncargado = u.idUsuario) where idUsuario = ?;";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, String.valueOf(idUsuario));

            try(ResultSet rs = pstmt.executeQuery()){

                while (rs.next()){
                    actividad.setIdActividad(rs.getString(1));
                    actividad.setTitulo(rs.getString(2));
                    actividad.setBanner(rs.getBlob(3));
                    actividad.setMiniatura(rs.getBlob(4));
                    actividad.setIdEncargado(rs.getInt(5));

                    Usuario delegadoact = new Usuario();
                    delegadoact.setNombres(rs.getString(9));
                    actividad.setDelegado(delegadoact);

                }
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return actividad;
    }

    public ArrayList<Actividad> listarActividadesConDelegado(){
        ArrayList<Actividad> lista = new ArrayList<>();

        //Conexión a la DB

        String sql = "SELECT ac.*, u.*\n" +
                "FROM actividad ac\n" +
                " INNER JOIN usuarios u on (u.idUsuario = ac.idEncargado);";



        try(Connection conn = getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){

                Actividad actividad= new Actividad();

                actividad.setIdActividad(rs.getString(1));
                actividad.setTitulo(rs.getString(2));
                actividad.setBanner(rs.getBlob(3));
                actividad.setMiniatura(rs.getBlob(4));
                actividad.setIdEncargado(rs.getInt(5));

                Usuario delegado = new Usuario();
                delegado.setIdUsuario(rs.getInt(6));
                delegado.setIdRolSistema(rs.getString(7));
                delegado.setIdEstado(rs.getString(8));
                delegado.setNombres(rs.getString(9));
                delegado.setApellidos(rs.getString(10));
                delegado.setCodigo(rs.getString(11));
                delegado.setCorreo(rs.getString(12));
                // Sin contraseña por seguridad.
                delegado.setFechaCreacion(rs.getString(14));
                delegado.setCantEventsInscrito(rs.getString(15));
                delegado.setIdRolAcademico(rs.getString(16));
                delegado.setKitTeleco(rs.getInt(17));

                actividad.setDelegado(delegado);

                lista.add(actividad);


            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return lista;
    }

    public ArrayList<Actividad> filtrarXTitulo (String tituloActividad){

        ArrayList<Actividad> lista = new ArrayList<>();

        // Conexión a DB
        String sql = "SELECT ac.*, u.*\n" +
                "FROM actividad ac\n" +
                " INNER JOIN usuarios u on (u.idUsuario = ac.idEncargado)\n" +
                " where lower(ac.titulo) like ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, tituloActividad + "%");


            try(ResultSet rs = pstmt.executeQuery()){


                while(rs.next()){

                    Actividad actividad= new Actividad();

                    actividad.setIdActividad(rs.getString(1));
                    actividad.setTitulo(rs.getString(2));
                    actividad.setBanner(rs.getBlob(3));
                    actividad.setMiniatura(rs.getBlob(4));
                    actividad.setIdEncargado(rs.getInt(5));

                    Usuario delegado = new Usuario();
                    delegado.setIdUsuario(rs.getInt(6));
                    delegado.setIdRolSistema(rs.getString(7));
                    delegado.setIdEstado(rs.getString(8));
                    delegado.setNombres(rs.getString(9));
                    delegado.setApellidos(rs.getString(10));
                    delegado.setCodigo(rs.getString(11));
                    delegado.setCorreo(rs.getString(12));
                    // Sin contraseña por seguridad.
                    delegado.setFechaCreacion(rs.getString(14));
                    delegado.setCantEventsInscrito(rs.getString(15));
                    delegado.setIdRolAcademico(rs.getString(16));
                    delegado.setKitTeleco(rs.getInt(17));

                    actividad.setDelegado(delegado);

                    lista.add(actividad);
                }
            }

        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return lista;
    }


    public Actividad buscarPorTitulo(String idActividad){

        Actividad actividad = null;

        // Conexión a DB
        String sql = "SELECT ac.*, u.*\n" +
                "FROM actividad ac\n" +
                "INNER JOIN usuarios u on (u.idUsuario = ac.idEncargado)\n" +
                "where idActividad = ? ";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, idActividad);

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){
                    actividad= new Actividad();

                    actividad.setIdActividad(rs.getString(1));
                    actividad.setTitulo(rs.getString(2));
                    actividad.setBanner(rs.getBlob(3));
                    actividad.setMiniatura(rs.getBlob(4));
                    actividad.setIdEncargado(rs.getInt(5));

                    Usuario delegado = new Usuario();
                    delegado.setIdUsuario(rs.getInt(6));
                    delegado.setIdRolSistema(rs.getString(7));
                    delegado.setIdEstado(rs.getString(8));
                    delegado.setNombres(rs.getString(9));
                    delegado.setApellidos(rs.getString(10));
                    delegado.setCodigo(rs.getString(11));
                    delegado.setCorreo(rs.getString(12));
                    // Sin contraseña por seguridad.
                    delegado.setFechaCreacion(rs.getString(14));
                    delegado.setCantEventsInscrito(rs.getString(15));
                    delegado.setIdRolAcademico(rs.getString(16));
                    delegado.setKitTeleco(rs.getInt(17));

                    actividad.setDelegado(delegado);

                }
            }

        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return actividad;
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

    public void eliminarActividad(String idActividad) throws SQLIntegrityConstraintViolationException{

        String sql = "delete from actividad where idActividad = ?";

        try(Connection connection = getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1, idActividad);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new SQLIntegrityConstraintViolationException(e);
        }
    }

    public ArrayList<Actividad> listarActividadesConPaginacion(Integer offset){ //admin: Actividades
        ArrayList<Actividad> listaActividades = new ArrayList<>();

        String sql = "SELECT ac.*, u.*\n" +
                "FROM actividad ac\n" +
                " INNER JOIN usuarios u on (u.idUsuario = ac.idEncargado) limit 8 offset ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setInt(1,  offset);

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    Actividad actividad = new Actividad();

                    actividad.setTitulo(rs.getString("titulo"));

                    Usuario delegadoAct = new Usuario();

                    delegadoAct.setCodigo(rs.getString(11));
                    delegadoAct.setNombres(rs.getString(9));
                    delegadoAct.setApellidos(rs.getString(10));
                    actividad.setDelegado(delegadoAct);
                    listaActividades.add(actividad);

                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listaActividades;
    }
    
}

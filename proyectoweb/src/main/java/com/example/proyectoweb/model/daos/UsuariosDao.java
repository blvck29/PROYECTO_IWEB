package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.SHA256;
import com.example.proyectoweb.model.beans.Usuario;

import java.net.ConnectException;
import java.sql.*;
import java.util.ArrayList;

public class UsuariosDao extends DaoBase{

    public ArrayList<Usuario> listarTodosUsuarios (){ //admin

        //Conexión a la DB
        String sql = "select * from usuarios where idEstado != 'PEN' ";

        ArrayList<Usuario> listaUsuarios = new ArrayList<>();

        try(Connection conn = getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){

                Usuario usuario = new Usuario();

                usuario.setIdUsuario(rs.getInt(1));
                usuario.setIdRolSistema(rs.getString(2));
                usuario.setIdEstado(rs.getString(3));
                usuario.setNombres(rs.getString(4));
                usuario.setApellidos(rs.getString(5));
                usuario.setCodigo(rs.getString(6));
                usuario.setCorreo(rs.getString(7));
                // Sin contraseña por seguridad.
                usuario.setFechaCreacion(rs.getString(9));
                usuario.setCantEventsInscrito(rs.getString(10));
                usuario.setIdRolAcademico(rs.getString(11));
                usuario.setKitTeleco(rs.getInt(12));

                listaUsuarios.add(usuario);


            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

        return listaUsuarios;
    }


    public ArrayList<Usuario> buscarXnombreYcodigo(String palabraintroducida){ //admin

        ArrayList<Usuario> listaUsuarios = new ArrayList();
        //Conexión a la DB

        String sql = "select * from usuarios where idEstado != 'PEN' and (lower(nombres) like ? or codigo like ?) ";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

             pstmt.setString(1, palabraintroducida + "%");
             pstmt.setString(2,palabraintroducida + "%");


            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    Usuario usuario = new Usuario();

                    usuario.setIdUsuario(rs.getInt(1));
                    usuario.setIdRolSistema(rs.getString(2));
                    usuario.setIdEstado(rs.getString(3));
                    usuario.setNombres(rs.getString(4));
                    usuario.setApellidos(rs.getString(5));
                    usuario.setCodigo(rs.getString(6));
                    usuario.setCorreo(rs.getString(7));
                    // Sin contraseña por seguridad.
                    usuario.setFechaCreacion(rs.getString(9));
                    usuario.setCantEventsInscrito(rs.getString(10));
                    usuario.setIdRolAcademico(rs.getString(11));
                    usuario.setKitTeleco(rs.getInt(12));


                    listaUsuarios.add(usuario);

                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listaUsuarios;

    }


    public Usuario buscarXcodigo(String codigo){ //admin

        Usuario usuario = null;

        //Conexión a la DB

        String sql = "select * from usuarios where codigo =? and idEstado != 'PEN'";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, codigo);


            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    usuario = new Usuario();

                    usuario.setIdUsuario(rs.getInt(1));
                    usuario.setIdRolSistema(rs.getString(2));
                    usuario.setIdEstado(rs.getString(3));
                    usuario.setNombres(rs.getString(4));
                    usuario.setApellidos(rs.getString(5));
                    usuario.setCodigo(rs.getString(6));
                    usuario.setCorreo(rs.getString(7));
                    // Sin contraseña por seguridad.
                    usuario.setFechaCreacion(rs.getString(9));
                    usuario.setCantEventsInscrito(rs.getString(10));
                    usuario.setIdRolAcademico(rs.getString(11));
                    usuario.setKitTeleco(rs.getInt(12));

                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return usuario;

    }



    // Aldoradin: hago esta funcion para poder identificar el usuario en la tabla de apoyos
    public Usuario buscarXid(int idUsuario){ //admin

        Usuario usuario = null;

        //Conexión a la DB
        String sql = "select * from usuarios where idUsuario =? and idEstado != 'PEN'";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setInt(1, idUsuario);


            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    usuario = new Usuario();
                    usuario.setIdUsuario(rs.getInt(1));
                    usuario.setIdRolSistema(rs.getString(2));
                    usuario.setIdEstado(rs.getString(3));
                    usuario.setNombres(rs.getString(4));
                    usuario.setApellidos(rs.getString(5));
                    usuario.setCodigo(rs.getString(6));
                    usuario.setCorreo(rs.getString(7));
                    // Sin contraseña por seguridad.
                    usuario.setFechaCreacion(rs.getString(9));
                    usuario.setCantEventsInscrito(rs.getString(10));
                    usuario.setIdRolAcademico(rs.getString(11));
                    usuario.setKitTeleco(rs.getInt(12));

                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return usuario;
    }



public ArrayList<Usuario> listarDelegadosActDisponibles(){
        ArrayList<Usuario> listaUsuarios = new ArrayList<>();

        String sql = "select * from usuarios where idEstado ='ACC' and idRolSistema != 'DELGEN' and idRolSistema != 'DELACT' ";

        try(Connection conn = getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql)) {

            while(rs.next()){

                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt(1));
                usuario.setIdRolSistema(rs.getString(2));
                usuario.setIdEstado(rs.getString(3));
                usuario.setNombres(rs.getString(4));
                usuario.setApellidos(rs.getString(5));
                usuario.setCodigo(rs.getString(6));
                usuario.setCorreo(rs.getString(7));
                // Sin contraseña por seguridad.
                usuario.setFechaCreacion(rs.getString(9));
                usuario.setCantEventsInscrito(rs.getString(10));
                usuario.setIdRolAcademico(rs.getString(11));
                usuario.setKitTeleco(rs.getInt(12));

                listaUsuarios.add(usuario);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return  listaUsuarios;
}



    public ArrayList<Usuario> listarPorEstado(String estado){
            ArrayList<Usuario> listaUsuarios = new ArrayList<>();

            String sql = "select * from usuarios where idEstado = ?";


            try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql) ) {

                pstmt.setString(1,estado);

                try(ResultSet rs = pstmt.executeQuery()){

                    while (rs.next()){
                        Usuario usuario = new Usuario();

                        usuario.setIdUsuario(rs.getInt(1));
                        usuario.setIdRolSistema(rs.getString(2));
                        usuario.setIdEstado(rs.getString(3));
                        usuario.setNombres(rs.getString(4));
                        usuario.setApellidos(rs.getString(5));
                        usuario.setCodigo(rs.getString(6));
                        usuario.setCorreo(rs.getString(7));
                        // Sin contraseña por seguridad.
                        usuario.setFechaCreacion(rs.getString(9));
                        usuario.setCantEventsInscrito(rs.getString(10));
                        usuario.setIdRolAcademico(rs.getString(11));
                        usuario.setKitTeleco(rs.getInt(12));


                        listaUsuarios.add(usuario);
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        return listaUsuarios;
    }

    public boolean verificarCorreo(String email){

        ArrayList<String> listaCorreos = new ArrayList<>();

        String sql = "SELECT correo_pucp FROM proyectoweb.usuarios where correo_pucp = ?;";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,email);

            try(ResultSet rs = pstmt.executeQuery()){

                while (rs.next()){
                    listaCorreos.add(rs.getString(1));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaCorreos.isEmpty();
    }

    public void token(String token, String email){

    }


    public void crearUsuario(String names, String lastnames, int codigo, String email, boolean isEgresado, String passwordStr){

        String sql = "INSERT INTO `proyectoweb`.`usuarios` (`idRolSistema`, `idEstado`, `nombres`, `apellidos`, `codigo`, `correo_pucp`, `contrasena`, `idRolAcademico`) VALUES ('USER', 'PEN', ?, ?, ?, ?, ?, ?);";

        String passworHash = SHA256.cipherPassword(passwordStr);

        String cond = "UNSET";

        if(isEgresado){
            cond = "GRADUAT";
        } else {
            cond = "STUDENT";
        }

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,names);
            pstmt.setString(2, lastnames);
            pstmt.setString(3, String.valueOf(codigo));
            pstmt.setString(4, email);
            pstmt.setString(5,passworHash);
            pstmt.setString(6, cond);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void editarEstadoUsuario(String idUsuario, String nuevoEstado){

        String sql = "update usuarios set idEstado = ? where idUsuario = ?";

        try(Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,nuevoEstado);
            pstmt.setString(2, idUsuario);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void eliminarUsuario(String idUsuario){

        String sql ="delete from usuarios where idUsuario = ?";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,idUsuario);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public void actualizarRolSistema(String idUsuario, String nuevoRol){


        String sql ="update usuarios set idRolSistema= ? where idUsuario = ? ";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,nuevoRol);
            pstmt.setString(2,idUsuario);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }




    }




}

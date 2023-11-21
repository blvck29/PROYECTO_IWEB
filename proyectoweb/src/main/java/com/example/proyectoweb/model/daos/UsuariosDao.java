package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.SHA256;
import com.example.proyectoweb.model.beans.Usuario;

import java.net.ConnectException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class UsuariosDao extends DaoBase{


    public boolean login(String mail, String passwd){

        boolean valido = false;
        passwd = SHA256.cipherPassword(passwd);

        String sql = "SELECT u.correo_pucp, u.contrasena FROM usuarios u WHERE u.correo_pucp = ? AND u.contrasena = ? AND u.idEstado = 'ACC';";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, mail);
            pstmt.setString(2, passwd);

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){
                    String mailDB = rs.getString(1);
                    String passwdDB = rs.getString(2);

                    if (mailDB == null || passwdDB == null){
                        valido = false;
                    } else if (mailDB.equals(mail) && passwdDB.equals(passwd)){
                        valido = true;
                    }
                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return valido;
    }


    public Usuario usuarioByEmail(String correoPucp){

        Usuario usuario = new Usuario();
        //Conexión a la DB
        String sql = "select * from usuarios where correo_pucp = ? and idEstado = 'ACC';";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, correoPucp);


            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

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

    public ArrayList<Usuario> listarUsuariosConPaginacion(Integer limit, Integer offset){ //admin
        ArrayList<Usuario> listaUsuarios = new ArrayList<>();

        //Conexión a la DB
        String sql = "SELECT * FROM usuarios where idEstado != 'PEN' limit ? offset ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

              pstmt.setInt(1,  limit);
            pstmt.setInt(2,  offset);

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


    public ArrayList<Usuario> listarPorEstadoPaginacion(String estado, Integer limit, Integer offset){
        ArrayList<Usuario> listaUsuarios = new ArrayList<>();

        String sql = "select * from usuarios where idEstado = ? limit ? offset ?";


        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql) ) {

            pstmt.setString(1,estado);
            pstmt.setInt(2,limit);
            pstmt.setInt(3,offset);

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

    public String verificarCorreo(String email){

        String correo = null;

        String sql = "SELECT correo_pucp FROM proyectoweb.usuarios where correo_pucp = ?;";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,email);

            try(ResultSet rs = pstmt.executeQuery()){

                while (rs.next()){
                    correo = rs.getString(1);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return correo;
    }


    public String verificarCodigo(String codigo){

        String code = null;

        String sql = "SELECT codigo FROM proyectoweb.usuarios where codigo = ?;";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,codigo);

            try(ResultSet rs = pstmt.executeQuery()){

                while (rs.next()){
                    code = rs.getString(1);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return code;
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


    public int contarEstudiantes() {
        int totalEstudiantes = 0;
        String sql = "SELECT COUNT(*) AS total_estudiantes FROM usuarios WHERE idRolAcademico = 'STUDENT'";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                totalEstudiantes = rs.getInt("total_estudiantes");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return totalEstudiantes;
    }

    public int contargraduados() {
        int total_graduados = 0;
        String sql = "SELECT COUNT(*) AS total_graduados FROM usuarios WHERE idRolAcademico = 'GRADUAT'";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                total_graduados = rs.getInt("total_graduados");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return total_graduados;
    }

    public ArrayList<Integer> contarRolesxActividad(String idActividad) {
        ArrayList<Integer> counts = new ArrayList<>();

        String sql = "SELECT COUNT(CASE WHEN i.idRol = 'Barra' THEN 1 END) AS countBarra, " +
                "       COUNT(CASE WHEN i.idRol = 'Member' THEN 1 END) AS countMember " +
                "FROM proyectoweb.evento e " +
                "INNER JOIN proyectoweb.actividad a ON e.idActividad = a.idActividad " +
                "INNER JOIN proyectoweb.inscripcion i ON e.idEvento = i.idEvento " +
                "WHERE a.idActividad = ? AND e.idEstado = 'PUBLIC'";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, idActividad);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    counts.add(rs.getInt("countBarra"));
                    counts.add(rs.getInt("countMember"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return counts;
    }

    public ArrayList<ArrayList<Integer>> contarRolesTodasActividades() {
        ArrayList<ArrayList<Integer>> countsList = new ArrayList<>();

        String actividadesQuery = "SELECT idActividad FROM actividad ORDER BY idActividad ASC";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet actividadesResult = stmt.executeQuery(actividadesQuery)) {

            while (actividadesResult.next()) {
                String actividadId = actividadesResult.getString("idActividad");
                ArrayList<Integer> counts = contarRolesxActividad(actividadId);
                countsList.add(counts);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return countsList;
    }

    public ArrayList<String> obtenerNombresActividades() {
        ArrayList<String> nombresActividades = new ArrayList<>();
        String sql = "SELECT titulo FROM actividad ORDER BY idActividad ASC";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                String nombreActividad = rs.getString("titulo");
                nombresActividades.add(nombreActividad);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return nombresActividades;
    }







}

package com.example.proyectoweb.model.daos;
import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.beans.Imagen;
import com.example.proyectoweb.model.beans.Inscripcion;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
//import org.apache.http.io.BufferInfo;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;

public class EventosDao extends DaoBase{

    // PARA LISTAR LOS EVENTOS
    public ArrayList<Evento> listarEventos (){ //admin

        //Conexión a la DB

        String sql = "select * from evento";

        ArrayList<Evento> listaEventos = new ArrayList<>();

        try(Connection conn = getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()){
                Evento evento = new Evento(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getTime(4),rs.getDate(5),rs.getString(6),rs.getBinaryStream(7),rs.getString(8),rs.getString(9),rs.getString(10));
                listaEventos.add(evento);
            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

        return listaEventos;
    }


    public void listarImagenPorEvento(HttpServletResponse response, String idEvento) {

        //Conexión a la DB

        String sql = "SELECT * FROM evento WHERE idEvento = ?";
        response.setContentType("image/*");

        try (
                Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, idEvento);

            try (
                    ResultSet rs = pstmt.executeQuery();
                    InputStream is = (rs.next()) ? rs.getBinaryStream(7) : null;
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


    public void listarImagen (HttpServletResponse response){ //prueba

        //Conexión a la DB

        String sql = "SELECT * FROM evento where idEvento = 9";


        response.setContentType("image/*");


        try (
                Connection conn = getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                InputStream is = (rs.next()) ? rs.getBinaryStream(7) : null;
                OutputStream os = response.getOutputStream();
                BufferedInputStream bis = new BufferedInputStream(is);
                BufferedOutputStream bos = new BufferedOutputStream(os)
        ) {
            int i;
            while ((i = bis.read()) != -1) {
                bos.write(i);
            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }



    }



    public ArrayList<Inscripcion> listarEventosPropios (String idUser){ //user

        //Conexión a la DB

        String sql = "SELECT i.idRol, ev.idEvento, ev.titulo, ev.subTitulo, ev.hora, ev.fecha, ev.lugar, ev.imagen, ev.descripcion, ev.idEstado, ev.idActividad\n" +
                "FROM evento ev\n" +
                "\tINNER JOIN inscripcion i ON (ev.idEvento = i.idEvento)\n" +
                "WHERE i.Usuario = ?";

        ArrayList<Inscripcion> listarEventosPropios = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, idUser + "%");

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){
                    Inscripcion ins = new Inscripcion(rs.getString(1),rs.getInt(2), rs.getString(3),rs.getString(4),rs.getTime(5),rs.getDate(6),rs.getString(7),rs.getBinaryStream(8),rs.getString(9),rs.getString(10),rs.getString(11));
                    listarEventosPropios.add(ins);
                }
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listarEventosPropios;
    }


    public Evento EventoXid (String idEv){ //user

        //Conexión a la DB

        String sql = "SELECT * FROM evento where idEvento = ?;";

        Evento evento = null;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, idEv + "%");

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){
                    evento = new Evento(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getTime(4),rs.getDate(5),rs.getString(6),rs.getBinaryStream(7),rs.getString(8),rs.getString(9),rs.getString(10));
                }
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return evento;
    }

    public ArrayList<Evento> listarEventosProximos (){ //user

        //Conexión a la DB

        String sql = "SELECT *, concat(fecha,\" \", hora) FROM evento where  concat(fecha,\" \", hora) > now() order by concat(fecha,\" \", hora) asc";

        ArrayList<Evento> listaEventosProx = new ArrayList<>();

        try(Connection conn = getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()){
                Evento evento = new Evento(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getTime(4),rs.getDate(5),rs.getString(6),rs.getBinaryStream(7),rs.getString(8),rs.getString(9),rs.getString(10));
                listaEventosProx.add(evento);
            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

        return listaEventosProx;
    }


    public ArrayList<Evento> listarEventosFinalizados(){ //user

        //Conexión a la DB

        String sql = "SELECT *, concat(fecha,\" \", hora) FROM evento where  concat(fecha,\" \", hora) < now() order by concat(fecha,\" \", hora) asc";

        ArrayList<Evento> listaEventosFin = new ArrayList<>();

        try(Connection conn = getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()){
                Evento evento = new Evento(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getTime(4),rs.getDate(5),rs.getString(6),rs.getBinaryStream(7),rs.getString(8),rs.getString(9),rs.getString(10));
                listaEventosFin.add(evento);
            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

        return listaEventosFin;
    }

    public ArrayList<Evento> listarEventosxActividad (String idActividad) { //user -> FINALIZADOS / PRÓXIMOS

        ArrayList<Evento> listaEventos = new ArrayList<>();
        String sql = "SELECT * FROM evento where idActividad = ? ";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1,idActividad);

            try(ResultSet rs = pstmt.executeQuery()){

                while (rs.next()){
                    Evento evento = new Evento(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getTime(4),rs.getDate(5),rs.getString(6),rs.getBinaryStream(7),rs.getString(8),rs.getString(9),rs.getString(10));
                    listaEventos.add(evento);
                }
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return listaEventos;
    }

    public ArrayList<Evento> listarEventosFinalizadosxActividad (String idActividad) { //user -> FINALIZADOS / PRÓXIMOS

        ArrayList<Evento> listaEventos = new ArrayList<>();
        String sql = "SELECT *, concat(fecha,\" \", hora) FROM evento where idActividad = ? and concat(fecha,\" \", hora) < now() order by concat(fecha,\" \", hora) asc";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1,idActividad);

            try(ResultSet rs = pstmt.executeQuery()){

                while (rs.next()){
                    Evento evento = new Evento(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getTime(4),rs.getDate(5),rs.getString(6),rs.getBinaryStream(7),rs.getString(8),rs.getString(9),rs.getString(10));
                    listaEventos.add(evento);
                }
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return listaEventos;
    }

    public ArrayList<Evento> listarEventosProximosxActividad (String idActividad) { //user -> FINALIZADOS / PRÓXIMOS

        ArrayList<Evento> listaEventos = new ArrayList<>();
        String sql = "SELECT *, concat(fecha,\" \", hora) FROM evento where idActividad = ? and concat(fecha,\" \", hora) > now() order by concat(fecha,\" \", hora) asc";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1,idActividad);

            try(ResultSet rs = pstmt.executeQuery()){

                while (rs.next()){
                    Evento evento = new Evento(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getTime(4),rs.getDate(5),rs.getString(6),rs.getBinaryStream(7),rs.getString(8),rs.getString(9),rs.getString(10));
                    listaEventos.add(evento);
                }
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return listaEventos;
    }


    // PARA BUSCAR CON EL BUSCADOR
    public ArrayList<Evento> buscarXtitulo(String Act, String palabraintroducida) {

        ArrayList<Evento> listaEventos = new ArrayList();
        //Conexión a la DB
        String sql = "SELECT * FROM proyectoweb.evento WHERE LOWER(titulo) LIKE LOWER(?) AND idActividad = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, "%" + palabraintroducida + "%");
            pstmt.setString(2, Act);

            try (ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    Evento evento = new Evento(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getTime(4), rs.getDate(5), rs.getString(6), rs.getBinaryStream(7), rs.getString(8), rs.getString(9), rs.getString(10));
                    listaEventos.add(evento);
                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEventos;
    }

    public ArrayList<Evento> buscarXtituloEz(String palabraintroducida) {

        ArrayList<Evento> listaEventos = new ArrayList();
        //Conexión a la DB
        String sql = "SELECT * FROM proyectoweb.evento WHERE LOWER(titulo) LIKE LOWER(?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, "%" + palabraintroducida + "%");

            try (ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    Evento evento = new Evento(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getTime(4), rs.getDate(5), rs.getString(6), rs.getBinaryStream(7), rs.getString(8), rs.getString(9), rs.getString(10));
                    listaEventos.add(evento);
                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEventos;
    }


    public Evento buscarEventoId(String id) {

        Evento evento = null;
        //Conexión a la DB
        String sql = "SELECT * FROM proyectoweb.evento WHERE idEvento = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, id);


            try (ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    evento = new Evento(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getTime(4), rs.getDate(5), rs.getString(6), rs.getBinaryStream(7), rs.getString(8), rs.getString(9), rs.getString(10));
                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return evento;
    }


    // ELIMINAR EVENTO
    public void eliminarEvento(String idEvento){

        String sql ="delete from evento where idEvento = ?";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,idEvento);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void eliminarAlbumFotosDeEvento(String idEvento){

        String sql ="delete from fotos_album where idEvento = ?";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,idEvento);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void eliminarInscripcionDeEvento(String idEvento){

        String sql ="delete from inscripcion where idEvento=?";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,idEvento);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }



    }

    public void Inscribirse_a_un_evento(String idEvento, int idUsuario) {
        String insertSql = "INSERT INTO inscripcion (idEvento, Usuario, idRol) VALUES (?, ?, 'UNSET')";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(insertSql)) {

            pstmt.setString(1, idEvento);
            pstmt.setInt(2, idUsuario);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }






    // CREAR EVENTO

    public void crearEvento(String titulo, String subTitulo,String hora, String fecha, String lugar ,Imagen imagen, String descripcion,String idActividad){

        String sql = "INSERT INTO evento (titulo, SubTitulo, hora, fecha, lugar, imagen, descripcion, idEstado, idActividad) \n" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, 'PUBLIC', ?);";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, titulo);
            pstmt.setString(2, subTitulo);
            pstmt.setString(3, hora);
            pstmt.setString(4, fecha);
            pstmt.setString(5, lugar);
            pstmt.setBlob(6, imagen.getImagen());
            pstmt.setString(7, descripcion);
            pstmt.setString(8, idActividad);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }



    public void crearAlbumFotos(ArrayList<Part> AlbumFotos, String idEvento) throws IOException {


        for(Part part : AlbumFotos){

            InputStream inputStream2 = part.getInputStream();
            Imagen imagen = new Imagen();
            imagen.setImagen(inputStream2);


            String sql = "INSERT INTO fotos_album (idEvento, Foto) \n" +
                    "VALUES (?, ?);";

            try(Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)){

                pstmt.setString(1, idEvento);
                pstmt.setBlob(2, imagen.getImagen());

                pstmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }

    }


    // EDITAR EVENTO
    public void actualizarEvento(String idEvento, String titulo, String subTitulo, String hora, String fecha, String lugar, Imagen imagen, String descripcion, String idActividad) {
        String sql = "UPDATE evento SET titulo = ?, SubTitulo = ?, hora = ?, fecha = ?, Lugar = ?, imagen = ?, descripcion = ?, idActividad = ? WHERE idevento = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, titulo);
            pstmt.setString(2, subTitulo);
            pstmt.setString(3, hora);
            pstmt.setString(4, fecha);
            pstmt.setString(5, lugar);
            pstmt.setBlob(6, imagen.getImagen());
            pstmt.setString(7, descripcion);
            pstmt.setString(8, idActividad);
            pstmt.setString(9, idEvento);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarEventoNoImagen(String idEvento, String titulo, String subTitulo, String hora, String fecha, String lugar, String descripcion, String idActividad) {
        String sql = "UPDATE evento SET titulo = ?, SubTitulo = ?, hora = ?, fecha = ?, Lugar = ?, descripcion = ?, idActividad = ? WHERE idevento = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, titulo);
            pstmt.setString(2, subTitulo);
            pstmt.setString(3, hora);
            pstmt.setString(4, fecha);
            pstmt.setString(5, lugar);
            pstmt.setString(6, descripcion);
            pstmt.setString(7, idActividad);
            pstmt.setString(8, idEvento);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Evento> listarEventosInscritos(int idUsuario) {
        String sql = "SELECT e.* FROM evento e " +
                "INNER JOIN inscripcion i ON e.idEvento = i.idEvento " +
                "WHERE i.idUsuario = ?";

        ArrayList<Evento> eventosInscritos = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int idEvento = rs.getInt("idEvento");
                    String titulo = rs.getString("titulo");
                    String subTitulo = rs.getString("subTitulo");
                    Time hora = rs.getTime("hora");
                    Date fecha = rs.getDate("fecha");
                    String lugar = rs.getString("lugar");
                    InputStream imagenStream = rs.getBinaryStream("imagen");
                    String descripcion = rs.getString("descripcion");
                    String idEstado = rs.getString("idEstado");
                    String idActividad = rs.getString("idActividad");

                    Evento evento = new Evento(idEvento, titulo, subTitulo, hora, fecha, lugar, imagenStream,descripcion, idEstado, idActividad);
                    eventosInscritos.add(evento);

                    // Cerrar el InputStream después de su uso
                    if (imagenStream != null) {
                        imagenStream.close();
                    }
                }
            }

        } catch (SQLException | IOException e) {
            // Manejar la excepción de manera adecuada, log, lanzar excepción personalizada, etc.
            e.printStackTrace();
        }

        return eventosInscritos;
    }

    public ArrayList<Evento> listarEventosInscritosbienhecho(int idUsuario) {
        String sql = "SELECT e.* FROM evento e " +
                "INNER JOIN inscripcion i ON e.idEvento = i.idEvento " +
                "INNER JOIN usuarios u ON u.idUsuario = i.Usuario\n " +
                "WHERE u.idUsuario = ?";

        ArrayList<Evento> eventosInscritos = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int idEvento = rs.getInt("idEvento");
                    String titulo = rs.getString("titulo");
                    String subTitulo = rs.getString("subTitulo");
                    Time hora = rs.getTime("hora");
                    Date fecha = rs.getDate("fecha");
                    String lugar = rs.getString("lugar");
                    InputStream imagenStream = rs.getBinaryStream("imagen");
                    String descripcion = rs.getString("descripcion");
                    String idEstado = rs.getString("idEstado");
                    String idActividad = rs.getString("idActividad");

                    Evento evento = new Evento(idEvento, titulo, subTitulo, hora, fecha, lugar, imagenStream,descripcion, idEstado, idActividad);
                    System.out.println(evento.getTitulo());
                    eventosInscritos.add(evento);

                    // Cerrar el InputStream después de su uso
                    if (imagenStream != null) {
                        imagenStream.close();
                    }
                }
            }

        } catch (SQLException | IOException e) {
            // Manejar la excepción de manera adecuada, log, lanzar excepción personalizada, etc.
            e.printStackTrace();
        }

        return eventosInscritos;
    }

}


package com.example.proyectoweb.model.daos;

import com.example.proyectoweb.model.beans.Donaciones;
import com.example.proyectoweb.model.beans.Imagen;
import com.example.proyectoweb.model.beans.Usuario;
import com.mysql.cj.jdbc.Blob;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class DonacionesDao extends DaoBase{

    /*public ArrayList<Donaciones> listar(){

        ArrayList<Donaciones> listaDonacionesAlumno = new ArrayList<>();
        String sql = "SELECT don.idUsuario, don.idRegistro_Donaciones, u.nombres, u.apellidos, don.comprobante, don.monto, don.comprobado, don.fecha, u.idRolAcademico FROM registro_donaciones don INNER JOIN usuarios u on (u.idUsuario = don.idUsuario)";

        try(Connection conn = getConnection();
            Statement stmt = conn.createStatement();){

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                Donaciones donacionAlumno = new Donaciones();
                donacionAlumno.setIdUsuario(rs.getInt(1));
                donacionAlumno.setIdDonaciones(rs.getInt(2));
                donacionAlumno.setNombres(rs.getString(3));
                donacionAlumno.setApellidos(rs.getString(4));
                donacionAlumno.setComprobante((Blob) rs.getBlob(5));
                donacionAlumno.setMonto(rs.getDouble(6));
                donacionAlumno.setComprobado(rs.getInt(7)); // Ahora devuelve un INT
                donacionAlumno.setFechaDonacion(rs.getString(8));
                donacionAlumno.setIdRolAcademico(rs.getString(9));

                listaDonacionesAlumno.add(donacionAlumno);
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return listaDonacionesAlumno;
    }*/
    public ArrayList<Donaciones> listarTodasDonaciones() {
        // Consulta SQL para obtener todas las donaciones
        String sql = "SELECT don.idUsuario, don.idRegistro_Donaciones, u.nombres, u.apellidos, don.comprobante, don.monto, don.comprobado, don.fecha, u.idRolAcademico " +
                "FROM registro_donaciones don INNER JOIN usuarios u ON (u.idUsuario = don.idUsuario)";

        ArrayList<Donaciones> listaDonaciones = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Donaciones donacion = new Donaciones();

                // Mapear los datos del resultado a un objeto Donaciones.
                donacion.setIdUsuario(rs.getInt(1));
                donacion.setIdDonaciones(rs.getInt(2));
                donacion.setNombres(rs.getString(3));
                donacion.setApellidos(rs.getString(4));
                donacion.setComprobante(rs.getBinaryStream(5));
                donacion.setMonto(rs.getDouble(6));
                donacion.setComprobado(rs.getInt(7));
                donacion.setFechaDonacion(rs.getString(8));
                donacion.setIdRolAcademico(rs.getString(9));

                listaDonaciones.add(donacion);
            }

        } catch (SQLException e) {
            // Capturar y relanzar la excepción SQLException como RuntimeException.
            throw new RuntimeException(e);
        }

        return listaDonaciones;
    }


    public double sumarDonacionesEstudiantes() {
        double totalDonacionesEstudiantes = 0.0;
        String sql = "SELECT SUM(don.monto) FROM registro_donaciones don INNER JOIN usuarios u on (u.idUsuario = don.idUsuario) WHERE u.idRolAcademico = 'STUDENT'";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                totalDonacionesEstudiantes = rs.getDouble(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return totalDonacionesEstudiantes;
    }


    public double sumarDonacionesEgresados() {
        double totalDonacionesEgresados = 0.0;
        String sql = "SELECT SUM(don.monto) FROM registro_donaciones don INNER JOIN usuarios u on (u.idUsuario = don.idUsuario) WHERE u.idRolAcademico = 'GRADUAT'";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                totalDonacionesEgresados = rs.getDouble(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return totalDonacionesEgresados;
    }


    public ArrayList<Donaciones> listarComprobados(String comprobacionId){
        ArrayList<Donaciones> listaDonaciones = new ArrayList();

        //Conexión a la DB

        String sql = "SELECT don.idUsuario, don.idRegistro_Donaciones, u.nombres, u.apellidos, don.comprobante, don.monto, don.comprobado, don.fecha, u.idRolAcademico  \n" +
                "FROM registro_donaciones don \n" +
                "INNER JOIN usuarios u on (u.idUsuario = don.idUsuario) \n" +
                "where comprobado = ?";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, comprobacionId);

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    Donaciones donacion = new Donaciones();
                    donacion.setIdUsuario(rs.getInt(1));
                    donacion.setIdDonaciones(rs.getInt(2));
                    donacion.setNombres(rs.getString(3));
                    donacion.setApellidos(rs.getString(4));
                    donacion.setComprobante(rs.getBinaryStream(5));
                    donacion.setMonto(rs.getDouble(6));
                    donacion.setComprobado(rs.getInt(7)); // devuelve int
                    donacion.setFechaDonacion(rs.getString(8));
                    donacion.setIdRolAcademico(rs.getString(9));

                    listaDonaciones.add(donacion);

                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return listaDonaciones;

    }



    public Donaciones buscarPorIdDonante(String idDonante){
        Donaciones donacionAlumno =null;

        //Conexión a la DB

        String sql = "SELECT don.idUsuario, don.idRegistro_Donaciones, u.nombres, u.apellidos, don.comprobante, don.monto, don.comprobado, don.fecha, u.idRolAcademico FROM registro_donaciones don INNER JOIN usuarios u on (u.idUsuario = don.idUsuario) where don.idUsuario=?";


        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, idDonante);

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    donacionAlumno = new Donaciones();
                    donacionAlumno.setIdUsuario(rs.getInt(1));
                    donacionAlumno.setIdDonaciones(rs.getInt(2));
                    donacionAlumno.setNombres(rs.getString(3));
                    donacionAlumno.setApellidos(rs.getString(4));
                    donacionAlumno.setComprobante(rs.getBinaryStream(5));
                    donacionAlumno.setMonto(rs.getDouble(6));
                    donacionAlumno.setComprobado(rs.getInt(7)); // Ahora devuelve un INT
                    donacionAlumno.setFechaDonacion(rs.getString(8));
                    donacionAlumno.setIdRolAcademico(rs.getString(9));

                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return donacionAlumno;

    }

    public void actualizarDonacion(int donacionId, double monto, String fecha, String hora, int estadoDonacion){

        String sql ="update registro_donaciones set monto= ? , fecha = ? , comprobado = ? where idRegistro_Donaciones = ? ";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setDouble(1,monto);

            String fechaHora = fecha + " " + hora; //Se coloca asi para poder tener compatibilidad con la db
            pstmt.setString(2,fechaHora);
            pstmt.setInt(3,estadoDonacion);
            pstmt.setInt(4,donacionId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }


    public void listarImagenDonacionPorUsuario(HttpServletResponse response, String idDonacion) {

        //Conexión a la DB

        String sql = "SELECT * FROM registro_donaciones WHERE idRegistro_Donaciones = ?";
        response.setContentType("image/*");

        try (
                Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, idDonacion);

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

    public ArrayList<Donaciones> donacionesPorUsuario(Integer idUsuario){
        ArrayList<Donaciones> list = new ArrayList<>();

        String sql = "SELECT * FROM registro_donaciones where idUsuario = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setInt(1, idUsuario);

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    Donaciones donacionAlumno = new Donaciones();
                    donacionAlumno.setIdDonaciones(rs.getInt(1));
                    donacionAlumno.setIdUsuario(rs.getInt(2));
                    donacionAlumno.setComprobante(rs.getBinaryStream(3));
                    donacionAlumno.setMonto(rs.getDouble(4));
                    donacionAlumno.setComprobado(rs.getInt(5));
                    donacionAlumno.setFechaDonacion(rs.getString(6));
                    list.add(donacionAlumno);

                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return list;

    }



    public ArrayList<Donaciones> listarDonacionesPorComprobacionPaginacion(int comprobado, int limit, int offset) {
        ArrayList<Donaciones> listaDonaciones = new ArrayList<>();

        // Consulta SQL para obtener donaciones por estado de comprobación con límite y desplazamiento.
        String sql = "SELECT don.idUsuario, don.idRegistro_Donaciones, u.nombres, u.apellidos, don.comprobante, don.monto, don.comprobado, don.fecha, u.idRolAcademico " +
                "FROM registro_donaciones don INNER JOIN usuarios u ON (u.idUsuario = don.idUsuario) " +
                "WHERE don.comprobado = ? LIMIT ? OFFSET ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, comprobado);
            pstmt.setInt(2, limit);
            pstmt.setInt(3, offset);

            try (ResultSet rs = pstmt.executeQuery()) {
                // Procesar los resultados de la consulta.
                while (rs.next()) {
                    Donaciones donacion = new Donaciones();

                    // Mapear los datos del resultado a un objeto Donaciones.
                    donacion.setIdUsuario(rs.getInt(1));
                    donacion.setIdDonaciones(rs.getInt(2));
                    donacion.setNombres(rs.getString(3));
                    donacion.setApellidos(rs.getString(4));
                    donacion.setComprobante(rs.getBinaryStream(5));
                    donacion.setMonto(rs.getDouble(6));
                    donacion.setComprobado(rs.getInt(7));
                    donacion.setFechaDonacion(rs.getString(8));
                    donacion.setIdRolAcademico(rs.getString(9));

                    listaDonaciones.add(donacion);
                }
            }
        } catch (SQLException e) {
            // Capturar y relanzar la excepción SQLException como RuntimeException.
            throw new RuntimeException(e);
        }

        return listaDonaciones;
    }

    public void nuevaDonacion(Integer idUsuario, String monto, Imagen foto){

        LocalDateTime fechaHoraActual = LocalDateTime.now();
        DateTimeFormatter formato = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String fechaHoraFormateada = fechaHoraActual.format(formato);

        String sql ="insert into registro_donaciones (idUsuario, comprobante, monto, comprobado, fecha ) value (?,?,?,?,?) ";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1,idUsuario);
            pstmt.setBlob(2,foto.getImagen());
            pstmt.setString(3,monto);
            pstmt.setInt(4,0);
            pstmt.setString(5,fechaHoraFormateada);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public Double obtenerMontoTotalUsuario(int idUsuario){

        String sql = "SELECT * FROM usuarios where idUsuario = ?";

        Double montoTotalCurrent = 0.0;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setInt(1, idUsuario);

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    montoTotalCurrent = rs.getDouble(14);

                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return montoTotalCurrent;

    }

    public void actualizarMontoTotal(Double montoNuevo, Usuario usuario, Double montoAntiguo){ //Se verifica también el kit

        String sql ="update usuarios set monto_total = ? where idUsuario = ? ";

        Double montoActualizado = montoAntiguo + montoNuevo;

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setDouble(1, montoActualizado);
            pstmt.setInt(2, usuario.getIdUsuario());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // Verificamos el Monto Total del Usuario y si este pasa los 100 o los iguala para obtener el kit teleco:
        if(montoActualizado >= 100 && usuario.getIdRolAcademico().equals("GRADUAT")){

            String sql2 = "update usuarios set kit_teleco = ? where idUsuario = ?";

            int enable = 1;

            try(Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql2)) {

                pstmt.setDouble(1, enable);
                pstmt.setInt(2, usuario.getIdUsuario());
                pstmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }


        }


    }

    public int obtenerIdUserxIdDonation(int idDonation){

        String sql = "SELECT * FROM registro_donaciones where idRegistro_Donaciones = ?";

        int idUser = 0;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setInt(1, idDonation);

            try(ResultSet rs = pstmt.executeQuery()){

                while(rs.next()){

                    idUser = rs.getInt(2);

                }

            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return idUser;

    }


    /*public ArrayList<Donaciones> listarDonacionesPaginacion(Integer offset){

        ArrayList<Donaciones> listaDonacionesPaginacion = new ArrayList<>();
        String sql = "SELECT don.idUsuario, don.idRegistro_Donaciones, u.nombres, u.apellidos, don.comprobante, don.monto, don.comprobado, don.fecha, u.idRolAcademico FROM registro_donaciones don INNER JOIN usuarios u on (u.idUsuario = don.idUsuario) limit 10 offset ?";

        try(Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);){

            pstmt.setInt(1,  (int) offset);

            try(ResultSet rs = pstmt.executeQuery()){

                while (rs.next()){
                    Donaciones donacionAlumno = new Donaciones();
                    donacionAlumno.setIdUsuario(rs.getInt(1));
                    donacionAlumno.setIdDonaciones(rs.getInt(2));
                    donacionAlumno.setNombres(rs.getString(3));
                    donacionAlumno.setApellidos(rs.getString(4));
                    donacionAlumno.setComprobante((Blob) rs.getBlob(5));
                    donacionAlumno.setMonto(rs.getDouble(6));
                    donacionAlumno.setComprobado(rs.getInt(7)); // Ahora devuelve un INT
                    donacionAlumno.setFechaDonacion(rs.getString(8));
                    donacionAlumno.setIdRolAcademico(rs.getString(9));

                    listaDonacionesPaginacion.add(donacionAlumno);
                }

            }


        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return listaDonacionesPaginacion;
    }*/
}

